module SYS_TOP 
 (
 input   wire                          RST_N,
 input   wire                          UART_CLK,
 input   wire                          REF_CLK,
 input   wire                          UART_RX_IN,
 output  wire                          UART_TX_O,
 output  wire                          parity_error,
 output  wire                          framing_error
);

wire [7:0] UART_CONFIG, Rd_D, Wr_D, Op_A, Op_B, RX_OUT_P, RX_OUT_SYNC, RD_DATA, WR_DATA;
wire [15:0] ALU_OUT;
wire RX_VLD, RX_VLD_SYNC, FIFO_FULL, WR_INC, WR_INC_PLSE, RD_INC, ALU_EN, RdEn,
     WrEn, ALU_OUT_VLD, RD_D_VLD, F_EMPTY, BUSY, clk_dEN;
wire GATE_EN, TX_CLK, RX_CLK, CLK_ALU, SYNC_RST1, SYNC_RST2; 
wire [3:0] Address, ALU_FUN;
wire [7:0] div_ratio;
wire [7:0] Pre_div;

//////
//////////////////// Reset synchronizers /////////////////////
//////

RST_SYNC RST_SYNC1_INST (
.RST(RST_N),
.CLK(REF_CLK),
.SYNC_RST(SYNC_RST1)
);

RST_SYNC RST_SYNC2_INST  (
.RST(RST_N),
.CLK(UART_CLK),
.SYNC_RST(SYNC_RST2)
);


//////
///////////////////// Data Synchronizers /////////////////////
//////
DataSynchronizer #(.BUS_WIDTH(8)) DATA_SYNC_INST  (
.Unsync_bus(RX_OUT_P),
.bus_enable(RX_VLD),
.CLK(REF_CLK),
.RST(SYNC_RST1),
.sync_bus(RX_OUT_SYNC),
.enable_pulse(RX_VLD_SYNC)
);

//////
///////////////////////// Async FIFO /////////////////////////
//////
FIFO_TOP #(.DATA_WIDTH(8)) FIFO_INST  (
.wclk(REF_CLK),
.wrst_n(SYNC_RST1),
.winc(WR_INC),
.rclk(TX_CLK),
.rrst_n(SYNC_RST2),
.rinc(RD_INC),
.wdata(WR_DATA),
.wfull(FIFO_FULL),
.rdata(RD_DATA),
.empty(F_EMPTY)
);

//////
//////////////////////// Pulse Generator /////////////////////
//////
PULSE_GEN PLSE_GEN_INST  (
.clk(TX_CLK),
.rst(SYNC_RST2),
.lvl_sig(BUSY),
.pulse_sig(RD_INC)
);

//////
//////////// Clock Divider for UART_TX Clock /////////////////
//////
ClkDiv  CLK_DIV_TX_INST  (
.i_ref_clk(UART_CLK),
.i_rst_n(SYNC_RST2),
.i_clk_en(clk_dEN),
.i_div_ratio(div_ratio),
.o_div_clk(TX_CLK)
);

//////
/////////////////////// Custom Mux Clock /////////////////////
//////
CLKDIV_MUX  PRE_MUX_INST  (
.IN(UART_CONFIG[7:2]),
.OUT(Pre_div)
);

//////
//////////// Clock Divider for UART_RX Clock /////////////////
//////
ClkDiv  CLK_DIV_RX_INST  (
.i_ref_clk(UART_CLK),
.i_rst_n(SYNC_RST2),
.i_clk_en(clk_dEN),
.i_div_ratio(Pre_div),
.o_div_clk(RX_CLK)
);

//////
/////////////////////////// UART /////////////////////////////
//////
UART #(.DATA_WIDTH(8)) UART_INST  (
.RST(SYNC_RST2),
.TX_CLK(TX_CLK),
.RX_CLK(RX_CLK),
.RX_IN_S(UART_RX_IN),
.RX_OUT_P(RX_OUT_P), 
.RX_OUT_V(RX_VLD),
.TX_IN_P(RD_DATA), 
.TX_IN_V(!F_EMPTY), 
.TX_OUT_S(UART_TX_O),
.TX_OUT_V(BUSY), 
.Prescale(UART_CONFIG[7:2]), 
.parity_enable(UART_CONFIG[0]),
.parity_type(UART_CONFIG[1]),
.parity_error(parity_error),
.framing_error(framing_error)
);

//////
//////////////////// System Controller ///////////////////////
//////
SYS_CTRL  SYS_CTRL_INST  (
.ALU_OUT(ALU_OUT),
.OUT_Valid(ALU_OUT_VLD),
.RX_P_Data(RX_OUT_SYNC),
.RX_D_VLD(RX_VLD_SYNC),
.FIFO_FULL(FIFO_FULL),
.RdData(Rd_D),
.RdData_Valid(RD_D_VLD),
.clk(REF_CLK),
.rst_n(SYNC_RST1),
.ALU_EN(ALU_EN),
.ALU_FUN(ALU_FUN),
.CLK_EN(GATE_EN),
.Address(Address),
.WrEn(WrEn),
.RdEn(RdEn),
.WrData(Wr_D),
.WR_DATA(WR_DATA),
.WR_INC(WR_INC),
.clk_div_en(clk_dEN)
);

//////
/////////////////////// Register File ////////////////////////
//////
RegFile #(.WIDTH(8), .DEPTH(16)) REG_FILE_INST  (
.RdEn(RdEn),
.WrEn(WrEn),
.CLK(REF_CLK),
.RST(SYNC_RST1),
.Address(Address),
.WrData(Wr_D),
.RdData(Rd_D),
.RdData_VLD(RD_D_VLD),
.REG0(Op_A),
.REG1(Op_B),
.REG2(UART_CONFIG),
.REG3(div_ratio) 
);

//////
//////////////////////////// ALU /////////////////////////////
//////
ALU #(.OPER_WIDTH(8)) ALU_INST  (
.A(Op_A),
.B(Op_B),
.ALU_FUN(ALU_FUN),
.ALU_CLK(CLK_ALU),
.RST(SYNC_RST1),
.EN(ALU_EN),
.ALU_OUT(ALU_OUT),
.OUT_VALID(ALU_OUT_VLD)
);

//////
///////////////////////// Clock Gating ///////////////////////
//////
CLK_GATE CLK_GATE_INST  (
.CLK_EN(GATE_EN),
.CLK(REF_CLK),
.GATED_CLK(CLK_ALU)
);


endmodule
