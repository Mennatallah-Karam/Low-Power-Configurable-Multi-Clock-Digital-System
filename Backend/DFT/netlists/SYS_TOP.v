/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Wed Oct 23 23:59:51 2024
/////////////////////////////////////////////////////////////


module mux2X1_1 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  CLKMX2X4M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_4 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_3 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_2 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_0 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_6 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_5 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module RST_SYNC_test_1 ( CLK, RST, SYNC_RST, test_si, test_se );
  input CLK, RST, test_si, test_se;
  output SYNC_RST;
  wire   \FFs[0] ;

  SDFFRQX2M \FFs_reg[1]  ( .D(\FFs[0] ), .SI(\FFs[0] ), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(SYNC_RST) );
  SDFFRQX2M \FFs_reg[0]  ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(\FFs[0] ) );
endmodule


module RST_SYNC_test_0 ( CLK, RST, SYNC_RST, test_si, test_se );
  input CLK, RST, test_si, test_se;
  output SYNC_RST;
  wire   \FFs[0] ;

  SDFFRQX2M \FFs_reg[0]  ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(\FFs[0] ) );
  SDFFRHQX8M \FFs_reg[1]  ( .D(\FFs[0] ), .SI(\FFs[0] ), .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
endmodule


module DataSynchronizer_BUS_WIDTH8 ( Unsync_bus, bus_enable, CLK, RST, 
        sync_bus, enable_pulse );
  input [7:0] Unsync_bus;
  output [7:0] sync_bus;
  input bus_enable, CLK, RST;
  output enable_pulse;
  wire   sync_enable_F3, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] sync_enable_FF;

  DFFRQX2M sync_enable_F3_reg ( .D(sync_enable_FF[1]), .CK(CLK), .RN(RST), .Q(
        sync_enable_F3) );
  DFFRQX2M \sync_bus_reg[7]  ( .D(n9), .CK(CLK), .RN(RST), .Q(sync_bus[7]) );
  DFFRQX2M \sync_enable_FF_reg[1]  ( .D(sync_enable_FF[0]), .CK(CLK), .RN(RST), 
        .Q(sync_enable_FF[1]) );
  DFFRQX2M \sync_bus_reg[6]  ( .D(n8), .CK(CLK), .RN(RST), .Q(sync_bus[6]) );
  DFFRQX2M \sync_bus_reg[5]  ( .D(n7), .CK(CLK), .RN(RST), .Q(sync_bus[5]) );
  DFFRQX2M \sync_bus_reg[4]  ( .D(n6), .CK(CLK), .RN(RST), .Q(sync_bus[4]) );
  DFFRQX2M \sync_bus_reg[3]  ( .D(n5), .CK(CLK), .RN(RST), .Q(sync_bus[3]) );
  DFFRQX2M \sync_bus_reg[0]  ( .D(n2), .CK(CLK), .RN(RST), .Q(sync_bus[0]) );
  DFFRQX2M \sync_bus_reg[2]  ( .D(n4), .CK(CLK), .RN(RST), .Q(sync_bus[2]) );
  DFFRQX2M \sync_bus_reg[1]  ( .D(n3), .CK(CLK), .RN(RST), .Q(sync_bus[1]) );
  DFFRQX2M enable_pulse_reg ( .D(n10), .CK(CLK), .RN(RST), .Q(enable_pulse) );
  DFFRQX2M \sync_enable_FF_reg[0]  ( .D(bus_enable), .CK(CLK), .RN(RST), .Q(
        sync_enable_FF[0]) );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(sync_enable_F3), .B(sync_enable_FF[1]), .Y(n1) );
  AO22X1M U5 ( .A0(Unsync_bus[0]), .A1(n10), .B0(sync_bus[0]), .B1(n1), .Y(n2)
         );
  AO22X1M U6 ( .A0(Unsync_bus[1]), .A1(n10), .B0(sync_bus[1]), .B1(n1), .Y(n3)
         );
  AO22X1M U7 ( .A0(Unsync_bus[2]), .A1(n10), .B0(sync_bus[2]), .B1(n1), .Y(n4)
         );
  AO22X1M U8 ( .A0(Unsync_bus[3]), .A1(n10), .B0(sync_bus[3]), .B1(n1), .Y(n5)
         );
  AO22X1M U9 ( .A0(Unsync_bus[4]), .A1(n10), .B0(sync_bus[4]), .B1(n1), .Y(n6)
         );
  AO22X1M U10 ( .A0(Unsync_bus[5]), .A1(n10), .B0(sync_bus[5]), .B1(n1), .Y(n7) );
  AO22X1M U11 ( .A0(Unsync_bus[6]), .A1(n10), .B0(sync_bus[6]), .B1(n1), .Y(n8) );
  AO22X1M U12 ( .A0(Unsync_bus[7]), .A1(n10), .B0(sync_bus[7]), .B1(n1), .Y(n9) );
endmodule


module FIFO_WR_FIFO_DEPTH8_ADDR_WIDTH4 ( wdata, wclk, wrst_n, winc, rptr_gray, 
        wptr_gray, waddr, wclken, wfull );
  input [7:0] wdata;
  input [3:0] rptr_gray;
  output [3:0] wptr_gray;
  output [2:0] waddr;
  input wclk, wrst_n, winc;
  output wclken, wfull;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;

  DFFRQX2M \wptr_reg[3]  ( .D(n11), .CK(wclk), .RN(wrst_n), .Q(wptr_gray[3])
         );
  DFFRQX2M \wptr_reg[2]  ( .D(n12), .CK(wclk), .RN(wrst_n), .Q(waddr[2]) );
  DFFRX1M \wptr_reg[0]  ( .D(n14), .CK(wclk), .RN(wrst_n), .Q(waddr[0]), .QN(
        n1) );
  DFFRQX2M \wptr_reg[1]  ( .D(n13), .CK(wclk), .RN(wrst_n), .Q(waddr[1]) );
  INVX2M U3 ( .A(n3), .Y(wclken) );
  NAND2X2M U4 ( .A(winc), .B(n2), .Y(n3) );
  INVX2M U5 ( .A(n2), .Y(wfull) );
  XNOR2X2M U6 ( .A(wptr_gray[1]), .B(rptr_gray[1]), .Y(n7) );
  XNOR2X2M U7 ( .A(n1), .B(waddr[1]), .Y(wptr_gray[0]) );
  NOR2X2M U8 ( .A(n3), .B(n1), .Y(n6) );
  XNOR2X2M U9 ( .A(wptr_gray[3]), .B(n4), .Y(n11) );
  NAND2BX2M U10 ( .AN(n5), .B(waddr[2]), .Y(n4) );
  NAND4X2M U11 ( .A(n7), .B(n8), .C(n9), .D(n10), .Y(n2) );
  CLKXOR2X2M U12 ( .A(wptr_gray[3]), .B(rptr_gray[3]), .Y(n10) );
  XNOR2X2M U13 ( .A(wptr_gray[0]), .B(rptr_gray[0]), .Y(n8) );
  CLKXOR2X2M U14 ( .A(rptr_gray[2]), .B(wptr_gray[2]), .Y(n9) );
  NAND2X2M U15 ( .A(n6), .B(waddr[1]), .Y(n5) );
  CLKXOR2X2M U16 ( .A(wptr_gray[3]), .B(waddr[2]), .Y(wptr_gray[2]) );
  CLKXOR2X2M U17 ( .A(waddr[1]), .B(waddr[2]), .Y(wptr_gray[1]) );
  XNOR2X2M U18 ( .A(waddr[2]), .B(n5), .Y(n12) );
  CLKXOR2X2M U19 ( .A(waddr[1]), .B(n6), .Y(n13) );
  CLKXOR2X2M U20 ( .A(n1), .B(n3), .Y(n14) );
endmodule


module FIFO_RD_FIFO_DEPTH8_ADDR_WIDTH4 ( wptr_gray, rclk, rrst_n, rinc, raddr, 
        rptr_gray, empty );
  input [3:0] wptr_gray;
  output [2:0] raddr;
  output [3:0] rptr_gray;
  input rclk, rrst_n, rinc;
  output empty;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;

  DFFRQX2M \rptr_reg[3]  ( .D(n11), .CK(rclk), .RN(rrst_n), .Q(rptr_gray[3])
         );
  DFFRX1M \rptr_reg[0]  ( .D(n14), .CK(rclk), .RN(rrst_n), .Q(raddr[0]), .QN(
        n1) );
  DFFRQX2M \rptr_reg[2]  ( .D(n12), .CK(rclk), .RN(rrst_n), .Q(raddr[2]) );
  DFFRQX2M \rptr_reg[1]  ( .D(n13), .CK(rclk), .RN(rrst_n), .Q(raddr[1]) );
  INVX2M U3 ( .A(n6), .Y(empty) );
  XNOR2X2M U4 ( .A(rptr_gray[1]), .B(wptr_gray[1]), .Y(n7) );
  XNOR2X2M U5 ( .A(n1), .B(raddr[1]), .Y(rptr_gray[0]) );
  NOR2X2M U6 ( .A(n5), .B(n1), .Y(n4) );
  XNOR2X2M U7 ( .A(rptr_gray[3]), .B(n2), .Y(n11) );
  NAND2BX2M U8 ( .AN(n3), .B(raddr[2]), .Y(n2) );
  NAND4X2M U9 ( .A(n7), .B(n8), .C(n9), .D(n10), .Y(n6) );
  XNOR2X2M U10 ( .A(rptr_gray[3]), .B(wptr_gray[3]), .Y(n9) );
  XNOR2X2M U11 ( .A(rptr_gray[2]), .B(wptr_gray[2]), .Y(n10) );
  XNOR2X2M U12 ( .A(rptr_gray[0]), .B(wptr_gray[0]), .Y(n8) );
  NAND2X2M U13 ( .A(n4), .B(raddr[1]), .Y(n3) );
  NAND2X2M U14 ( .A(rinc), .B(n6), .Y(n5) );
  CLKXOR2X2M U15 ( .A(raddr[1]), .B(raddr[2]), .Y(rptr_gray[1]) );
  CLKXOR2X2M U16 ( .A(rptr_gray[3]), .B(raddr[2]), .Y(rptr_gray[2]) );
  XNOR2X2M U17 ( .A(raddr[2]), .B(n3), .Y(n12) );
  CLKXOR2X2M U18 ( .A(raddr[1]), .B(n4), .Y(n13) );
  CLKXOR2X2M U19 ( .A(n1), .B(n5), .Y(n14) );
endmodule


module DF_SYNC_SYNC_WIDTH4_0 ( RST, CLK, async_signal, sync_signal );
  input [3:0] async_signal;
  output [3:0] sync_signal;
  input RST, CLK;

  wire   [3:0] sync_ff1;

  DFFRQX2M \sync_ff2_reg[1]  ( .D(sync_ff1[1]), .CK(CLK), .RN(RST), .Q(
        sync_signal[1]) );
  DFFRQX2M \sync_ff2_reg[0]  ( .D(sync_ff1[0]), .CK(CLK), .RN(RST), .Q(
        sync_signal[0]) );
  DFFRQX2M \sync_ff2_reg[2]  ( .D(sync_ff1[2]), .CK(CLK), .RN(RST), .Q(
        sync_signal[2]) );
  DFFRQX2M \sync_ff2_reg[3]  ( .D(sync_ff1[3]), .CK(CLK), .RN(RST), .Q(
        sync_signal[3]) );
  DFFRQX2M \sync_ff1_reg[3]  ( .D(async_signal[3]), .CK(CLK), .RN(RST), .Q(
        sync_ff1[3]) );
  DFFRQX2M \sync_ff1_reg[2]  ( .D(async_signal[2]), .CK(CLK), .RN(RST), .Q(
        sync_ff1[2]) );
  DFFRQX2M \sync_ff1_reg[1]  ( .D(async_signal[1]), .CK(CLK), .RN(RST), .Q(
        sync_ff1[1]) );
  DFFRQX2M \sync_ff1_reg[0]  ( .D(async_signal[0]), .CK(CLK), .RN(RST), .Q(
        sync_ff1[0]) );
endmodule


module DF_SYNC_SYNC_WIDTH4_1 ( RST, CLK, async_signal, sync_signal );
  input [3:0] async_signal;
  output [3:0] sync_signal;
  input RST, CLK;

  wire   [3:0] sync_ff1;

  DFFRQX2M \sync_ff2_reg[3]  ( .D(sync_ff1[3]), .CK(CLK), .RN(RST), .Q(
        sync_signal[3]) );
  DFFRQX2M \sync_ff2_reg[2]  ( .D(sync_ff1[2]), .CK(CLK), .RN(RST), .Q(
        sync_signal[2]) );
  DFFRQX2M \sync_ff2_reg[1]  ( .D(sync_ff1[1]), .CK(CLK), .RN(RST), .Q(
        sync_signal[1]) );
  DFFRQX2M \sync_ff2_reg[0]  ( .D(sync_ff1[0]), .CK(CLK), .RN(RST), .Q(
        sync_signal[0]) );
  DFFRQX2M \sync_ff1_reg[3]  ( .D(async_signal[3]), .CK(CLK), .RN(RST), .Q(
        sync_ff1[3]) );
  DFFRQX2M \sync_ff1_reg[2]  ( .D(async_signal[2]), .CK(CLK), .RN(RST), .Q(
        sync_ff1[2]) );
  DFFRQX2M \sync_ff1_reg[1]  ( .D(async_signal[1]), .CK(CLK), .RN(RST), .Q(
        sync_ff1[1]) );
  DFFRQX2M \sync_ff1_reg[0]  ( .D(async_signal[0]), .CK(CLK), .RN(RST), .Q(
        sync_ff1[0]) );
endmodule


module FIFO_MEM_CNTRL_DATA_WIDTH8_FIFO_DEPTH8_ADDR_WIDTH4 ( wdata, waddr, 
        raddr, wclk, rclk, wrst_n, wclken, rdata );
  input [7:0] wdata;
  input [2:0] waddr;
  input [2:0] raddr;
  output [7:0] rdata;
  input wclk, rclk, wrst_n, wclken;
  wire   N10, N11, N12, \fifo_mem[0][7] , \fifo_mem[0][6] , \fifo_mem[0][5] ,
         \fifo_mem[0][4] , \fifo_mem[0][3] , \fifo_mem[0][2] ,
         \fifo_mem[0][1] , \fifo_mem[0][0] , \fifo_mem[1][7] ,
         \fifo_mem[1][6] , \fifo_mem[1][5] , \fifo_mem[1][4] ,
         \fifo_mem[1][3] , \fifo_mem[1][2] , \fifo_mem[1][1] ,
         \fifo_mem[1][0] , \fifo_mem[2][7] , \fifo_mem[2][6] ,
         \fifo_mem[2][5] , \fifo_mem[2][4] , \fifo_mem[2][3] ,
         \fifo_mem[2][2] , \fifo_mem[2][1] , \fifo_mem[2][0] ,
         \fifo_mem[3][7] , \fifo_mem[3][6] , \fifo_mem[3][5] ,
         \fifo_mem[3][4] , \fifo_mem[3][3] , \fifo_mem[3][2] ,
         \fifo_mem[3][1] , \fifo_mem[3][0] , \fifo_mem[4][7] ,
         \fifo_mem[4][6] , \fifo_mem[4][5] , \fifo_mem[4][4] ,
         \fifo_mem[4][3] , \fifo_mem[4][2] , \fifo_mem[4][1] ,
         \fifo_mem[4][0] , \fifo_mem[5][7] , \fifo_mem[5][6] ,
         \fifo_mem[5][5] , \fifo_mem[5][4] , \fifo_mem[5][3] ,
         \fifo_mem[5][2] , \fifo_mem[5][1] , \fifo_mem[5][0] ,
         \fifo_mem[6][7] , \fifo_mem[6][6] , \fifo_mem[6][5] ,
         \fifo_mem[6][4] , \fifo_mem[6][3] , \fifo_mem[6][2] ,
         \fifo_mem[6][1] , \fifo_mem[6][0] , \fifo_mem[7][7] ,
         \fifo_mem[7][6] , \fifo_mem[7][5] , \fifo_mem[7][4] ,
         \fifo_mem[7][3] , \fifo_mem[7][2] , \fifo_mem[7][1] ,
         \fifo_mem[7][0] , n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114;
  assign N10 = raddr[0];
  assign N11 = raddr[1];
  assign N12 = raddr[2];

  DFFRQX2M \fifo_mem_reg[1][7]  ( .D(n76), .CK(wclk), .RN(n100), .Q(
        \fifo_mem[1][7] ) );
  DFFRQX2M \fifo_mem_reg[1][6]  ( .D(n75), .CK(wclk), .RN(n100), .Q(
        \fifo_mem[1][6] ) );
  DFFRQX2M \fifo_mem_reg[1][5]  ( .D(n74), .CK(wclk), .RN(n100), .Q(
        \fifo_mem[1][5] ) );
  DFFRQX2M \fifo_mem_reg[1][4]  ( .D(n73), .CK(wclk), .RN(n100), .Q(
        \fifo_mem[1][4] ) );
  DFFRQX2M \fifo_mem_reg[1][3]  ( .D(n72), .CK(wclk), .RN(n100), .Q(
        \fifo_mem[1][3] ) );
  DFFRQX2M \fifo_mem_reg[1][2]  ( .D(n71), .CK(wclk), .RN(n101), .Q(
        \fifo_mem[1][2] ) );
  DFFRQX2M \fifo_mem_reg[1][1]  ( .D(n70), .CK(wclk), .RN(n101), .Q(
        \fifo_mem[1][1] ) );
  DFFRQX2M \fifo_mem_reg[1][0]  ( .D(n69), .CK(wclk), .RN(n101), .Q(
        \fifo_mem[1][0] ) );
  DFFRQX2M \fifo_mem_reg[5][7]  ( .D(n44), .CK(wclk), .RN(n103), .Q(
        \fifo_mem[5][7] ) );
  DFFRQX2M \fifo_mem_reg[5][6]  ( .D(n43), .CK(wclk), .RN(n103), .Q(
        \fifo_mem[5][6] ) );
  DFFRQX2M \fifo_mem_reg[5][5]  ( .D(n42), .CK(wclk), .RN(n103), .Q(
        \fifo_mem[5][5] ) );
  DFFRQX2M \fifo_mem_reg[5][4]  ( .D(n41), .CK(wclk), .RN(n103), .Q(
        \fifo_mem[5][4] ) );
  DFFRQX2M \fifo_mem_reg[5][3]  ( .D(n40), .CK(wclk), .RN(n103), .Q(
        \fifo_mem[5][3] ) );
  DFFRQX2M \fifo_mem_reg[5][2]  ( .D(n39), .CK(wclk), .RN(n103), .Q(
        \fifo_mem[5][2] ) );
  DFFRQX2M \fifo_mem_reg[5][1]  ( .D(n38), .CK(wclk), .RN(n103), .Q(
        \fifo_mem[5][1] ) );
  DFFRQX2M \fifo_mem_reg[5][0]  ( .D(n37), .CK(wclk), .RN(n103), .Q(
        \fifo_mem[5][0] ) );
  DFFRQX2M \fifo_mem_reg[3][7]  ( .D(n60), .CK(wclk), .RN(n101), .Q(
        \fifo_mem[3][7] ) );
  DFFRQX2M \fifo_mem_reg[3][6]  ( .D(n59), .CK(wclk), .RN(n101), .Q(
        \fifo_mem[3][6] ) );
  DFFRQX2M \fifo_mem_reg[3][5]  ( .D(n58), .CK(wclk), .RN(n102), .Q(
        \fifo_mem[3][5] ) );
  DFFRQX2M \fifo_mem_reg[3][4]  ( .D(n57), .CK(wclk), .RN(n102), .Q(
        \fifo_mem[3][4] ) );
  DFFRQX2M \fifo_mem_reg[3][3]  ( .D(n56), .CK(wclk), .RN(n102), .Q(
        \fifo_mem[3][3] ) );
  DFFRQX2M \fifo_mem_reg[3][2]  ( .D(n55), .CK(wclk), .RN(n102), .Q(
        \fifo_mem[3][2] ) );
  DFFRQX2M \fifo_mem_reg[3][1]  ( .D(n54), .CK(wclk), .RN(n102), .Q(
        \fifo_mem[3][1] ) );
  DFFRQX2M \fifo_mem_reg[3][0]  ( .D(n53), .CK(wclk), .RN(n102), .Q(
        \fifo_mem[3][0] ) );
  DFFRQX2M \fifo_mem_reg[7][7]  ( .D(n28), .CK(wclk), .RN(n104), .Q(
        \fifo_mem[7][7] ) );
  DFFRQX2M \fifo_mem_reg[7][6]  ( .D(n27), .CK(wclk), .RN(n104), .Q(
        \fifo_mem[7][6] ) );
  DFFRQX2M \fifo_mem_reg[7][5]  ( .D(n26), .CK(wclk), .RN(n104), .Q(
        \fifo_mem[7][5] ) );
  DFFRQX2M \fifo_mem_reg[7][4]  ( .D(n25), .CK(wclk), .RN(n104), .Q(
        \fifo_mem[7][4] ) );
  DFFRQX2M \fifo_mem_reg[7][3]  ( .D(n24), .CK(wclk), .RN(n104), .Q(
        \fifo_mem[7][3] ) );
  DFFRQX2M \fifo_mem_reg[7][2]  ( .D(n23), .CK(wclk), .RN(n104), .Q(
        \fifo_mem[7][2] ) );
  DFFRQX2M \fifo_mem_reg[7][1]  ( .D(n22), .CK(wclk), .RN(n104), .Q(
        \fifo_mem[7][1] ) );
  DFFRQX2M \fifo_mem_reg[7][0]  ( .D(n21), .CK(wclk), .RN(n104), .Q(
        \fifo_mem[7][0] ) );
  DFFRQX2M \fifo_mem_reg[2][7]  ( .D(n68), .CK(wclk), .RN(n101), .Q(
        \fifo_mem[2][7] ) );
  DFFRQX2M \fifo_mem_reg[2][6]  ( .D(n67), .CK(wclk), .RN(n101), .Q(
        \fifo_mem[2][6] ) );
  DFFRQX2M \fifo_mem_reg[2][5]  ( .D(n66), .CK(wclk), .RN(n101), .Q(
        \fifo_mem[2][5] ) );
  DFFRQX2M \fifo_mem_reg[2][4]  ( .D(n65), .CK(wclk), .RN(n101), .Q(
        \fifo_mem[2][4] ) );
  DFFRQX2M \fifo_mem_reg[2][3]  ( .D(n64), .CK(wclk), .RN(n101), .Q(
        \fifo_mem[2][3] ) );
  DFFRQX2M \fifo_mem_reg[2][2]  ( .D(n63), .CK(wclk), .RN(n101), .Q(
        \fifo_mem[2][2] ) );
  DFFRQX2M \fifo_mem_reg[2][1]  ( .D(n62), .CK(wclk), .RN(n101), .Q(
        \fifo_mem[2][1] ) );
  DFFRQX2M \fifo_mem_reg[2][0]  ( .D(n61), .CK(wclk), .RN(n101), .Q(
        \fifo_mem[2][0] ) );
  DFFRQX2M \fifo_mem_reg[6][7]  ( .D(n36), .CK(wclk), .RN(n103), .Q(
        \fifo_mem[6][7] ) );
  DFFRQX2M \fifo_mem_reg[6][6]  ( .D(n35), .CK(wclk), .RN(n103), .Q(
        \fifo_mem[6][6] ) );
  DFFRQX2M \fifo_mem_reg[6][5]  ( .D(n34), .CK(wclk), .RN(n103), .Q(
        \fifo_mem[6][5] ) );
  DFFRQX2M \fifo_mem_reg[6][4]  ( .D(n33), .CK(wclk), .RN(n103), .Q(
        \fifo_mem[6][4] ) );
  DFFRQX2M \fifo_mem_reg[6][3]  ( .D(n32), .CK(wclk), .RN(n104), .Q(
        \fifo_mem[6][3] ) );
  DFFRQX2M \fifo_mem_reg[6][2]  ( .D(n31), .CK(wclk), .RN(n104), .Q(
        \fifo_mem[6][2] ) );
  DFFRQX2M \fifo_mem_reg[6][1]  ( .D(n30), .CK(wclk), .RN(n104), .Q(
        \fifo_mem[6][1] ) );
  DFFRQX2M \fifo_mem_reg[6][0]  ( .D(n29), .CK(wclk), .RN(n104), .Q(
        \fifo_mem[6][0] ) );
  DFFRQX2M \fifo_mem_reg[0][7]  ( .D(n84), .CK(wclk), .RN(n100), .Q(
        \fifo_mem[0][7] ) );
  DFFRQX2M \fifo_mem_reg[0][6]  ( .D(n83), .CK(wclk), .RN(n100), .Q(
        \fifo_mem[0][6] ) );
  DFFRQX2M \fifo_mem_reg[0][5]  ( .D(n82), .CK(wclk), .RN(n100), .Q(
        \fifo_mem[0][5] ) );
  DFFRQX2M \fifo_mem_reg[0][4]  ( .D(n81), .CK(wclk), .RN(n100), .Q(
        \fifo_mem[0][4] ) );
  DFFRQX2M \fifo_mem_reg[0][3]  ( .D(n80), .CK(wclk), .RN(n100), .Q(
        \fifo_mem[0][3] ) );
  DFFRQX2M \fifo_mem_reg[0][2]  ( .D(n79), .CK(wclk), .RN(n100), .Q(
        \fifo_mem[0][2] ) );
  DFFRQX2M \fifo_mem_reg[0][1]  ( .D(n78), .CK(wclk), .RN(n100), .Q(
        \fifo_mem[0][1] ) );
  DFFRQX2M \fifo_mem_reg[0][0]  ( .D(n77), .CK(wclk), .RN(n100), .Q(
        \fifo_mem[0][0] ) );
  DFFRQX2M \fifo_mem_reg[4][7]  ( .D(n52), .CK(wclk), .RN(n102), .Q(
        \fifo_mem[4][7] ) );
  DFFRQX2M \fifo_mem_reg[4][6]  ( .D(n51), .CK(wclk), .RN(n102), .Q(
        \fifo_mem[4][6] ) );
  DFFRQX2M \fifo_mem_reg[4][5]  ( .D(n50), .CK(wclk), .RN(n102), .Q(
        \fifo_mem[4][5] ) );
  DFFRQX2M \fifo_mem_reg[4][4]  ( .D(n49), .CK(wclk), .RN(n102), .Q(
        \fifo_mem[4][4] ) );
  DFFRQX2M \fifo_mem_reg[4][3]  ( .D(n48), .CK(wclk), .RN(n102), .Q(
        \fifo_mem[4][3] ) );
  DFFRQX2M \fifo_mem_reg[4][2]  ( .D(n47), .CK(wclk), .RN(n102), .Q(
        \fifo_mem[4][2] ) );
  DFFRQX2M \fifo_mem_reg[4][1]  ( .D(n46), .CK(wclk), .RN(n102), .Q(
        \fifo_mem[4][1] ) );
  DFFRQX2M \fifo_mem_reg[4][0]  ( .D(n45), .CK(wclk), .RN(n103), .Q(
        \fifo_mem[4][0] ) );
  BUFX2M U2 ( .A(n18), .Y(n93) );
  BUFX2M U3 ( .A(n19), .Y(n92) );
  BUFX2M U4 ( .A(n16), .Y(n94) );
  BUFX2M U5 ( .A(n13), .Y(n96) );
  BUFX2M U6 ( .A(n14), .Y(n95) );
  BUFX2M U7 ( .A(n11), .Y(n97) );
  BUFX2M U8 ( .A(n98), .Y(n102) );
  BUFX2M U9 ( .A(n98), .Y(n101) );
  BUFX2M U10 ( .A(n98), .Y(n100) );
  BUFX2M U11 ( .A(n99), .Y(n103) );
  BUFX2M U12 ( .A(n99), .Y(n104) );
  BUFX2M U13 ( .A(wrst_n), .Y(n98) );
  BUFX2M U14 ( .A(wrst_n), .Y(n99) );
  NAND3X2M U15 ( .A(n105), .B(n106), .C(n12), .Y(n15) );
  NAND3X2M U16 ( .A(n105), .B(n106), .C(n17), .Y(n20) );
  NOR2BX2M U17 ( .AN(wclken), .B(waddr[2]), .Y(n17) );
  OAI2BB2X1M U18 ( .B0(n114), .B1(n20), .A0N(\fifo_mem[0][0] ), .A1N(n20), .Y(
        n77) );
  OAI2BB2X1M U19 ( .B0(n113), .B1(n20), .A0N(\fifo_mem[0][1] ), .A1N(n20), .Y(
        n78) );
  OAI2BB2X1M U20 ( .B0(n112), .B1(n20), .A0N(\fifo_mem[0][2] ), .A1N(n20), .Y(
        n79) );
  OAI2BB2X1M U21 ( .B0(n111), .B1(n20), .A0N(\fifo_mem[0][3] ), .A1N(n20), .Y(
        n80) );
  OAI2BB2X1M U22 ( .B0(n110), .B1(n20), .A0N(\fifo_mem[0][4] ), .A1N(n20), .Y(
        n81) );
  OAI2BB2X1M U23 ( .B0(n109), .B1(n20), .A0N(\fifo_mem[0][5] ), .A1N(n20), .Y(
        n82) );
  OAI2BB2X1M U24 ( .B0(n108), .B1(n20), .A0N(\fifo_mem[0][6] ), .A1N(n20), .Y(
        n83) );
  OAI2BB2X1M U25 ( .B0(n107), .B1(n20), .A0N(\fifo_mem[0][7] ), .A1N(n20), .Y(
        n84) );
  OAI2BB2X1M U26 ( .B0(n114), .B1(n15), .A0N(\fifo_mem[4][0] ), .A1N(n15), .Y(
        n45) );
  OAI2BB2X1M U27 ( .B0(n113), .B1(n15), .A0N(\fifo_mem[4][1] ), .A1N(n15), .Y(
        n46) );
  OAI2BB2X1M U28 ( .B0(n112), .B1(n15), .A0N(\fifo_mem[4][2] ), .A1N(n15), .Y(
        n47) );
  OAI2BB2X1M U29 ( .B0(n111), .B1(n15), .A0N(\fifo_mem[4][3] ), .A1N(n15), .Y(
        n48) );
  OAI2BB2X1M U30 ( .B0(n110), .B1(n15), .A0N(\fifo_mem[4][4] ), .A1N(n15), .Y(
        n49) );
  OAI2BB2X1M U31 ( .B0(n109), .B1(n15), .A0N(\fifo_mem[4][5] ), .A1N(n15), .Y(
        n50) );
  OAI2BB2X1M U32 ( .B0(n108), .B1(n15), .A0N(\fifo_mem[4][6] ), .A1N(n15), .Y(
        n51) );
  OAI2BB2X1M U33 ( .B0(n107), .B1(n15), .A0N(\fifo_mem[4][7] ), .A1N(n15), .Y(
        n52) );
  BUFX4M U34 ( .A(N10), .Y(n91) );
  OAI2BB2X1M U35 ( .B0(n114), .B1(n96), .A0N(\fifo_mem[6][0] ), .A1N(n96), .Y(
        n29) );
  OAI2BB2X1M U36 ( .B0(n113), .B1(n96), .A0N(\fifo_mem[6][1] ), .A1N(n96), .Y(
        n30) );
  OAI2BB2X1M U37 ( .B0(n112), .B1(n96), .A0N(\fifo_mem[6][2] ), .A1N(n96), .Y(
        n31) );
  OAI2BB2X1M U38 ( .B0(n111), .B1(n96), .A0N(\fifo_mem[6][3] ), .A1N(n96), .Y(
        n32) );
  OAI2BB2X1M U39 ( .B0(n110), .B1(n96), .A0N(\fifo_mem[6][4] ), .A1N(n96), .Y(
        n33) );
  OAI2BB2X1M U40 ( .B0(n109), .B1(n96), .A0N(\fifo_mem[6][5] ), .A1N(n96), .Y(
        n34) );
  OAI2BB2X1M U41 ( .B0(n108), .B1(n96), .A0N(\fifo_mem[6][6] ), .A1N(n96), .Y(
        n35) );
  OAI2BB2X1M U42 ( .B0(n107), .B1(n96), .A0N(\fifo_mem[6][7] ), .A1N(n96), .Y(
        n36) );
  OAI2BB2X1M U43 ( .B0(n114), .B1(n95), .A0N(\fifo_mem[5][0] ), .A1N(n95), .Y(
        n37) );
  OAI2BB2X1M U44 ( .B0(n113), .B1(n95), .A0N(\fifo_mem[5][1] ), .A1N(n95), .Y(
        n38) );
  OAI2BB2X1M U45 ( .B0(n112), .B1(n95), .A0N(\fifo_mem[5][2] ), .A1N(n95), .Y(
        n39) );
  OAI2BB2X1M U46 ( .B0(n111), .B1(n95), .A0N(\fifo_mem[5][3] ), .A1N(n95), .Y(
        n40) );
  OAI2BB2X1M U47 ( .B0(n110), .B1(n95), .A0N(\fifo_mem[5][4] ), .A1N(n95), .Y(
        n41) );
  OAI2BB2X1M U48 ( .B0(n109), .B1(n95), .A0N(\fifo_mem[5][5] ), .A1N(n95), .Y(
        n42) );
  OAI2BB2X1M U49 ( .B0(n108), .B1(n95), .A0N(\fifo_mem[5][6] ), .A1N(n95), .Y(
        n43) );
  OAI2BB2X1M U50 ( .B0(n107), .B1(n95), .A0N(\fifo_mem[5][7] ), .A1N(n95), .Y(
        n44) );
  OAI2BB2X1M U51 ( .B0(n114), .B1(n94), .A0N(\fifo_mem[3][0] ), .A1N(n94), .Y(
        n53) );
  OAI2BB2X1M U52 ( .B0(n113), .B1(n94), .A0N(\fifo_mem[3][1] ), .A1N(n94), .Y(
        n54) );
  OAI2BB2X1M U53 ( .B0(n112), .B1(n94), .A0N(\fifo_mem[3][2] ), .A1N(n94), .Y(
        n55) );
  OAI2BB2X1M U54 ( .B0(n111), .B1(n94), .A0N(\fifo_mem[3][3] ), .A1N(n94), .Y(
        n56) );
  OAI2BB2X1M U55 ( .B0(n110), .B1(n94), .A0N(\fifo_mem[3][4] ), .A1N(n94), .Y(
        n57) );
  OAI2BB2X1M U56 ( .B0(n109), .B1(n94), .A0N(\fifo_mem[3][5] ), .A1N(n94), .Y(
        n58) );
  OAI2BB2X1M U57 ( .B0(n108), .B1(n94), .A0N(\fifo_mem[3][6] ), .A1N(n94), .Y(
        n59) );
  OAI2BB2X1M U58 ( .B0(n107), .B1(n94), .A0N(\fifo_mem[3][7] ), .A1N(n94), .Y(
        n60) );
  OAI2BB2X1M U59 ( .B0(n114), .B1(n93), .A0N(\fifo_mem[2][0] ), .A1N(n93), .Y(
        n61) );
  OAI2BB2X1M U60 ( .B0(n113), .B1(n93), .A0N(\fifo_mem[2][1] ), .A1N(n93), .Y(
        n62) );
  OAI2BB2X1M U61 ( .B0(n112), .B1(n93), .A0N(\fifo_mem[2][2] ), .A1N(n93), .Y(
        n63) );
  OAI2BB2X1M U62 ( .B0(n111), .B1(n93), .A0N(\fifo_mem[2][3] ), .A1N(n93), .Y(
        n64) );
  OAI2BB2X1M U63 ( .B0(n110), .B1(n93), .A0N(\fifo_mem[2][4] ), .A1N(n93), .Y(
        n65) );
  OAI2BB2X1M U64 ( .B0(n109), .B1(n93), .A0N(\fifo_mem[2][5] ), .A1N(n93), .Y(
        n66) );
  OAI2BB2X1M U65 ( .B0(n108), .B1(n93), .A0N(\fifo_mem[2][6] ), .A1N(n93), .Y(
        n67) );
  OAI2BB2X1M U66 ( .B0(n107), .B1(n93), .A0N(\fifo_mem[2][7] ), .A1N(n93), .Y(
        n68) );
  OAI2BB2X1M U67 ( .B0(n114), .B1(n92), .A0N(\fifo_mem[1][0] ), .A1N(n92), .Y(
        n69) );
  OAI2BB2X1M U68 ( .B0(n113), .B1(n92), .A0N(\fifo_mem[1][1] ), .A1N(n92), .Y(
        n70) );
  OAI2BB2X1M U69 ( .B0(n112), .B1(n92), .A0N(\fifo_mem[1][2] ), .A1N(n92), .Y(
        n71) );
  OAI2BB2X1M U70 ( .B0(n111), .B1(n92), .A0N(\fifo_mem[1][3] ), .A1N(n92), .Y(
        n72) );
  OAI2BB2X1M U71 ( .B0(n110), .B1(n92), .A0N(\fifo_mem[1][4] ), .A1N(n92), .Y(
        n73) );
  OAI2BB2X1M U72 ( .B0(n109), .B1(n92), .A0N(\fifo_mem[1][5] ), .A1N(n92), .Y(
        n74) );
  OAI2BB2X1M U73 ( .B0(n108), .B1(n92), .A0N(\fifo_mem[1][6] ), .A1N(n92), .Y(
        n75) );
  OAI2BB2X1M U74 ( .B0(n107), .B1(n92), .A0N(\fifo_mem[1][7] ), .A1N(n92), .Y(
        n76) );
  OAI2BB2X1M U75 ( .B0(n97), .B1(n114), .A0N(\fifo_mem[7][0] ), .A1N(n97), .Y(
        n21) );
  OAI2BB2X1M U76 ( .B0(n97), .B1(n113), .A0N(\fifo_mem[7][1] ), .A1N(n97), .Y(
        n22) );
  OAI2BB2X1M U77 ( .B0(n97), .B1(n112), .A0N(\fifo_mem[7][2] ), .A1N(n97), .Y(
        n23) );
  OAI2BB2X1M U78 ( .B0(n97), .B1(n111), .A0N(\fifo_mem[7][3] ), .A1N(n97), .Y(
        n24) );
  OAI2BB2X1M U79 ( .B0(n97), .B1(n110), .A0N(\fifo_mem[7][4] ), .A1N(n97), .Y(
        n25) );
  OAI2BB2X1M U80 ( .B0(n97), .B1(n109), .A0N(\fifo_mem[7][5] ), .A1N(n97), .Y(
        n26) );
  OAI2BB2X1M U81 ( .B0(n97), .B1(n108), .A0N(\fifo_mem[7][6] ), .A1N(n97), .Y(
        n27) );
  OAI2BB2X1M U82 ( .B0(n97), .B1(n107), .A0N(\fifo_mem[7][7] ), .A1N(n97), .Y(
        n28) );
  AND2X2M U83 ( .A(wclken), .B(waddr[2]), .Y(n12) );
  NAND3X2M U84 ( .A(n12), .B(n106), .C(waddr[0]), .Y(n14) );
  NAND3X2M U85 ( .A(n12), .B(n105), .C(waddr[1]), .Y(n13) );
  NAND3X2M U86 ( .A(waddr[1]), .B(waddr[0]), .C(n17), .Y(n16) );
  NAND3X2M U87 ( .A(waddr[0]), .B(n106), .C(n17), .Y(n19) );
  NAND3X2M U88 ( .A(waddr[1]), .B(n105), .C(n17), .Y(n18) );
  NAND3X2M U89 ( .A(waddr[0]), .B(n12), .C(waddr[1]), .Y(n11) );
  MX2X2M U90 ( .A(n2), .B(n1), .S0(N12), .Y(rdata[0]) );
  MX4X1M U91 ( .A(\fifo_mem[0][0] ), .B(\fifo_mem[1][0] ), .C(\fifo_mem[2][0] ), .D(\fifo_mem[3][0] ), .S0(n91), .S1(N11), .Y(n2) );
  MX4X1M U92 ( .A(\fifo_mem[4][0] ), .B(\fifo_mem[5][0] ), .C(\fifo_mem[6][0] ), .D(\fifo_mem[7][0] ), .S0(n91), .S1(N11), .Y(n1) );
  MX2X2M U93 ( .A(n4), .B(n3), .S0(N12), .Y(rdata[1]) );
  MX4X1M U94 ( .A(\fifo_mem[0][1] ), .B(\fifo_mem[1][1] ), .C(\fifo_mem[2][1] ), .D(\fifo_mem[3][1] ), .S0(n91), .S1(N11), .Y(n4) );
  MX4X1M U95 ( .A(\fifo_mem[4][1] ), .B(\fifo_mem[5][1] ), .C(\fifo_mem[6][1] ), .D(\fifo_mem[7][1] ), .S0(n91), .S1(N11), .Y(n3) );
  MX2X2M U96 ( .A(n6), .B(n5), .S0(N12), .Y(rdata[2]) );
  MX4X1M U97 ( .A(\fifo_mem[0][2] ), .B(\fifo_mem[1][2] ), .C(\fifo_mem[2][2] ), .D(\fifo_mem[3][2] ), .S0(n91), .S1(N11), .Y(n6) );
  MX4X1M U98 ( .A(\fifo_mem[4][2] ), .B(\fifo_mem[5][2] ), .C(\fifo_mem[6][2] ), .D(\fifo_mem[7][2] ), .S0(n91), .S1(N11), .Y(n5) );
  MX2X2M U99 ( .A(n8), .B(n7), .S0(N12), .Y(rdata[3]) );
  MX4X1M U100 ( .A(\fifo_mem[0][3] ), .B(\fifo_mem[1][3] ), .C(
        \fifo_mem[2][3] ), .D(\fifo_mem[3][3] ), .S0(n91), .S1(N11), .Y(n8) );
  MX4X1M U101 ( .A(\fifo_mem[4][3] ), .B(\fifo_mem[5][3] ), .C(
        \fifo_mem[6][3] ), .D(\fifo_mem[7][3] ), .S0(n91), .S1(N11), .Y(n7) );
  MX2X2M U102 ( .A(n10), .B(n9), .S0(N12), .Y(rdata[4]) );
  MX4X1M U103 ( .A(\fifo_mem[0][4] ), .B(\fifo_mem[1][4] ), .C(
        \fifo_mem[2][4] ), .D(\fifo_mem[3][4] ), .S0(n91), .S1(N11), .Y(n10)
         );
  MX4X1M U104 ( .A(\fifo_mem[4][4] ), .B(\fifo_mem[5][4] ), .C(
        \fifo_mem[6][4] ), .D(\fifo_mem[7][4] ), .S0(n91), .S1(N11), .Y(n9) );
  MX2X2M U105 ( .A(n86), .B(n85), .S0(N12), .Y(rdata[5]) );
  MX4X1M U106 ( .A(\fifo_mem[0][5] ), .B(\fifo_mem[1][5] ), .C(
        \fifo_mem[2][5] ), .D(\fifo_mem[3][5] ), .S0(n91), .S1(N11), .Y(n86)
         );
  MX4X1M U107 ( .A(\fifo_mem[4][5] ), .B(\fifo_mem[5][5] ), .C(
        \fifo_mem[6][5] ), .D(\fifo_mem[7][5] ), .S0(n91), .S1(N11), .Y(n85)
         );
  MX2X2M U108 ( .A(n88), .B(n87), .S0(N12), .Y(rdata[6]) );
  MX4X1M U109 ( .A(\fifo_mem[0][6] ), .B(\fifo_mem[1][6] ), .C(
        \fifo_mem[2][6] ), .D(\fifo_mem[3][6] ), .S0(n91), .S1(N11), .Y(n88)
         );
  MX4X1M U110 ( .A(\fifo_mem[4][6] ), .B(\fifo_mem[5][6] ), .C(
        \fifo_mem[6][6] ), .D(\fifo_mem[7][6] ), .S0(n91), .S1(N11), .Y(n87)
         );
  MX2X2M U111 ( .A(n90), .B(n89), .S0(N12), .Y(rdata[7]) );
  MX4X1M U112 ( .A(\fifo_mem[0][7] ), .B(\fifo_mem[1][7] ), .C(
        \fifo_mem[2][7] ), .D(\fifo_mem[3][7] ), .S0(n91), .S1(N11), .Y(n90)
         );
  MX4X1M U113 ( .A(\fifo_mem[4][7] ), .B(\fifo_mem[5][7] ), .C(
        \fifo_mem[6][7] ), .D(\fifo_mem[7][7] ), .S0(n91), .S1(N11), .Y(n89)
         );
  INVX2M U114 ( .A(waddr[0]), .Y(n105) );
  INVX2M U115 ( .A(waddr[1]), .Y(n106) );
  INVX2M U116 ( .A(wdata[0]), .Y(n114) );
  INVX2M U117 ( .A(wdata[1]), .Y(n113) );
  INVX2M U118 ( .A(wdata[2]), .Y(n112) );
  INVX2M U119 ( .A(wdata[3]), .Y(n111) );
  INVX2M U120 ( .A(wdata[4]), .Y(n110) );
  INVX2M U121 ( .A(wdata[5]), .Y(n109) );
  INVX2M U122 ( .A(wdata[6]), .Y(n108) );
  INVX2M U123 ( .A(wdata[7]), .Y(n107) );
endmodule


module FIFO_TOP_DATA_WIDTH8 ( wclk, rclk, wrst_n, rrst_n, winc, rinc, wdata, 
        rdata, wfull, empty );
  input [7:0] wdata;
  output [7:0] rdata;
  input wclk, rclk, wrst_n, rrst_n, winc, rinc;
  output wfull, empty;
  wire   wclken, n1, n2;
  wire   [3:0] sync_r2w;
  wire   [3:0] wptr_gray;
  wire   [2:0] waddr;
  wire   [3:0] sync_w2r;
  wire   [2:0] raddr;
  wire   [3:0] rptr_gray;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(wrst_n), .Y(n2) );
  FIFO_WR_FIFO_DEPTH8_ADDR_WIDTH4 fifo_wr ( .wdata(wdata), .wclk(wclk), 
        .wrst_n(n1), .winc(winc), .rptr_gray(sync_r2w), .wptr_gray(wptr_gray), 
        .waddr(waddr), .wclken(wclken), .wfull(wfull) );
  FIFO_RD_FIFO_DEPTH8_ADDR_WIDTH4 fifo_rd ( .wptr_gray(sync_w2r), .rclk(rclk), 
        .rrst_n(rrst_n), .rinc(rinc), .raddr(raddr), .rptr_gray(rptr_gray), 
        .empty(empty) );
  DF_SYNC_SYNC_WIDTH4_0 sync_rptr_gray_to_wptr_gray ( .RST(n1), .CLK(wclk), 
        .async_signal(rptr_gray), .sync_signal(sync_r2w) );
  DF_SYNC_SYNC_WIDTH4_1 sync_wptr_gray_to_rptr_gray ( .RST(rrst_n), .CLK(rclk), 
        .async_signal(wptr_gray), .sync_signal(sync_w2r) );
  FIFO_MEM_CNTRL_DATA_WIDTH8_FIFO_DEPTH8_ADDR_WIDTH4 fifo_mem ( .wdata(wdata), 
        .waddr(waddr), .raddr(raddr), .wclk(wclk), .rclk(rclk), .wrst_n(n1), 
        .wclken(wclken), .rdata(rdata) );
endmodule


module PULSE_GEN ( clk, rst, lvl_sig, pulse_sig );
  input clk, rst, lvl_sig;
  output pulse_sig;
  wire   pls_flop, rcv_flop;

  DFFRQX2M rcv_flop_reg ( .D(lvl_sig), .CK(clk), .RN(rst), .Q(rcv_flop) );
  DFFRQX2M pls_flop_reg ( .D(rcv_flop), .CK(clk), .RN(rst), .Q(pls_flop) );
  NOR2BX2M U3 ( .AN(rcv_flop), .B(pls_flop), .Y(pulse_sig) );
endmodule


module ClkDiv_0_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_0 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   N0, reg_div_clk, flag, N11, N16, N18, N19, N20, N21, N22, N23, N24,
         N27, N28, N29, N30, N31, N32, N33, N34, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57;
  wire   [7:0] counter;

  DFFRQX2M reg_div_clk_reg ( .D(n26), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        reg_div_clk) );
  DFFRQX2M flag_reg ( .D(n27), .CK(i_ref_clk), .RN(i_rst_n), .Q(flag) );
  DFFRQX2M \counter_reg[7]  ( .D(n28), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[7]) );
  DFFRQX2M \counter_reg[0]  ( .D(n35), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[0]) );
  DFFRQX2M \counter_reg[2]  ( .D(n33), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[2]) );
  DFFRQX2M \counter_reg[6]  ( .D(n29), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[6]) );
  DFFRQX2M \counter_reg[5]  ( .D(n30), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[5]) );
  DFFRQX2M \counter_reg[4]  ( .D(n31), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[4]) );
  DFFRQX2M \counter_reg[3]  ( .D(n32), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[3]) );
  DFFRQX2M \counter_reg[1]  ( .D(n34), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[1]) );
  INVX2M U3 ( .A(n18), .Y(n54) );
  NOR2X2M U4 ( .A(n3), .B(n55), .Y(N0) );
  OAI22X1M U5 ( .A0(n17), .A1(n18), .B0(n54), .B1(n57), .Y(n27) );
  NAND2X2M U6 ( .A(n55), .B(n19), .Y(n18) );
  OAI2B1X2M U7 ( .A1N(N24), .A0(n17), .B0(n16), .Y(n19) );
  INVX2M U8 ( .A(n2), .Y(n55) );
  INVX2M U9 ( .A(i_rst_n), .Y(n3) );
  OAI2BB2X1M U10 ( .B0(n14), .B1(n15), .A0N(n14), .A1N(reg_div_clk), .Y(n26)
         );
  OA21X2M U11 ( .A0(i_div_ratio[0]), .A1(reg_div_clk), .B0(n16), .Y(n15) );
  AOI31X2M U12 ( .A0(N24), .A1(n56), .A2(n55), .B0(n54), .Y(n14) );
  OR2X2M U13 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n4) );
  AND2X2M U14 ( .A(n22), .B(n55), .Y(n21) );
  OAI31X1M U15 ( .A0(n57), .A1(N11), .A2(n56), .B0(n23), .Y(n22) );
  AO21XLM U16 ( .A0(n17), .A1(i_div_ratio[0]), .B0(N24), .Y(n23) );
  AO22X1M U17 ( .A0(counter[1]), .A1(n2), .B0(N28), .B1(n21), .Y(n34) );
  AO22X1M U18 ( .A0(counter[2]), .A1(n2), .B0(N29), .B1(n21), .Y(n33) );
  AO22X1M U19 ( .A0(counter[3]), .A1(n2), .B0(N30), .B1(n21), .Y(n32) );
  AO22X1M U20 ( .A0(counter[4]), .A1(n2), .B0(N31), .B1(n21), .Y(n31) );
  AO22X1M U21 ( .A0(counter[5]), .A1(n2), .B0(N32), .B1(n21), .Y(n30) );
  AO22X1M U22 ( .A0(counter[6]), .A1(n2), .B0(N33), .B1(n21), .Y(n29) );
  AO22X1M U23 ( .A0(counter[7]), .A1(n2), .B0(N34), .B1(n21), .Y(n28) );
  AO22X1M U24 ( .A0(counter[0]), .A1(n2), .B0(N27), .B1(n21), .Y(n35) );
  NAND3X2M U25 ( .A(N11), .B(i_div_ratio[0]), .C(flag), .Y(n16) );
  AOI21BX2M U26 ( .A0(i_div_ratio[1]), .A1(i_div_ratio[2]), .B0N(n4), .Y(n1)
         );
  INVX2M U27 ( .A(counter[0]), .Y(n42) );
  NAND2X2M U28 ( .A(i_div_ratio[0]), .B(n57), .Y(n17) );
  INVX2M U29 ( .A(flag), .Y(n57) );
  BUFX2M U30 ( .A(n20), .Y(n2) );
  OAI2BB1X2M U31 ( .A0N(n24), .A1N(n25), .B0(i_clk_en), .Y(n20) );
  NOR3X2M U32 ( .A(i_div_ratio[1]), .B(i_div_ratio[3]), .C(i_div_ratio[2]), 
        .Y(n24) );
  NOR4X1M U33 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n25) );
  INVX2M U34 ( .A(i_div_ratio[0]), .Y(n56) );
  MX2X2M U35 ( .A(reg_div_clk), .B(i_ref_clk), .S0(N0), .Y(o_div_clk) );
  CLKINVX1M U36 ( .A(i_div_ratio[1]), .Y(N16) );
  OR2X1M U37 ( .A(n4), .B(i_div_ratio[3]), .Y(n5) );
  OAI2BB1X1M U38 ( .A0N(n4), .A1N(i_div_ratio[3]), .B0(n5), .Y(N18) );
  OR2X1M U39 ( .A(n5), .B(i_div_ratio[4]), .Y(n6) );
  OAI2BB1X1M U40 ( .A0N(n5), .A1N(i_div_ratio[4]), .B0(n6), .Y(N19) );
  OR2X1M U41 ( .A(n6), .B(i_div_ratio[5]), .Y(n7) );
  OAI2BB1X1M U42 ( .A0N(n6), .A1N(i_div_ratio[5]), .B0(n7), .Y(N20) );
  XNOR2X1M U43 ( .A(i_div_ratio[6]), .B(n7), .Y(N21) );
  NOR3X1M U44 ( .A(i_div_ratio[6]), .B(i_div_ratio[7]), .C(n7), .Y(N23) );
  OAI21X1M U45 ( .A0(i_div_ratio[6]), .A1(n7), .B0(i_div_ratio[7]), .Y(n8) );
  NAND2BX1M U46 ( .AN(N23), .B(n8), .Y(N22) );
  XNOR2X1M U47 ( .A(N18), .B(counter[2]), .Y(n41) );
  NOR2X1M U48 ( .A(n42), .B(N16), .Y(n9) );
  OAI22X1M U49 ( .A0(counter[1]), .A1(n9), .B0(n9), .B1(n1), .Y(n40) );
  CLKNAND2X2M U50 ( .A(N16), .B(n42), .Y(n10) );
  AOI22X1M U51 ( .A0(n10), .A1(n1), .B0(n10), .B1(counter[1]), .Y(n11) );
  NOR3X1M U52 ( .A(n11), .B(N23), .C(counter[7]), .Y(n39) );
  CLKXOR2X2M U53 ( .A(N19), .B(counter[3]), .Y(n37) );
  CLKXOR2X2M U54 ( .A(N20), .B(counter[4]), .Y(n36) );
  CLKXOR2X2M U55 ( .A(N21), .B(counter[5]), .Y(n13) );
  CLKXOR2X2M U56 ( .A(N22), .B(counter[6]), .Y(n12) );
  NOR4X1M U57 ( .A(n37), .B(n36), .C(n13), .D(n12), .Y(n38) );
  AND4X1M U58 ( .A(n41), .B(n40), .C(n39), .D(n38), .Y(N24) );
  NOR2BX1M U59 ( .AN(counter[0]), .B(i_div_ratio[1]), .Y(n43) );
  OAI2B2X1M U60 ( .A1N(i_div_ratio[2]), .A0(n43), .B0(counter[1]), .B1(n43), 
        .Y(n47) );
  XNOR2X1M U61 ( .A(i_div_ratio[3]), .B(counter[2]), .Y(n46) );
  NOR2BX1M U62 ( .AN(i_div_ratio[1]), .B(counter[0]), .Y(n44) );
  OAI2B2X1M U63 ( .A1N(counter[1]), .A0(n44), .B0(i_div_ratio[2]), .B1(n44), 
        .Y(n45) );
  NAND4BX1M U64 ( .AN(counter[7]), .B(n47), .C(n46), .D(n45), .Y(n53) );
  XNOR2X1M U65 ( .A(i_div_ratio[7]), .B(counter[6]), .Y(n51) );
  XNOR2X1M U66 ( .A(i_div_ratio[6]), .B(counter[5]), .Y(n50) );
  XNOR2X1M U67 ( .A(i_div_ratio[5]), .B(counter[4]), .Y(n49) );
  XNOR2X1M U68 ( .A(i_div_ratio[4]), .B(counter[3]), .Y(n48) );
  NAND4X1M U69 ( .A(n51), .B(n50), .C(n49), .D(n48), .Y(n52) );
  NOR2X1M U70 ( .A(n53), .B(n52), .Y(N11) );
  ClkDiv_0_DW01_inc_0 r76 ( .A(counter), .SUM({N34, N33, N32, N31, N30, N29, 
        N28, N27}) );
endmodule


module CLKDIV_MUX ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  OAI211X2M U11 ( .A0(n8), .A1(n9), .B0(n17), .C0(n16), .Y(OUT[0]) );
  NOR3X2M U12 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  NAND4BX1M U13 ( .AN(IN[4]), .B(IN[3]), .C(n15), .D(n14), .Y(n6) );
  NAND4BX1M U14 ( .AN(IN[3]), .B(IN[4]), .C(n15), .D(n14), .Y(n7) );
  NOR3X2M U15 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  INVX2M U16 ( .A(IN[2]), .Y(n15) );
  INVX2M U17 ( .A(IN[5]), .Y(n14) );
  NOR4X1M U18 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U19 ( .A(n17), .B(n16), .C(IN[2]), .Y(n5) );
  INVX2M U20 ( .A(IN[0]), .Y(n17) );
  INVX2M U21 ( .A(IN[1]), .Y(n16) );
  NOR4X1M U22 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n15), .Y(n8) );
  NAND2X2M U23 ( .A(n7), .B(n6), .Y(n9) );
  INVX2M U3 ( .A(1'b1), .Y(OUT[4]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U7 ( .A(1'b1), .Y(OUT[6]) );
  INVX2M U9 ( .A(1'b1), .Y(OUT[7]) );
endmodule


module ClkDiv_1_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_1 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   N0, reg_div_clk, flag, N11, N16, N18, N19, N20, N21, N22, N23, N24,
         N27, N28, N29, N30, N31, N32, N33, N34, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80;
  wire   [7:0] counter;

  DFFRQX2M reg_div_clk_reg ( .D(n68), .CK(i_ref_clk), .RN(n3), .Q(reg_div_clk)
         );
  DFFRQX2M flag_reg ( .D(n67), .CK(i_ref_clk), .RN(n3), .Q(flag) );
  DFFRQX2M \counter_reg[7]  ( .D(n66), .CK(i_ref_clk), .RN(n3), .Q(counter[7])
         );
  DFFRQX2M \counter_reg[0]  ( .D(n59), .CK(i_ref_clk), .RN(n3), .Q(counter[0])
         );
  DFFRQX2M \counter_reg[2]  ( .D(n61), .CK(i_ref_clk), .RN(n3), .Q(counter[2])
         );
  DFFRQX2M \counter_reg[6]  ( .D(n65), .CK(i_ref_clk), .RN(n3), .Q(counter[6])
         );
  DFFRQX2M \counter_reg[5]  ( .D(n64), .CK(i_ref_clk), .RN(n3), .Q(counter[5])
         );
  DFFRQX2M \counter_reg[4]  ( .D(n63), .CK(i_ref_clk), .RN(n3), .Q(counter[4])
         );
  DFFRQX2M \counter_reg[3]  ( .D(n62), .CK(i_ref_clk), .RN(n3), .Q(counter[3])
         );
  DFFRQX2M \counter_reg[1]  ( .D(n60), .CK(i_ref_clk), .RN(n3), .Q(counter[1])
         );
  INVX2M U3 ( .A(n76), .Y(n55) );
  NOR2X2M U4 ( .A(n4), .B(n58), .Y(N0) );
  INVX2M U5 ( .A(n4), .Y(n3) );
  NAND2X2M U6 ( .A(n58), .B(n75), .Y(n76) );
  OAI2B1X2M U7 ( .A1N(N24), .A0(n77), .B0(n78), .Y(n75) );
  OAI22X1M U8 ( .A0(n77), .A1(n76), .B0(n55), .B1(n56), .Y(n67) );
  OR2X2M U9 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n5) );
  AND2X2M U10 ( .A(n72), .B(n58), .Y(n73) );
  OAI31X1M U11 ( .A0(n56), .A1(N11), .A2(n57), .B0(n71), .Y(n72) );
  AO21XLM U12 ( .A0(n77), .A1(i_div_ratio[0]), .B0(N24), .Y(n71) );
  AOI21BX2M U13 ( .A0(i_div_ratio[1]), .A1(i_div_ratio[2]), .B0N(n5), .Y(n1)
         );
  NAND2X2M U14 ( .A(i_div_ratio[0]), .B(n56), .Y(n77) );
  INVX2M U15 ( .A(i_div_ratio[0]), .Y(n57) );
  INVX2M U16 ( .A(n2), .Y(n58) );
  INVX2M U17 ( .A(i_rst_n), .Y(n4) );
  OAI2BB2X1M U18 ( .B0(n80), .B1(n79), .A0N(n80), .A1N(reg_div_clk), .Y(n68)
         );
  OA21X2M U19 ( .A0(i_div_ratio[0]), .A1(reg_div_clk), .B0(n78), .Y(n79) );
  AOI31X2M U20 ( .A0(N24), .A1(n57), .A2(n58), .B0(n55), .Y(n80) );
  AO22X1M U21 ( .A0(counter[1]), .A1(n2), .B0(N28), .B1(n73), .Y(n60) );
  AO22X1M U22 ( .A0(counter[2]), .A1(n2), .B0(N29), .B1(n73), .Y(n61) );
  AO22X1M U23 ( .A0(counter[3]), .A1(n2), .B0(N30), .B1(n73), .Y(n62) );
  AO22X1M U24 ( .A0(counter[4]), .A1(n2), .B0(N31), .B1(n73), .Y(n63) );
  AO22X1M U25 ( .A0(counter[5]), .A1(n2), .B0(N32), .B1(n73), .Y(n64) );
  AO22X1M U26 ( .A0(counter[6]), .A1(n2), .B0(N33), .B1(n73), .Y(n65) );
  AO22X1M U27 ( .A0(counter[7]), .A1(n2), .B0(N34), .B1(n73), .Y(n66) );
  AO22X1M U28 ( .A0(counter[0]), .A1(n2), .B0(N27), .B1(n73), .Y(n59) );
  NAND3X2M U29 ( .A(N11), .B(i_div_ratio[0]), .C(flag), .Y(n78) );
  BUFX2M U30 ( .A(n74), .Y(n2) );
  OAI2BB1X2M U31 ( .A0N(n70), .A1N(n69), .B0(i_clk_en), .Y(n74) );
  NOR4X1M U32 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n69) );
  NOR3X2M U33 ( .A(i_div_ratio[1]), .B(i_div_ratio[3]), .C(i_div_ratio[2]), 
        .Y(n70) );
  INVX2M U34 ( .A(counter[0]), .Y(n43) );
  INVX2M U35 ( .A(flag), .Y(n56) );
  MX2X2M U36 ( .A(reg_div_clk), .B(i_ref_clk), .S0(N0), .Y(o_div_clk) );
  CLKINVX1M U37 ( .A(i_div_ratio[1]), .Y(N16) );
  OR2X1M U38 ( .A(n5), .B(i_div_ratio[3]), .Y(n6) );
  OAI2BB1X1M U39 ( .A0N(n5), .A1N(i_div_ratio[3]), .B0(n6), .Y(N18) );
  OR2X1M U40 ( .A(n6), .B(i_div_ratio[4]), .Y(n7) );
  OAI2BB1X1M U41 ( .A0N(n6), .A1N(i_div_ratio[4]), .B0(n7), .Y(N19) );
  OR2X1M U42 ( .A(n7), .B(i_div_ratio[5]), .Y(n8) );
  OAI2BB1X1M U43 ( .A0N(n7), .A1N(i_div_ratio[5]), .B0(n8), .Y(N20) );
  XNOR2X1M U44 ( .A(i_div_ratio[6]), .B(n8), .Y(N21) );
  NOR3X1M U45 ( .A(i_div_ratio[6]), .B(i_div_ratio[7]), .C(n8), .Y(N23) );
  OAI21X1M U46 ( .A0(i_div_ratio[6]), .A1(n8), .B0(i_div_ratio[7]), .Y(n9) );
  NAND2BX1M U47 ( .AN(N23), .B(n9), .Y(N22) );
  XNOR2X1M U48 ( .A(N18), .B(counter[2]), .Y(n42) );
  NOR2X1M U49 ( .A(n43), .B(N16), .Y(n10) );
  OAI22X1M U50 ( .A0(counter[1]), .A1(n10), .B0(n10), .B1(n1), .Y(n41) );
  CLKNAND2X2M U51 ( .A(N16), .B(n43), .Y(n11) );
  AOI22X1M U52 ( .A0(n11), .A1(n1), .B0(n11), .B1(counter[1]), .Y(n12) );
  NOR3X1M U53 ( .A(n12), .B(N23), .C(counter[7]), .Y(n40) );
  CLKXOR2X2M U54 ( .A(N19), .B(counter[3]), .Y(n38) );
  CLKXOR2X2M U55 ( .A(N20), .B(counter[4]), .Y(n37) );
  CLKXOR2X2M U56 ( .A(N21), .B(counter[5]), .Y(n36) );
  CLKXOR2X2M U57 ( .A(N22), .B(counter[6]), .Y(n13) );
  NOR4X1M U58 ( .A(n38), .B(n37), .C(n36), .D(n13), .Y(n39) );
  AND4X1M U59 ( .A(n42), .B(n41), .C(n40), .D(n39), .Y(N24) );
  NOR2BX1M U60 ( .AN(counter[0]), .B(i_div_ratio[1]), .Y(n44) );
  OAI2B2X1M U61 ( .A1N(i_div_ratio[2]), .A0(n44), .B0(counter[1]), .B1(n44), 
        .Y(n48) );
  XNOR2X1M U62 ( .A(i_div_ratio[3]), .B(counter[2]), .Y(n47) );
  NOR2BX1M U63 ( .AN(i_div_ratio[1]), .B(counter[0]), .Y(n45) );
  OAI2B2X1M U64 ( .A1N(counter[1]), .A0(n45), .B0(i_div_ratio[2]), .B1(n45), 
        .Y(n46) );
  NAND4BX1M U65 ( .AN(counter[7]), .B(n48), .C(n47), .D(n46), .Y(n54) );
  XNOR2X1M U66 ( .A(i_div_ratio[7]), .B(counter[6]), .Y(n52) );
  XNOR2X1M U67 ( .A(i_div_ratio[6]), .B(counter[5]), .Y(n51) );
  XNOR2X1M U68 ( .A(i_div_ratio[5]), .B(counter[4]), .Y(n50) );
  XNOR2X1M U69 ( .A(i_div_ratio[4]), .B(counter[3]), .Y(n49) );
  NAND4X1M U70 ( .A(n52), .B(n51), .C(n50), .D(n49), .Y(n53) );
  NOR2X1M U71 ( .A(n54), .B(n53), .Y(N11) );
  ClkDiv_1_DW01_inc_0 r76 ( .A(counter), .SUM({N34, N33, N32, N31, N30, N29, 
        N28, N27}) );
endmodule


module uart_tx_fsm ( CLK, RST, Data_Valid, ser_done, parity_enable, Ser_enable, 
        mux_sel, busy );
  output [1:0] mux_sel;
  input CLK, RST, Data_Valid, ser_done, parity_enable;
  output Ser_enable, busy;
  wire   busy_c, n4, n5, n6, n7, n8, n9, n1, n2, n3;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRQX2M busy_reg ( .D(busy_c), .CK(CLK), .RN(RST), .Q(busy) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  INVX2M U3 ( .A(n9), .Y(n1) );
  NOR3X2M U4 ( .A(n5), .B(ser_done), .C(current_state[2]), .Y(Ser_enable) );
  OAI21X2M U5 ( .A0(current_state[1]), .A1(n2), .B0(n8), .Y(n9) );
  NAND2X2M U6 ( .A(current_state[1]), .B(n2), .Y(n8) );
  NAND2X2M U7 ( .A(n1), .B(current_state[0]), .Y(n5) );
  INVX2M U8 ( .A(current_state[0]), .Y(n2) );
  OAI2B2X1M U9 ( .A1N(current_state[2]), .A0(n8), .B0(current_state[2]), .B1(
        n9), .Y(mux_sel[0]) );
  OAI21X2M U10 ( .A0(current_state[2]), .A1(current_state[0]), .B0(n8), .Y(
        mux_sel[1]) );
  NOR3X2M U11 ( .A(n3), .B(current_state[2]), .C(n4), .Y(next_state[2]) );
  AOI2B1X1M U12 ( .A1N(parity_enable), .A0(ser_done), .B0(n2), .Y(n4) );
  OAI21X2M U13 ( .A0(current_state[2]), .A1(n2), .B0(n8), .Y(busy_c) );
  AOI21X2M U14 ( .A0(n1), .A1(n5), .B0(current_state[2]), .Y(next_state[1]) );
  AOI21X2M U15 ( .A0(n6), .A1(n7), .B0(current_state[2]), .Y(next_state[0]) );
  NAND2BX2M U16 ( .AN(ser_done), .B(current_state[0]), .Y(n6) );
  OAI21X2M U17 ( .A0(Data_Valid), .A1(current_state[0]), .B0(n3), .Y(n7) );
  INVX2M U18 ( .A(current_state[1]), .Y(n3) );
endmodule


module Serializer_WIDTH8 ( CLK, RST, DATA, Enable, Busy, Data_Valid, ser_out, 
        ser_done );
  input [7:0] DATA;
  input CLK, RST, Enable, Busy, Data_Valid;
  output ser_out, ser_done;
  wire   N23, N24, N25, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n1, n2, n3, n25;
  wire   [7:1] DATA_V;
  wire   [2:0] ser_count;

  DFFRQX2M \DATA_V_reg[0]  ( .D(n17), .CK(CLK), .RN(RST), .Q(ser_out) );
  DFFRQX2M \DATA_V_reg[6]  ( .D(n19), .CK(CLK), .RN(RST), .Q(DATA_V[6]) );
  DFFRQX2M \DATA_V_reg[5]  ( .D(n20), .CK(CLK), .RN(RST), .Q(DATA_V[5]) );
  DFFRQX2M \DATA_V_reg[4]  ( .D(n21), .CK(CLK), .RN(RST), .Q(DATA_V[4]) );
  DFFRQX2M \DATA_V_reg[3]  ( .D(n22), .CK(CLK), .RN(RST), .Q(DATA_V[3]) );
  DFFRQX2M \DATA_V_reg[2]  ( .D(n23), .CK(CLK), .RN(RST), .Q(DATA_V[2]) );
  DFFRQX2M \DATA_V_reg[1]  ( .D(n24), .CK(CLK), .RN(RST), .Q(DATA_V[1]) );
  DFFRQX2M \DATA_V_reg[7]  ( .D(n18), .CK(CLK), .RN(RST), .Q(DATA_V[7]) );
  DFFRQX2M \ser_count_reg[2]  ( .D(N25), .CK(CLK), .RN(RST), .Q(ser_count[2])
         );
  DFFRQX2M \ser_count_reg[1]  ( .D(N24), .CK(CLK), .RN(RST), .Q(ser_count[1])
         );
  DFFRQX2M \ser_count_reg[0]  ( .D(N23), .CK(CLK), .RN(RST), .Q(ser_count[0])
         );
  NOR2X2M U3 ( .A(n2), .B(n1), .Y(n6) );
  NOR2X2M U4 ( .A(n1), .B(n6), .Y(n4) );
  INVX2M U5 ( .A(Enable), .Y(n2) );
  OAI32X1M U6 ( .A0(n14), .A1(n3), .A2(n2), .B0(n15), .B1(n25), .Y(N25) );
  NAND2X2M U7 ( .A(ser_count[0]), .B(n25), .Y(n14) );
  AOI21X2M U8 ( .A0(Enable), .A1(n3), .B0(N23), .Y(n15) );
  INVX2M U9 ( .A(ser_count[2]), .Y(n25) );
  BUFX2M U10 ( .A(n7), .Y(n1) );
  NOR2BX2M U11 ( .AN(Data_Valid), .B(Busy), .Y(n7) );
  OAI2BB1X2M U12 ( .A0N(ser_out), .A1N(n4), .B0(n5), .Y(n17) );
  AOI22X1M U13 ( .A0(DATA_V[1]), .A1(n6), .B0(DATA[0]), .B1(n1), .Y(n5) );
  OAI2BB1X2M U14 ( .A0N(DATA_V[1]), .A1N(n4), .B0(n13), .Y(n24) );
  AOI22X1M U15 ( .A0(DATA_V[2]), .A1(n6), .B0(DATA[1]), .B1(n1), .Y(n13) );
  OAI2BB1X2M U16 ( .A0N(n4), .A1N(DATA_V[2]), .B0(n12), .Y(n23) );
  AOI22X1M U17 ( .A0(DATA_V[3]), .A1(n6), .B0(DATA[2]), .B1(n1), .Y(n12) );
  OAI2BB1X2M U18 ( .A0N(n4), .A1N(DATA_V[3]), .B0(n11), .Y(n22) );
  AOI22X1M U19 ( .A0(DATA_V[4]), .A1(n6), .B0(DATA[3]), .B1(n1), .Y(n11) );
  OAI2BB1X2M U20 ( .A0N(n4), .A1N(DATA_V[4]), .B0(n10), .Y(n21) );
  AOI22X1M U21 ( .A0(DATA_V[5]), .A1(n6), .B0(DATA[4]), .B1(n1), .Y(n10) );
  OAI2BB1X2M U22 ( .A0N(n4), .A1N(DATA_V[5]), .B0(n9), .Y(n20) );
  AOI22X1M U23 ( .A0(DATA_V[6]), .A1(n6), .B0(DATA[5]), .B1(n1), .Y(n9) );
  OAI2BB1X2M U24 ( .A0N(n4), .A1N(DATA_V[6]), .B0(n8), .Y(n19) );
  AOI22X1M U25 ( .A0(DATA_V[7]), .A1(n6), .B0(DATA[6]), .B1(n1), .Y(n8) );
  AO22X1M U26 ( .A0(n4), .A1(DATA_V[7]), .B0(DATA[7]), .B1(n1), .Y(n18) );
  AND3X2M U27 ( .A(ser_count[0]), .B(ser_count[2]), .C(ser_count[1]), .Y(
        ser_done) );
  NOR2X2M U28 ( .A(n2), .B(ser_count[0]), .Y(N23) );
  NOR2X2M U29 ( .A(n16), .B(n2), .Y(N24) );
  CLKXOR2X2M U30 ( .A(ser_count[0]), .B(n3), .Y(n16) );
  INVX2M U31 ( .A(ser_count[1]), .Y(n3) );
endmodule


module mux ( CLK, RST, IN_0, IN_1, IN_2, IN_3, SEL, OUT );
  input [1:0] SEL;
  input CLK, RST, IN_0, IN_1, IN_2, IN_3;
  output OUT;
  wire   mux_out, n2, n3, n1;

  INVX2M U3 ( .A(SEL[0]), .Y(n1) );
  OAI2B2X1M U4 ( .A1N(SEL[1]), .A0(n2), .B0(SEL[1]), .B1(n3), .Y(mux_out) );
  AOI22X1M U5 ( .A0(IN_0), .A1(n1), .B0(SEL[0]), .B1(IN_1), .Y(n3) );
  AOI22X1M U6 ( .A0(IN_2), .A1(n1), .B0(IN_3), .B1(SEL[0]), .Y(n2) );
  DFFRHQX8M OUT_reg ( .D(mux_out), .CK(CLK), .RN(RST), .Q(OUT) );
endmodule


module parity_calc_WIDTH8 ( CLK, RST, parity_enable, parity_type, Busy, DATA, 
        Data_Valid, parity );
  input [7:0] DATA;
  input CLK, RST, parity_enable, parity_type, Busy, Data_Valid;
  output parity;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n2
;
  wire   [7:0] DATA_V;

  DFFRQX2M parity_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(parity) );
  DFFRQX2M \DATA_V_reg[5]  ( .D(n14), .CK(CLK), .RN(RST), .Q(DATA_V[5]) );
  DFFRQX2M \DATA_V_reg[1]  ( .D(n10), .CK(CLK), .RN(RST), .Q(DATA_V[1]) );
  DFFRQX2M \DATA_V_reg[4]  ( .D(n13), .CK(CLK), .RN(RST), .Q(DATA_V[4]) );
  DFFRQX2M \DATA_V_reg[0]  ( .D(n9), .CK(CLK), .RN(RST), .Q(DATA_V[0]) );
  DFFRQX2M \DATA_V_reg[2]  ( .D(n11), .CK(CLK), .RN(RST), .Q(DATA_V[2]) );
  DFFRQX2M \DATA_V_reg[3]  ( .D(n12), .CK(CLK), .RN(RST), .Q(DATA_V[3]) );
  DFFRQX2M \DATA_V_reg[6]  ( .D(n15), .CK(CLK), .RN(RST), .Q(DATA_V[6]) );
  DFFRQX2M \DATA_V_reg[7]  ( .D(n16), .CK(CLK), .RN(RST), .Q(DATA_V[7]) );
  NOR2BX2M U2 ( .AN(Data_Valid), .B(Busy), .Y(n7) );
  AO2B2X2M U3 ( .B0(DATA[0]), .B1(n7), .A0(DATA_V[0]), .A1N(n7), .Y(n9) );
  AO2B2X2M U4 ( .B0(DATA[1]), .B1(n7), .A0(DATA_V[1]), .A1N(n7), .Y(n10) );
  AO2B2X2M U5 ( .B0(DATA[2]), .B1(n7), .A0(DATA_V[2]), .A1N(n7), .Y(n11) );
  AO2B2X2M U6 ( .B0(DATA[3]), .B1(n7), .A0(DATA_V[3]), .A1N(n7), .Y(n12) );
  AO2B2X2M U7 ( .B0(DATA[4]), .B1(n7), .A0(DATA_V[4]), .A1N(n7), .Y(n13) );
  AO2B2X2M U8 ( .B0(DATA[5]), .B1(n7), .A0(DATA_V[5]), .A1N(n7), .Y(n14) );
  AO2B2X2M U9 ( .B0(DATA[6]), .B1(n7), .A0(DATA_V[6]), .A1N(n7), .Y(n15) );
  AO2B2X2M U10 ( .B0(DATA[7]), .B1(n7), .A0(DATA_V[7]), .A1N(n7), .Y(n16) );
  XNOR2X2M U11 ( .A(DATA_V[2]), .B(DATA_V[3]), .Y(n5) );
  OAI2BB2X1M U12 ( .B0(n1), .B1(n2), .A0N(parity), .A1N(n2), .Y(n8) );
  INVX2M U13 ( .A(parity_enable), .Y(n2) );
  XOR3XLM U14 ( .A(n3), .B(parity_type), .C(n4), .Y(n1) );
  XOR3XLM U15 ( .A(DATA_V[1]), .B(DATA_V[0]), .C(n5), .Y(n4) );
  XOR3XLM U16 ( .A(DATA_V[5]), .B(DATA_V[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U17 ( .A(DATA_V[7]), .B(DATA_V[6]), .Y(n6) );
endmodule


module UART_TX_DATA_WIDTH8 ( CLK, RST, P_DATA, Data_Valid, parity_enable, 
        parity_type, TX_OUT, busy );
  input [7:0] P_DATA;
  input CLK, RST, Data_Valid, parity_enable, parity_type;
  output TX_OUT, busy;
  wire   seriz_done, seriz_en, ser_data, parity, n1, n2;
  wire   [1:0] mux_sel;

  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(RST), .Y(n2) );
  uart_tx_fsm U0_fsm ( .CLK(CLK), .RST(n1), .Data_Valid(Data_Valid), 
        .ser_done(seriz_done), .parity_enable(parity_enable), .Ser_enable(
        seriz_en), .mux_sel(mux_sel), .busy(busy) );
  Serializer_WIDTH8 U0_Serializer ( .CLK(CLK), .RST(n1), .DATA(P_DATA), 
        .Enable(seriz_en), .Busy(busy), .Data_Valid(Data_Valid), .ser_out(
        ser_data), .ser_done(seriz_done) );
  mux U0_mux ( .CLK(CLK), .RST(n1), .IN_0(1'b0), .IN_1(ser_data), .IN_2(parity), .IN_3(1'b1), .SEL(mux_sel), .OUT(TX_OUT) );
  parity_calc_WIDTH8 U0_parity_calc ( .CLK(CLK), .RST(n1), .parity_enable(
        parity_enable), .parity_type(parity_type), .Busy(busy), .DATA(P_DATA), 
        .Data_Valid(Data_Valid), .parity(parity) );
endmodule


module uart_rx_fsm_DATA_WIDTH8 ( CLK, RST, S_DATA, Prescale, parity_enable, 
        bit_count, edge_count, par_err, stp_err, strt_glitch, strt_chk_en, 
        edge_bit_en, deser_en, par_chk_en, stp_chk_en, dat_samp_en, data_valid
 );
  input [5:0] Prescale;
  input [3:0] bit_count;
  input [5:0] edge_count;
  input CLK, RST, S_DATA, parity_enable, par_err, stp_err, strt_glitch;
  output strt_chk_en, edge_bit_en, deser_en, par_chk_en, stp_chk_en,
         dat_samp_en, data_valid;
  wire   \sub_41/carry[5] , \sub_41/carry[4] , \sub_41/carry[3] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47;
  wire   [5:0] check_edge;
  wire   [5:0] error_check_edge;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign error_check_edge[0] = Prescale[0];

  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  NOR3XLM U3 ( .A(n18), .B(stp_err), .C(par_err), .Y(data_valid) );
  OR2X2M U4 ( .A(Prescale[1]), .B(error_check_edge[0]), .Y(n1) );
  INVX2M U5 ( .A(Prescale[3]), .Y(n5) );
  XNOR2X2M U6 ( .A(Prescale[1]), .B(edge_count[1]), .Y(n34) );
  XNOR2X1M U7 ( .A(Prescale[5]), .B(\sub_41/carry[5] ), .Y(error_check_edge[5]) );
  OR2X1M U8 ( .A(Prescale[4]), .B(\sub_41/carry[4] ), .Y(\sub_41/carry[5] ) );
  XNOR2X1M U9 ( .A(\sub_41/carry[4] ), .B(Prescale[4]), .Y(error_check_edge[4]) );
  OR2X1M U10 ( .A(Prescale[3]), .B(\sub_41/carry[3] ), .Y(\sub_41/carry[4] )
         );
  XNOR2X1M U11 ( .A(\sub_41/carry[3] ), .B(Prescale[3]), .Y(
        error_check_edge[3]) );
  OR2X1M U12 ( .A(Prescale[2]), .B(Prescale[1]), .Y(\sub_41/carry[3] ) );
  XNOR2X1M U13 ( .A(Prescale[1]), .B(Prescale[2]), .Y(error_check_edge[2]) );
  CLKINVX1M U14 ( .A(error_check_edge[0]), .Y(check_edge[0]) );
  OAI2BB1X1M U15 ( .A0N(error_check_edge[0]), .A1N(Prescale[1]), .B0(n1), .Y(
        check_edge[1]) );
  NOR2X1M U16 ( .A(n1), .B(Prescale[2]), .Y(n2) );
  AO21XLM U17 ( .A0(n1), .A1(Prescale[2]), .B0(n2), .Y(check_edge[2]) );
  CLKNAND2X2M U18 ( .A(n2), .B(n5), .Y(n3) );
  OAI21X1M U19 ( .A0(n2), .A1(n5), .B0(n3), .Y(check_edge[3]) );
  XNOR2X1M U20 ( .A(Prescale[4]), .B(n3), .Y(check_edge[4]) );
  NOR2X1M U21 ( .A(Prescale[4]), .B(n3), .Y(n4) );
  CLKXOR2X2M U22 ( .A(Prescale[5]), .B(n4), .Y(check_edge[5]) );
  NOR2X1M U23 ( .A(current_state[1]), .B(n6), .Y(strt_chk_en) );
  NOR2X1M U24 ( .A(current_state[2]), .B(n7), .Y(par_chk_en) );
  OAI31X1M U25 ( .A0(n8), .A1(parity_enable), .A2(n9), .B0(n10), .Y(
        next_state[2]) );
  AOI31X1M U26 ( .A0(n11), .A1(n12), .A2(n13), .B0(stp_chk_en), .Y(n10) );
  NOR2X1M U27 ( .A(n14), .B(n15), .Y(n13) );
  CLKINVX1M U28 ( .A(bit_count[3]), .Y(n15) );
  CLKINVX1M U29 ( .A(n7), .Y(n12) );
  OAI21X1M U30 ( .A0(current_state[2]), .A1(n16), .B0(n7), .Y(next_state[1])
         );
  AOI31X1M U31 ( .A0(current_state[0]), .A1(n11), .A2(n17), .B0(
        current_state[1]), .Y(n16) );
  NOR3X1M U32 ( .A(bit_count[0]), .B(strt_glitch), .C(bit_count[3]), .Y(n17)
         );
  OAI221X1M U33 ( .A0(S_DATA), .A1(n18), .B0(n19), .B1(n8), .C0(n20), .Y(
        next_state[0]) );
  AOI31X1M U34 ( .A0(n21), .A1(n22), .A2(n23), .B0(n24), .Y(n20) );
  NOR4X1M U35 ( .A(n25), .B(n26), .C(n27), .D(n28), .Y(n24) );
  CLKXOR2X2M U36 ( .A(error_check_edge[5]), .B(edge_count[5]), .Y(n28) );
  CLKXOR2X2M U37 ( .A(error_check_edge[4]), .B(edge_count[4]), .Y(n27) );
  NAND3BX1M U38 ( .AN(bit_count[2]), .B(bit_count[3]), .C(stp_chk_en), .Y(n26)
         );
  NOR2X1M U39 ( .A(n22), .B(n7), .Y(stp_chk_en) );
  NAND4X1M U40 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n25) );
  XNOR2X1M U41 ( .A(edge_count[2]), .B(error_check_edge[2]), .Y(n32) );
  NOR2X1M U42 ( .A(n33), .B(n34), .Y(n31) );
  CLKXOR2X2M U43 ( .A(error_check_edge[0]), .B(edge_count[0]), .Y(n33) );
  XNOR2X1M U44 ( .A(edge_count[3]), .B(error_check_edge[3]), .Y(n30) );
  MXI2X1M U45 ( .A(n35), .B(n36), .S0(parity_enable), .Y(n29) );
  CLKNAND2X2M U46 ( .A(bit_count[1]), .B(n14), .Y(n36) );
  OR2X1M U47 ( .A(bit_count[1]), .B(n14), .Y(n35) );
  MXI2X1M U48 ( .A(S_DATA), .B(n37), .S0(current_state[0]), .Y(n23) );
  NOR4BX1M U49 ( .AN(strt_glitch), .B(bit_count[3]), .C(bit_count[0]), .D(n38), 
        .Y(n37) );
  CLKINVX1M U50 ( .A(n9), .Y(n19) );
  NAND3X1M U51 ( .A(n11), .B(n14), .C(bit_count[3]), .Y(n9) );
  CLKINVX1M U52 ( .A(bit_count[0]), .Y(n14) );
  CLKINVX1M U53 ( .A(n38), .Y(n11) );
  CLKNAND2X2M U54 ( .A(n39), .B(n40), .Y(n38) );
  NOR4X1M U55 ( .A(bit_count[2]), .B(bit_count[1]), .C(n41), .D(n42), .Y(n40)
         );
  CLKXOR2X2M U56 ( .A(edge_count[0]), .B(check_edge[0]), .Y(n42) );
  CLKXOR2X2M U57 ( .A(edge_count[4]), .B(check_edge[4]), .Y(n41) );
  NOR4X1M U58 ( .A(n43), .B(n44), .C(n45), .D(n46), .Y(n39) );
  CLKXOR2X2M U59 ( .A(edge_count[3]), .B(check_edge[3]), .Y(n46) );
  CLKXOR2X2M U60 ( .A(edge_count[2]), .B(check_edge[2]), .Y(n45) );
  CLKXOR2X2M U61 ( .A(edge_count[5]), .B(check_edge[5]), .Y(n44) );
  CLKXOR2X2M U62 ( .A(edge_count[1]), .B(check_edge[1]), .Y(n43) );
  CLKNAND2X2M U63 ( .A(n6), .B(n7), .Y(edge_bit_en) );
  CLKNAND2X2M U64 ( .A(current_state[1]), .B(n47), .Y(n7) );
  CLKINVX1M U65 ( .A(n8), .Y(deser_en) );
  NAND3X1M U66 ( .A(current_state[1]), .B(n22), .C(current_state[0]), .Y(n8)
         );
  CLKINVX1M U67 ( .A(current_state[2]), .Y(n22) );
  NAND3X1M U68 ( .A(current_state[2]), .B(current_state[1]), .C(
        current_state[0]), .Y(n18) );
  CLKNAND2X2M U69 ( .A(n21), .B(n6), .Y(dat_samp_en) );
  AO21XLM U70 ( .A0(n47), .A1(S_DATA), .B0(current_state[2]), .Y(n6) );
  CLKINVX1M U71 ( .A(current_state[0]), .Y(n47) );
  CLKINVX1M U72 ( .A(current_state[1]), .Y(n21) );
endmodule


module edge_bit_counter ( CLK, RST, Enable, Prescale, bit_count, edge_count );
  input [5:0] Prescale;
  output [3:0] bit_count;
  output [5:0] edge_count;
  input CLK, RST, Enable;
  wire   N8, N9, N10, N11, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28,
         N29, N30, N31, n4, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, \add_31/carry[5] , \add_31/carry[4] , \add_31/carry[3] ,
         \add_31/carry[2] , n1, n2, n3, n5, n6, n7, n8, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33;

  DFFRX1M \bit_count_reg[3]  ( .D(n17), .CK(CLK), .RN(RST), .Q(bit_count[3]), 
        .QN(n4) );
  DFFRQX2M \bit_count_reg[2]  ( .D(n18), .CK(CLK), .RN(RST), .Q(bit_count[2])
         );
  DFFRQX2M \bit_count_reg[1]  ( .D(n19), .CK(CLK), .RN(RST), .Q(bit_count[1])
         );
  DFFRQX2M \bit_count_reg[0]  ( .D(n20), .CK(CLK), .RN(RST), .Q(bit_count[0])
         );
  DFFRQX2M \edge_count_reg[5]  ( .D(N24), .CK(CLK), .RN(RST), .Q(edge_count[5]) );
  DFFRQX2M \edge_count_reg[4]  ( .D(N23), .CK(CLK), .RN(RST), .Q(edge_count[4]) );
  DFFRQX2M \edge_count_reg[3]  ( .D(N22), .CK(CLK), .RN(RST), .Q(edge_count[3]) );
  DFFRQX2M \edge_count_reg[2]  ( .D(N21), .CK(CLK), .RN(RST), .Q(edge_count[2]) );
  DFFRQX2M \edge_count_reg[1]  ( .D(N20), .CK(CLK), .RN(RST), .Q(edge_count[1]) );
  DFFRQX2M \edge_count_reg[0]  ( .D(N19), .CK(CLK), .RN(RST), .Q(edge_count[0]) );
  INVX2M U3 ( .A(n13), .Y(n29) );
  INVX2M U4 ( .A(Enable), .Y(n33) );
  NOR2X2M U5 ( .A(n33), .B(N31), .Y(n13) );
  AOI21X2M U6 ( .A0(n30), .A1(Enable), .B0(n13), .Y(n16) );
  NOR2BX2M U7 ( .AN(N8), .B(n29), .Y(N20) );
  NOR2BX2M U8 ( .AN(N9), .B(n29), .Y(N21) );
  NOR2BX2M U9 ( .AN(N10), .B(n29), .Y(N22) );
  NOR2BX2M U10 ( .AN(N11), .B(n29), .Y(N23) );
  OAI32X1M U11 ( .A0(n33), .A1(bit_count[0]), .A2(n13), .B0(n30), .B1(n29), 
        .Y(n20) );
  OAI32X1M U12 ( .A0(n14), .A1(bit_count[2]), .A2(n31), .B0(n15), .B1(n32), 
        .Y(n18) );
  AOI21BX2M U13 ( .A0(Enable), .A1(n31), .B0N(n16), .Y(n15) );
  OAI32X1M U14 ( .A0(n9), .A1(n10), .A2(n33), .B0(n11), .B1(n4), .Y(n17) );
  NOR2X2M U15 ( .A(n12), .B(n13), .Y(n11) );
  NAND3X2M U16 ( .A(N31), .B(n4), .C(bit_count[2]), .Y(n9) );
  AOI2BB1X2M U17 ( .A0N(n10), .A1N(n32), .B0(n33), .Y(n12) );
  NAND3X2M U18 ( .A(bit_count[0]), .B(n29), .C(Enable), .Y(n14) );
  OAI22X1M U19 ( .A0(n16), .A1(n31), .B0(bit_count[1]), .B1(n14), .Y(n19) );
  OR2X2M U20 ( .A(Prescale[1]), .B(Prescale[0]), .Y(n2) );
  NOR2X2M U21 ( .A(n1), .B(n29), .Y(N24) );
  XNOR2X2M U22 ( .A(\add_31/carry[5] ), .B(edge_count[5]), .Y(n1) );
  NOR2X2M U23 ( .A(edge_count[0]), .B(n29), .Y(N19) );
  INVX2M U24 ( .A(Prescale[3]), .Y(n7) );
  NAND2X2M U25 ( .A(bit_count[1]), .B(bit_count[0]), .Y(n10) );
  INVX2M U26 ( .A(bit_count[0]), .Y(n30) );
  INVX2M U27 ( .A(bit_count[1]), .Y(n31) );
  ADDHX1M U28 ( .A(edge_count[1]), .B(edge_count[0]), .CO(\add_31/carry[2] ), 
        .S(N8) );
  ADDHX1M U29 ( .A(edge_count[2]), .B(\add_31/carry[2] ), .CO(
        \add_31/carry[3] ), .S(N9) );
  ADDHX1M U30 ( .A(edge_count[3]), .B(\add_31/carry[3] ), .CO(
        \add_31/carry[4] ), .S(N10) );
  INVX2M U31 ( .A(bit_count[2]), .Y(n32) );
  ADDHX1M U32 ( .A(edge_count[4]), .B(\add_31/carry[4] ), .CO(
        \add_31/carry[5] ), .S(N11) );
  CLKINVX1M U33 ( .A(Prescale[0]), .Y(N25) );
  OAI2BB1X1M U34 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n2), .Y(N26) );
  NOR2X1M U35 ( .A(n2), .B(Prescale[2]), .Y(n3) );
  AO21XLM U36 ( .A0(n2), .A1(Prescale[2]), .B0(n3), .Y(N27) );
  CLKNAND2X2M U37 ( .A(n3), .B(n7), .Y(n5) );
  OAI21X1M U38 ( .A0(n3), .A1(n7), .B0(n5), .Y(N28) );
  XNOR2X1M U39 ( .A(Prescale[4]), .B(n5), .Y(N29) );
  NOR2X1M U40 ( .A(Prescale[4]), .B(n5), .Y(n6) );
  CLKXOR2X2M U41 ( .A(Prescale[5]), .B(n6), .Y(N30) );
  NOR2BX1M U42 ( .AN(edge_count[0]), .B(N25), .Y(n8) );
  OAI2B2X1M U43 ( .A1N(N26), .A0(n8), .B0(edge_count[1]), .B1(n8), .Y(n24) );
  NOR2BX1M U44 ( .AN(N25), .B(edge_count[0]), .Y(n21) );
  OAI2B2X1M U45 ( .A1N(edge_count[1]), .A0(n21), .B0(N26), .B1(n21), .Y(n23)
         );
  XNOR2X1M U46 ( .A(N30), .B(edge_count[5]), .Y(n22) );
  NAND3X1M U47 ( .A(n24), .B(n23), .C(n22), .Y(n28) );
  CLKXOR2X2M U48 ( .A(N29), .B(edge_count[4]), .Y(n27) );
  CLKXOR2X2M U49 ( .A(N27), .B(edge_count[2]), .Y(n26) );
  CLKXOR2X2M U50 ( .A(N28), .B(edge_count[3]), .Y(n25) );
  NOR4X1M U51 ( .A(n28), .B(n27), .C(n26), .D(n25), .Y(N31) );
endmodule


module data_sampling ( CLK, RST, S_DATA, Prescale, edge_count, Enable, 
        sampled_bit );
  input [5:0] Prescale;
  input [5:0] edge_count;
  input CLK, RST, S_DATA, Enable;
  output sampled_bit;
  wire   N58, n19, n20, n21, \add_21/carry[4] , \add_21/carry[3] ,
         \add_21/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41;
  wire   [4:0] half_edges;
  wire   [4:0] half_edges_p1;
  wire   [4:0] half_edges_n1;
  wire   [2:0] Samples;

  DFFRQX2M \Samples_reg[2]  ( .D(n21), .CK(CLK), .RN(RST), .Q(Samples[2]) );
  DFFRQX2M \Samples_reg[1]  ( .D(n20), .CK(CLK), .RN(RST), .Q(Samples[1]) );
  DFFRQX2M \Samples_reg[0]  ( .D(n19), .CK(CLK), .RN(RST), .Q(Samples[0]) );
  DFFRQX2M sampled_bit_reg ( .D(N58), .CK(CLK), .RN(RST), .Q(sampled_bit) );
  INVX2M U3 ( .A(half_edges[2]), .Y(n8) );
  ADDHX1M U4 ( .A(half_edges[2]), .B(\add_21/carry[2] ), .CO(\add_21/carry[3] ), .S(half_edges_p1[2]) );
  ADDHX1M U5 ( .A(half_edges[1]), .B(half_edges[0]), .CO(\add_21/carry[2] ), 
        .S(half_edges_p1[1]) );
  ADDHX1M U6 ( .A(half_edges[3]), .B(\add_21/carry[3] ), .CO(\add_21/carry[4] ), .S(half_edges_p1[3]) );
  INVX2M U7 ( .A(Prescale[3]), .Y(n4) );
  CLKINVX1M U8 ( .A(Prescale[1]), .Y(half_edges[0]) );
  NOR2X1M U9 ( .A(Prescale[2]), .B(Prescale[1]), .Y(n1) );
  AO21XLM U10 ( .A0(Prescale[1]), .A1(Prescale[2]), .B0(n1), .Y(half_edges[1])
         );
  CLKNAND2X2M U11 ( .A(n1), .B(n4), .Y(n2) );
  OAI21X1M U12 ( .A0(n1), .A1(n4), .B0(n2), .Y(half_edges[2]) );
  XNOR2X1M U13 ( .A(Prescale[4]), .B(n2), .Y(half_edges[3]) );
  NOR2X1M U14 ( .A(Prescale[4]), .B(n2), .Y(n3) );
  CLKXOR2X2M U15 ( .A(Prescale[5]), .B(n3), .Y(half_edges[4]) );
  CLKXOR2X2M U16 ( .A(\add_21/carry[4] ), .B(half_edges[4]), .Y(
        half_edges_p1[4]) );
  NOR2X1M U17 ( .A(half_edges[1]), .B(half_edges[0]), .Y(n5) );
  AO21XLM U18 ( .A0(half_edges[0]), .A1(half_edges[1]), .B0(n5), .Y(
        half_edges_n1[1]) );
  CLKNAND2X2M U19 ( .A(n5), .B(n8), .Y(n6) );
  OAI21X1M U20 ( .A0(n5), .A1(n8), .B0(n6), .Y(half_edges_n1[2]) );
  XNOR2X1M U21 ( .A(half_edges[3]), .B(n6), .Y(half_edges_n1[3]) );
  NOR2X1M U22 ( .A(half_edges[3]), .B(n6), .Y(n7) );
  CLKXOR2X2M U23 ( .A(half_edges[4]), .B(n7), .Y(half_edges_n1[4]) );
  MXI2X1M U24 ( .A(n9), .B(n10), .S0(n11), .Y(n21) );
  NOR2X1M U25 ( .A(n12), .B(n13), .Y(n11) );
  NAND4X1M U26 ( .A(n14), .B(n15), .C(n16), .D(n17), .Y(n13) );
  CLKXOR2X2M U27 ( .A(n18), .B(half_edges_p1[1]), .Y(n17) );
  XNOR2X1M U28 ( .A(edge_count[2]), .B(half_edges_p1[2]), .Y(n16) );
  XNOR2X1M U29 ( .A(edge_count[3]), .B(half_edges_p1[3]), .Y(n15) );
  CLKXOR2X2M U30 ( .A(n22), .B(half_edges_p1[4]), .Y(n14) );
  NAND4BX1M U31 ( .AN(edge_count[5]), .B(n23), .C(n24), .D(n25), .Y(n12) );
  XNOR2X1M U32 ( .A(edge_count[0]), .B(Prescale[1]), .Y(n23) );
  CLKNAND2X2M U33 ( .A(Samples[2]), .B(Enable), .Y(n9) );
  MXI2X1M U34 ( .A(n10), .B(n26), .S0(n24), .Y(n20) );
  NAND4X1M U35 ( .A(n27), .B(n28), .C(n29), .D(n30), .Y(n24) );
  NOR4BX1M U36 ( .AN(n25), .B(edge_count[5]), .C(n31), .D(n32), .Y(n30) );
  CLKXOR2X2M U37 ( .A(half_edges[1]), .B(edge_count[1]), .Y(n32) );
  CLKXOR2X2M U38 ( .A(half_edges[0]), .B(edge_count[0]), .Y(n31) );
  XNOR2X1M U39 ( .A(edge_count[3]), .B(half_edges[3]), .Y(n29) );
  CLKXOR2X2M U40 ( .A(n22), .B(half_edges[4]), .Y(n28) );
  CLKINVX1M U41 ( .A(edge_count[4]), .Y(n22) );
  XNOR2X1M U42 ( .A(edge_count[2]), .B(half_edges[2]), .Y(n27) );
  CLKNAND2X2M U43 ( .A(Samples[1]), .B(Enable), .Y(n26) );
  MXI2X1M U44 ( .A(n10), .B(n33), .S0(n25), .Y(n19) );
  NAND4X1M U45 ( .A(n34), .B(n35), .C(n36), .D(n37), .Y(n25) );
  NOR3X1M U46 ( .A(n38), .B(edge_count[5]), .C(n39), .Y(n37) );
  CLKXOR2X2M U47 ( .A(Prescale[1]), .B(edge_count[0]), .Y(n39) );
  CLKXOR2X2M U48 ( .A(half_edges_n1[4]), .B(edge_count[4]), .Y(n38) );
  XNOR2X1M U49 ( .A(edge_count[2]), .B(half_edges_n1[2]), .Y(n36) );
  XNOR2X1M U50 ( .A(edge_count[3]), .B(half_edges_n1[3]), .Y(n35) );
  CLKXOR2X2M U51 ( .A(n18), .B(half_edges_n1[1]), .Y(n34) );
  CLKINVX1M U52 ( .A(edge_count[1]), .Y(n18) );
  CLKNAND2X2M U53 ( .A(Samples[0]), .B(Enable), .Y(n33) );
  CLKNAND2X2M U54 ( .A(S_DATA), .B(Enable), .Y(n10) );
  AOI21BX1M U55 ( .A0(n40), .A1(n41), .B0N(Enable), .Y(N58) );
  OAI21X1M U56 ( .A0(Samples[0]), .A1(Samples[1]), .B0(Samples[2]), .Y(n41) );
  CLKNAND2X2M U57 ( .A(Samples[0]), .B(Samples[1]), .Y(n40) );
endmodule


module deserializer_DATA_WIDTH8 ( CLK, RST, sampled_bit, Enable, edge_count, 
        Prescale, P_DATA );
  input [5:0] edge_count;
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, sampled_bit, Enable;
  wire   N1, N2, N3, N4, N5, N6, N7, n1, n10, n11, n12, n13, n14, n15, n16,
         n17, n2, n3, n4, n5, n6, n7, n8, n9, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31;

  DFFRQX2M \P_DATA_reg[0]  ( .D(n10), .CK(CLK), .RN(RST), .Q(P_DATA[0]) );
  DFFRQX2M \P_DATA_reg[5]  ( .D(n15), .CK(CLK), .RN(RST), .Q(P_DATA[5]) );
  DFFRQX2M \P_DATA_reg[1]  ( .D(n11), .CK(CLK), .RN(RST), .Q(P_DATA[1]) );
  DFFRQX2M \P_DATA_reg[4]  ( .D(n14), .CK(CLK), .RN(RST), .Q(P_DATA[4]) );
  DFFRQX2M \P_DATA_reg[7]  ( .D(n17), .CK(CLK), .RN(RST), .Q(P_DATA[7]) );
  DFFRQX2M \P_DATA_reg[3]  ( .D(n13), .CK(CLK), .RN(RST), .Q(P_DATA[3]) );
  DFFRQX2M \P_DATA_reg[6]  ( .D(n16), .CK(CLK), .RN(RST), .Q(P_DATA[6]) );
  DFFRQX2M \P_DATA_reg[2]  ( .D(n12), .CK(CLK), .RN(RST), .Q(P_DATA[2]) );
  OAI22X1M U3 ( .A0(n31), .A1(n30), .B0(n1), .B1(n29), .Y(n11) );
  OAI22X1M U4 ( .A0(n31), .A1(n29), .B0(n1), .B1(n28), .Y(n12) );
  OAI22X1M U5 ( .A0(n31), .A1(n28), .B0(n1), .B1(n27), .Y(n13) );
  OAI22X1M U6 ( .A0(n31), .A1(n27), .B0(n1), .B1(n26), .Y(n14) );
  OAI22X1M U7 ( .A0(n31), .A1(n26), .B0(n1), .B1(n25), .Y(n15) );
  OAI22X1M U8 ( .A0(n31), .A1(n25), .B0(n1), .B1(n24), .Y(n16) );
  INVX2M U9 ( .A(n1), .Y(n31) );
  NAND2X2M U10 ( .A(N7), .B(Enable), .Y(n1) );
  OAI2BB2X1M U11 ( .B0(n1), .B1(n30), .A0N(P_DATA[0]), .A1N(n1), .Y(n10) );
  OAI2BB2X1M U12 ( .B0(n31), .B1(n24), .A0N(sampled_bit), .A1N(n31), .Y(n17)
         );
  OR2X2M U13 ( .A(Prescale[1]), .B(Prescale[0]), .Y(n2) );
  INVX2M U14 ( .A(Prescale[3]), .Y(n6) );
  INVX2M U15 ( .A(P_DATA[2]), .Y(n29) );
  INVX2M U16 ( .A(P_DATA[6]), .Y(n25) );
  INVX2M U17 ( .A(P_DATA[7]), .Y(n24) );
  INVX2M U18 ( .A(P_DATA[3]), .Y(n28) );
  INVX2M U19 ( .A(P_DATA[1]), .Y(n30) );
  INVX2M U20 ( .A(P_DATA[4]), .Y(n27) );
  INVX2M U21 ( .A(P_DATA[5]), .Y(n26) );
  CLKINVX1M U22 ( .A(Prescale[0]), .Y(N1) );
  OAI2BB1X1M U23 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n2), .Y(N2) );
  NOR2X1M U24 ( .A(n2), .B(Prescale[2]), .Y(n3) );
  AO21XLM U25 ( .A0(n2), .A1(Prescale[2]), .B0(n3), .Y(N3) );
  CLKNAND2X2M U26 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U27 ( .A0(n3), .A1(n6), .B0(n4), .Y(N4) );
  XNOR2X1M U28 ( .A(Prescale[4]), .B(n4), .Y(N5) );
  NOR2X1M U29 ( .A(Prescale[4]), .B(n4), .Y(n5) );
  CLKXOR2X2M U30 ( .A(Prescale[5]), .B(n5), .Y(N6) );
  NOR2BX1M U31 ( .AN(edge_count[0]), .B(N1), .Y(n7) );
  OAI2B2X1M U32 ( .A1N(N2), .A0(n7), .B0(edge_count[1]), .B1(n7), .Y(n19) );
  NOR2BX1M U33 ( .AN(N1), .B(edge_count[0]), .Y(n8) );
  OAI2B2X1M U34 ( .A1N(edge_count[1]), .A0(n8), .B0(N2), .B1(n8), .Y(n18) );
  XNOR2X1M U35 ( .A(N6), .B(edge_count[5]), .Y(n9) );
  NAND3X1M U36 ( .A(n19), .B(n18), .C(n9), .Y(n23) );
  CLKXOR2X2M U37 ( .A(N5), .B(edge_count[4]), .Y(n22) );
  CLKXOR2X2M U38 ( .A(N3), .B(edge_count[2]), .Y(n21) );
  CLKXOR2X2M U39 ( .A(N4), .B(edge_count[3]), .Y(n20) );
  NOR4X1M U40 ( .A(n23), .B(n22), .C(n21), .D(n20), .Y(N7) );
endmodule


module strt_chk ( CLK, RST, sampled_bit, Enable, strt_glitch );
  input CLK, RST, sampled_bit, Enable;
  output strt_glitch;
  wire   n1;

  DFFRQX2M strt_glitch_reg ( .D(n1), .CK(CLK), .RN(RST), .Q(strt_glitch) );
  AO2B2X2M U2 ( .B0(sampled_bit), .B1(Enable), .A0(strt_glitch), .A1N(Enable), 
        .Y(n1) );
endmodule


module par_chk_DATA_WIDTH8 ( CLK, RST, parity_type, sampled_bit, Enable, 
        P_DATA, par_err );
  input [7:0] P_DATA;
  input CLK, RST, parity_type, sampled_bit, Enable;
  output par_err;
  wire   n1, n3, n4, n5, n6, n7, n8, n2;

  XNOR2X2M U2 ( .A(sampled_bit), .B(parity_type), .Y(n5) );
  XOR3XLM U3 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n4) );
  XNOR2X2M U4 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  XOR3XLM U5 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n7), .Y(n3) );
  XNOR2X2M U6 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n7) );
  OAI2BB2X1M U7 ( .B0(n1), .B1(n2), .A0N(par_err), .A1N(n2), .Y(n8) );
  INVX2M U8 ( .A(Enable), .Y(n2) );
  XOR3XLM U9 ( .A(n3), .B(n4), .C(n5), .Y(n1) );
  DFFRHQX8M par_err_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(par_err) );
endmodule


module stp_chk ( CLK, RST, sampled_bit, Enable, stp_err );
  input CLK, RST, sampled_bit, Enable;
  output stp_err;
  wire   n2, n1;

  OAI2BB2X1M U2 ( .B0(sampled_bit), .B1(n1), .A0N(stp_err), .A1N(n1), .Y(n2)
         );
  INVX2M U3 ( .A(Enable), .Y(n1) );
  DFFRHQX8M stp_err_reg ( .D(n2), .CK(CLK), .RN(RST), .Q(stp_err) );
endmodule


module UART_RX ( CLK, RST, RX_IN, parity_enable, parity_type, Prescale, P_DATA, 
        data_valid, parity_error, framing_error );
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, RX_IN, parity_enable, parity_type;
  output data_valid, parity_error, framing_error;
  wire   strt_glitch, strt_chk_en, edge_bit_en, deser_en, par_chk_en,
         stp_chk_en, dat_samp_en, sampled_bit, n1, n2;
  wire   [3:0] bit_count;
  wire   [5:0] edge_count;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
  uart_rx_fsm_DATA_WIDTH8 U0_uart_fsm ( .CLK(CLK), .RST(n1), .S_DATA(RX_IN), 
        .Prescale(Prescale), .parity_enable(parity_enable), .bit_count(
        bit_count), .edge_count(edge_count), .par_err(parity_error), .stp_err(
        framing_error), .strt_glitch(strt_glitch), .strt_chk_en(strt_chk_en), 
        .edge_bit_en(edge_bit_en), .deser_en(deser_en), .par_chk_en(par_chk_en), .stp_chk_en(stp_chk_en), .dat_samp_en(dat_samp_en), .data_valid(data_valid)
         );
  edge_bit_counter U0_edge_bit_counter ( .CLK(CLK), .RST(n1), .Enable(
        edge_bit_en), .Prescale(Prescale), .bit_count(bit_count), .edge_count(
        edge_count) );
  data_sampling U0_data_sampling ( .CLK(CLK), .RST(n1), .S_DATA(RX_IN), 
        .Prescale(Prescale), .edge_count(edge_count), .Enable(dat_samp_en), 
        .sampled_bit(sampled_bit) );
  deserializer_DATA_WIDTH8 U0_deserializer ( .CLK(CLK), .RST(n1), 
        .sampled_bit(sampled_bit), .Enable(deser_en), .edge_count(edge_count), 
        .Prescale(Prescale), .P_DATA(P_DATA) );
  strt_chk U0_strt_chk ( .CLK(CLK), .RST(n1), .sampled_bit(sampled_bit), 
        .Enable(strt_chk_en), .strt_glitch(strt_glitch) );
  par_chk_DATA_WIDTH8 U0_par_chk ( .CLK(CLK), .RST(n1), .parity_type(
        parity_type), .sampled_bit(sampled_bit), .Enable(par_chk_en), .P_DATA(
        P_DATA), .par_err(parity_error) );
  stp_chk U0_stp_chk ( .CLK(CLK), .RST(n1), .sampled_bit(sampled_bit), 
        .Enable(stp_chk_en), .stp_err(framing_error) );
endmodule


module UART_DATA_WIDTH8 ( RST, TX_CLK, RX_CLK, RX_IN_S, RX_OUT_P, RX_OUT_V, 
        TX_IN_P, TX_IN_V, TX_OUT_S, TX_OUT_V, Prescale, parity_enable, 
        parity_type, parity_error, framing_error );
  output [7:0] RX_OUT_P;
  input [7:0] TX_IN_P;
  input [5:0] Prescale;
  input RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_V, parity_enable, parity_type;
  output RX_OUT_V, TX_OUT_S, TX_OUT_V, parity_error, framing_error;
  wire   n1, n2;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
  UART_TX_DATA_WIDTH8 U0_UART_TX ( .CLK(TX_CLK), .RST(n1), .P_DATA(TX_IN_P), 
        .Data_Valid(TX_IN_V), .parity_enable(parity_enable), .parity_type(
        parity_type), .TX_OUT(TX_OUT_S), .busy(TX_OUT_V) );
  UART_RX U0_UART_RX ( .CLK(RX_CLK), .RST(n1), .RX_IN(RX_IN_S), 
        .parity_enable(parity_enable), .parity_type(parity_type), .Prescale(
        Prescale), .P_DATA(RX_OUT_P), .data_valid(RX_OUT_V), .parity_error(
        parity_error), .framing_error(framing_error) );
endmodule


module SYS_CTRL ( clk, rst_n, RX_P_Data, RX_D_VLD, RdData, RdData_Valid, 
        ALU_OUT, OUT_Valid, FIFO_FULL, Address, WrEn, RdEn, WrData, ALU_EN, 
        ALU_FUN, CLK_EN, clk_div_en, WR_DATA, WR_INC );
  input [7:0] RX_P_Data;
  input [7:0] RdData;
  input [15:0] ALU_OUT;
  output [3:0] Address;
  output [7:0] WrData;
  output [3:0] ALU_FUN;
  output [7:0] WR_DATA;
  input clk, rst_n, RX_D_VLD, RdData_Valid, OUT_Valid, FIFO_FULL;
  output WrEn, RdEn, ALU_EN, CLK_EN, clk_div_en, WR_INC;
  wire   n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n56, n57;
  wire   [3:0] state;

  DFFRQX2M \state_reg[0]  ( .D(n55), .CK(clk), .RN(rst_n), .Q(state[0]) );
  DFFRQX2M \state_reg[3]  ( .D(n54), .CK(clk), .RN(rst_n), .Q(state[3]) );
  DFFRQX2M \state_reg[2]  ( .D(n53), .CK(clk), .RN(rst_n), .Q(state[2]) );
  DFFRQX2M \state_reg[1]  ( .D(n52), .CK(clk), .RN(rst_n), .Q(state[1]) );
  NOR2X2M U5 ( .A(n43), .B(n45), .Y(Address[2]) );
  NOR2X2M U6 ( .A(n45), .B(n29), .Y(ALU_FUN[2]) );
  NOR2X2M U7 ( .A(n47), .B(n29), .Y(ALU_FUN[0]) );
  INVX2M U8 ( .A(WrEn), .Y(n7) );
  INVX2M U9 ( .A(n32), .Y(n12) );
  NOR2X4M U10 ( .A(n43), .B(n44), .Y(Address[3]) );
  NOR2X2M U11 ( .A(n57), .B(n7), .Y(WrData[5]) );
  NOR2X2M U12 ( .A(n56), .B(n30), .Y(RdEn) );
  NOR2X2M U13 ( .A(n56), .B(n42), .Y(WrEn) );
  INVX2M U14 ( .A(n25), .Y(n5) );
  NAND2X2M U15 ( .A(n49), .B(n50), .Y(WR_INC) );
  AND2X2M U16 ( .A(n30), .B(n17), .Y(n43) );
  NOR2X2M U17 ( .A(n43), .B(n46), .Y(Address[1]) );
  NAND2X2M U18 ( .A(n13), .B(n14), .Y(n32) );
  OAI22X1M U19 ( .A0(n56), .A1(n38), .B0(n43), .B1(n47), .Y(Address[0]) );
  OAI21X2M U20 ( .A0(n56), .A1(n29), .B0(n50), .Y(ALU_EN) );
  NOR2X2M U21 ( .A(n42), .B(n47), .Y(WrData[0]) );
  NOR2X2M U22 ( .A(n42), .B(n46), .Y(WrData[1]) );
  NOR2X2M U23 ( .A(n42), .B(n45), .Y(WrData[2]) );
  NOR2X2M U24 ( .A(n42), .B(n44), .Y(WrData[3]) );
  INVX2M U25 ( .A(n49), .Y(n4) );
  INVX2M U26 ( .A(n50), .Y(n3) );
  INVX2M U27 ( .A(n21), .Y(n6) );
  NOR2X2M U28 ( .A(n46), .B(n29), .Y(ALU_FUN[1]) );
  NOR2X2M U29 ( .A(n44), .B(n29), .Y(ALU_FUN[3]) );
  NAND2X2M U30 ( .A(n51), .B(n29), .Y(CLK_EN) );
  AOI31X2M U31 ( .A0(n42), .A1(n29), .A2(n43), .B0(RX_D_VLD), .Y(n25) );
  AND3X2M U32 ( .A(n38), .B(n21), .C(n48), .Y(n42) );
  NAND3X2M U33 ( .A(n39), .B(n13), .C(state[1]), .Y(n48) );
  NAND3X2M U34 ( .A(state[1]), .B(n39), .C(state[2]), .Y(n29) );
  NOR2X2M U35 ( .A(state[3]), .B(state[0]), .Y(n41) );
  NOR2X2M U36 ( .A(n10), .B(state[3]), .Y(n39) );
  NOR2BX2M U37 ( .AN(RX_P_Data[4]), .B(n7), .Y(WrData[4]) );
  NOR2BX2M U38 ( .AN(RX_P_Data[6]), .B(n7), .Y(WrData[6]) );
  NOR2BX2M U39 ( .AN(RX_P_Data[7]), .B(n7), .Y(WrData[7]) );
  OAI22X1M U40 ( .A0(n25), .A1(n31), .B0(n10), .B1(n5), .Y(n55) );
  AOI211X2M U41 ( .A0(state[3]), .A1(n32), .B0(n33), .C0(n24), .Y(n31) );
  NAND3X2M U42 ( .A(n17), .B(n29), .C(n40), .Y(n33) );
  NAND3X2M U43 ( .A(n12), .B(n41), .C(RX_D_VLD), .Y(n40) );
  NAND4X2M U44 ( .A(state[3]), .B(RdData_Valid), .C(n12), .D(n10), .Y(n49) );
  NAND2X2M U45 ( .A(RX_D_VLD), .B(RX_P_Data[1]), .Y(n46) );
  NAND2X2M U46 ( .A(RX_D_VLD), .B(RX_P_Data[3]), .Y(n44) );
  NAND2X2M U47 ( .A(RX_D_VLD), .B(RX_P_Data[2]), .Y(n45) );
  OAI211X2M U48 ( .A0(n13), .A1(n5), .B0(n8), .C0(n20), .Y(n53) );
  AOI31X2M U49 ( .A0(RX_P_Data[4]), .A1(RX_P_Data[0]), .A2(n9), .B0(n6), .Y(
        n20) );
  INVX2M U50 ( .A(n24), .Y(n8) );
  INVX2M U51 ( .A(n18), .Y(n9) );
  NAND2X2M U52 ( .A(RX_D_VLD), .B(RX_P_Data[0]), .Y(n47) );
  NAND3X2M U53 ( .A(state[1]), .B(n13), .C(n41), .Y(n17) );
  AND4X2M U54 ( .A(RX_P_Data[7]), .B(RX_P_Data[3]), .C(n12), .D(n39), .Y(n23)
         );
  INVX2M U55 ( .A(RX_D_VLD), .Y(n56) );
  NAND2BX2M U56 ( .AN(n51), .B(OUT_Valid), .Y(n50) );
  NAND3X2M U57 ( .A(state[2]), .B(n14), .C(n41), .Y(n30) );
  INVX2M U58 ( .A(state[2]), .Y(n13) );
  INVX2M U59 ( .A(state[1]), .Y(n14) );
  OAI21X2M U60 ( .A0(n14), .A1(n5), .B0(n15), .Y(n52) );
  OAI31X1M U61 ( .A0(n16), .A1(n6), .A2(n11), .B0(n5), .Y(n15) );
  INVX2M U62 ( .A(n17), .Y(n11) );
  OAI31X1M U63 ( .A0(n18), .A1(RX_P_Data[4]), .A2(RX_P_Data[0]), .B0(n19), .Y(
        n16) );
  NAND3X2M U64 ( .A(n12), .B(state[0]), .C(state[3]), .Y(n51) );
  NAND3X2M U65 ( .A(state[2]), .B(state[1]), .C(n41), .Y(n38) );
  NAND3X2M U66 ( .A(n39), .B(n14), .C(state[2]), .Y(n21) );
  INVX2M U67 ( .A(state[0]), .Y(n10) );
  OA21X2M U68 ( .A0(n36), .A1(n37), .B0(n38), .Y(n19) );
  NAND3X2M U69 ( .A(RX_P_Data[4]), .B(RX_P_Data[2]), .C(RX_P_Data[6]), .Y(n37)
         );
  NAND4BX1M U70 ( .AN(RX_P_Data[1]), .B(RX_P_Data[0]), .C(n23), .D(n57), .Y(
        n36) );
  NAND2X2M U71 ( .A(n19), .B(n34), .Y(n24) );
  NAND4X2M U72 ( .A(RX_P_Data[2]), .B(n23), .C(RX_P_Data[6]), .D(n35), .Y(n34)
         );
  NOR4X1M U73 ( .A(RX_P_Data[5]), .B(RX_P_Data[4]), .C(RX_P_Data[1]), .D(
        RX_P_Data[0]), .Y(n35) );
  NAND4X2M U74 ( .A(RX_P_Data[5]), .B(RX_P_Data[1]), .C(n22), .D(n23), .Y(n18)
         );
  NOR2X2M U75 ( .A(RX_P_Data[6]), .B(RX_P_Data[2]), .Y(n22) );
  OAI21X2M U76 ( .A0(n25), .A1(n26), .B0(n27), .Y(n54) );
  AND2X2M U77 ( .A(n29), .B(n30), .Y(n26) );
  OAI2BB1X2M U78 ( .A0N(n12), .A1N(n28), .B0(state[3]), .Y(n27) );
  OAI2B1X2M U79 ( .A1N(RdData_Valid), .A0(FIFO_FULL), .B0(n10), .Y(n28) );
  AO22X1M U80 ( .A0(RdData[0]), .A1(n4), .B0(ALU_OUT[0]), .B1(n3), .Y(
        WR_DATA[0]) );
  AO22X1M U81 ( .A0(RdData[1]), .A1(n4), .B0(ALU_OUT[1]), .B1(n3), .Y(
        WR_DATA[1]) );
  AO22X1M U82 ( .A0(RdData[2]), .A1(n4), .B0(ALU_OUT[2]), .B1(n3), .Y(
        WR_DATA[2]) );
  AO22X1M U83 ( .A0(RdData[3]), .A1(n4), .B0(ALU_OUT[3]), .B1(n3), .Y(
        WR_DATA[3]) );
  AO22X1M U84 ( .A0(RdData[4]), .A1(n4), .B0(ALU_OUT[4]), .B1(n3), .Y(
        WR_DATA[4]) );
  AO22X1M U85 ( .A0(RdData[5]), .A1(n4), .B0(ALU_OUT[5]), .B1(n3), .Y(
        WR_DATA[5]) );
  AO22X1M U86 ( .A0(RdData[6]), .A1(n4), .B0(ALU_OUT[6]), .B1(n3), .Y(
        WR_DATA[6]) );
  AO22X1M U87 ( .A0(RdData[7]), .A1(n4), .B0(ALU_OUT[7]), .B1(n3), .Y(
        WR_DATA[7]) );
  INVX2M U88 ( .A(RX_P_Data[5]), .Y(n57) );
  INVX2M U3 ( .A(1'b0), .Y(clk_div_en) );
endmodule


module RegFile_WIDTH8_DEPTH16 ( CLK, RST, WrEn, RdEn, Address, WrData, RdData, 
        RdData_VLD, REG0, REG1, REG2, REG3 );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn;
  output RdData_VLD;
  wire   N11, N12, N13, N14, \regArr[15][7] , \regArr[15][6] , \regArr[15][5] ,
         \regArr[15][4] , \regArr[15][3] , \regArr[15][2] , \regArr[15][1] ,
         \regArr[15][0] , \regArr[14][7] , \regArr[14][6] , \regArr[14][5] ,
         \regArr[14][4] , \regArr[14][3] , \regArr[14][2] , \regArr[14][1] ,
         \regArr[14][0] , \regArr[13][7] , \regArr[13][6] , \regArr[13][5] ,
         \regArr[13][4] , \regArr[13][3] , \regArr[13][2] , \regArr[13][1] ,
         \regArr[13][0] , \regArr[12][7] , \regArr[12][6] , \regArr[12][5] ,
         \regArr[12][4] , \regArr[12][3] , \regArr[12][2] , \regArr[12][1] ,
         \regArr[12][0] , \regArr[11][7] , \regArr[11][6] , \regArr[11][5] ,
         \regArr[11][4] , \regArr[11][3] , \regArr[11][2] , \regArr[11][1] ,
         \regArr[11][0] , \regArr[10][7] , \regArr[10][6] , \regArr[10][5] ,
         \regArr[10][4] , \regArr[10][3] , \regArr[10][2] , \regArr[10][1] ,
         \regArr[10][0] , \regArr[9][7] , \regArr[9][6] , \regArr[9][5] ,
         \regArr[9][4] , \regArr[9][3] , \regArr[9][2] , \regArr[9][1] ,
         \regArr[9][0] , \regArr[8][7] , \regArr[8][6] , \regArr[8][5] ,
         \regArr[8][4] , \regArr[8][3] , \regArr[8][2] , \regArr[8][1] ,
         \regArr[8][0] , \regArr[7][7] , \regArr[7][6] , \regArr[7][5] ,
         \regArr[7][4] , \regArr[7][3] , \regArr[7][2] , \regArr[7][1] ,
         \regArr[7][0] , \regArr[6][7] , \regArr[6][6] , \regArr[6][5] ,
         \regArr[6][4] , \regArr[6][3] , \regArr[6][2] , \regArr[6][1] ,
         \regArr[6][0] , \regArr[5][7] , \regArr[5][6] , \regArr[5][5] ,
         \regArr[5][4] , \regArr[5][3] , \regArr[5][2] , \regArr[5][1] ,
         \regArr[5][0] , \regArr[4][7] , \regArr[4][6] , \regArr[4][5] ,
         \regArr[4][4] , \regArr[4][3] , \regArr[4][2] , \regArr[4][1] ,
         \regArr[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];

  DFFRQX2M \regArr_reg[13][7]  ( .D(n160), .CK(CLK), .RN(n213), .Q(
        \regArr[13][7] ) );
  DFFRQX2M \regArr_reg[13][6]  ( .D(n159), .CK(CLK), .RN(n213), .Q(
        \regArr[13][6] ) );
  DFFRQX2M \regArr_reg[13][5]  ( .D(n158), .CK(CLK), .RN(n212), .Q(
        \regArr[13][5] ) );
  DFFRQX2M \regArr_reg[13][4]  ( .D(n157), .CK(CLK), .RN(n212), .Q(
        \regArr[13][4] ) );
  DFFRQX2M \regArr_reg[13][3]  ( .D(n156), .CK(CLK), .RN(n212), .Q(
        \regArr[13][3] ) );
  DFFRQX2M \regArr_reg[13][2]  ( .D(n155), .CK(CLK), .RN(n212), .Q(
        \regArr[13][2] ) );
  DFFRQX2M \regArr_reg[13][1]  ( .D(n154), .CK(CLK), .RN(n212), .Q(
        \regArr[13][1] ) );
  DFFRQX2M \regArr_reg[13][0]  ( .D(n153), .CK(CLK), .RN(n212), .Q(
        \regArr[13][0] ) );
  DFFRQX2M \regArr_reg[9][7]  ( .D(n128), .CK(CLK), .RN(n210), .Q(
        \regArr[9][7] ) );
  DFFRQX2M \regArr_reg[9][6]  ( .D(n127), .CK(CLK), .RN(n210), .Q(
        \regArr[9][6] ) );
  DFFRQX2M \regArr_reg[9][5]  ( .D(n126), .CK(CLK), .RN(n210), .Q(
        \regArr[9][5] ) );
  DFFRQX2M \regArr_reg[9][4]  ( .D(n125), .CK(CLK), .RN(n210), .Q(
        \regArr[9][4] ) );
  DFFRQX2M \regArr_reg[9][3]  ( .D(n124), .CK(CLK), .RN(n210), .Q(
        \regArr[9][3] ) );
  DFFRQX2M \regArr_reg[9][2]  ( .D(n123), .CK(CLK), .RN(n210), .Q(
        \regArr[9][2] ) );
  DFFRQX2M \regArr_reg[9][1]  ( .D(n122), .CK(CLK), .RN(n210), .Q(
        \regArr[9][1] ) );
  DFFRQX2M \regArr_reg[9][0]  ( .D(n121), .CK(CLK), .RN(n210), .Q(
        \regArr[9][0] ) );
  DFFRQX2M \regArr_reg[5][7]  ( .D(n96), .CK(CLK), .RN(n208), .Q(
        \regArr[5][7] ) );
  DFFRQX2M \regArr_reg[5][6]  ( .D(n95), .CK(CLK), .RN(n208), .Q(
        \regArr[5][6] ) );
  DFFRQX2M \regArr_reg[5][5]  ( .D(n94), .CK(CLK), .RN(n208), .Q(
        \regArr[5][5] ) );
  DFFRQX2M \regArr_reg[5][4]  ( .D(n93), .CK(CLK), .RN(n208), .Q(
        \regArr[5][4] ) );
  DFFRQX2M \regArr_reg[5][3]  ( .D(n92), .CK(CLK), .RN(n208), .Q(
        \regArr[5][3] ) );
  DFFRQX2M \regArr_reg[5][2]  ( .D(n91), .CK(CLK), .RN(n208), .Q(
        \regArr[5][2] ) );
  DFFRQX2M \regArr_reg[5][1]  ( .D(n90), .CK(CLK), .RN(n208), .Q(
        \regArr[5][1] ) );
  DFFRQX2M \regArr_reg[5][0]  ( .D(n89), .CK(CLK), .RN(n208), .Q(
        \regArr[5][0] ) );
  DFFRQX2M \regArr_reg[15][7]  ( .D(n176), .CK(CLK), .RN(n205), .Q(
        \regArr[15][7] ) );
  DFFRQX2M \regArr_reg[15][6]  ( .D(n175), .CK(CLK), .RN(n214), .Q(
        \regArr[15][6] ) );
  DFFRQX2M \regArr_reg[15][5]  ( .D(n174), .CK(CLK), .RN(n214), .Q(
        \regArr[15][5] ) );
  DFFRQX2M \regArr_reg[15][4]  ( .D(n173), .CK(CLK), .RN(n213), .Q(
        \regArr[15][4] ) );
  DFFRQX2M \regArr_reg[15][3]  ( .D(n172), .CK(CLK), .RN(n213), .Q(
        \regArr[15][3] ) );
  DFFRQX2M \regArr_reg[15][2]  ( .D(n171), .CK(CLK), .RN(n213), .Q(
        \regArr[15][2] ) );
  DFFRQX2M \regArr_reg[15][1]  ( .D(n170), .CK(CLK), .RN(n213), .Q(
        \regArr[15][1] ) );
  DFFRQX2M \regArr_reg[15][0]  ( .D(n169), .CK(CLK), .RN(n213), .Q(
        \regArr[15][0] ) );
  DFFRQX2M \regArr_reg[11][7]  ( .D(n144), .CK(CLK), .RN(n212), .Q(
        \regArr[11][7] ) );
  DFFRQX2M \regArr_reg[11][6]  ( .D(n143), .CK(CLK), .RN(n211), .Q(
        \regArr[11][6] ) );
  DFFRQX2M \regArr_reg[11][5]  ( .D(n142), .CK(CLK), .RN(n211), .Q(
        \regArr[11][5] ) );
  DFFRQX2M \regArr_reg[11][4]  ( .D(n141), .CK(CLK), .RN(n211), .Q(
        \regArr[11][4] ) );
  DFFRQX2M \regArr_reg[11][3]  ( .D(n140), .CK(CLK), .RN(n211), .Q(
        \regArr[11][3] ) );
  DFFRQX2M \regArr_reg[11][2]  ( .D(n139), .CK(CLK), .RN(n211), .Q(
        \regArr[11][2] ) );
  DFFRQX2M \regArr_reg[11][1]  ( .D(n138), .CK(CLK), .RN(n211), .Q(
        \regArr[11][1] ) );
  DFFRQX2M \regArr_reg[11][0]  ( .D(n137), .CK(CLK), .RN(n211), .Q(
        \regArr[11][0] ) );
  DFFRQX2M \regArr_reg[7][7]  ( .D(n112), .CK(CLK), .RN(n209), .Q(
        \regArr[7][7] ) );
  DFFRQX2M \regArr_reg[7][6]  ( .D(n111), .CK(CLK), .RN(n209), .Q(
        \regArr[7][6] ) );
  DFFRQX2M \regArr_reg[7][5]  ( .D(n110), .CK(CLK), .RN(n209), .Q(
        \regArr[7][5] ) );
  DFFRQX2M \regArr_reg[7][4]  ( .D(n109), .CK(CLK), .RN(n209), .Q(
        \regArr[7][4] ) );
  DFFRQX2M \regArr_reg[7][3]  ( .D(n108), .CK(CLK), .RN(n209), .Q(
        \regArr[7][3] ) );
  DFFRQX2M \regArr_reg[7][2]  ( .D(n107), .CK(CLK), .RN(n209), .Q(
        \regArr[7][2] ) );
  DFFRQX2M \regArr_reg[7][1]  ( .D(n106), .CK(CLK), .RN(n209), .Q(
        \regArr[7][1] ) );
  DFFRQX2M \regArr_reg[7][0]  ( .D(n105), .CK(CLK), .RN(n209), .Q(
        \regArr[7][0] ) );
  DFFRQX2M \regArr_reg[14][7]  ( .D(n168), .CK(CLK), .RN(n213), .Q(
        \regArr[14][7] ) );
  DFFRQX2M \regArr_reg[14][6]  ( .D(n167), .CK(CLK), .RN(n213), .Q(
        \regArr[14][6] ) );
  DFFRQX2M \regArr_reg[14][5]  ( .D(n166), .CK(CLK), .RN(n213), .Q(
        \regArr[14][5] ) );
  DFFRQX2M \regArr_reg[14][4]  ( .D(n165), .CK(CLK), .RN(n213), .Q(
        \regArr[14][4] ) );
  DFFRQX2M \regArr_reg[14][3]  ( .D(n164), .CK(CLK), .RN(n213), .Q(
        \regArr[14][3] ) );
  DFFRQX2M \regArr_reg[14][2]  ( .D(n163), .CK(CLK), .RN(n213), .Q(
        \regArr[14][2] ) );
  DFFRQX2M \regArr_reg[14][1]  ( .D(n162), .CK(CLK), .RN(n213), .Q(
        \regArr[14][1] ) );
  DFFRQX2M \regArr_reg[14][0]  ( .D(n161), .CK(CLK), .RN(n213), .Q(
        \regArr[14][0] ) );
  DFFRQX2M \regArr_reg[10][7]  ( .D(n136), .CK(CLK), .RN(n211), .Q(
        \regArr[10][7] ) );
  DFFRQX2M \regArr_reg[10][6]  ( .D(n135), .CK(CLK), .RN(n211), .Q(
        \regArr[10][6] ) );
  DFFRQX2M \regArr_reg[10][5]  ( .D(n134), .CK(CLK), .RN(n211), .Q(
        \regArr[10][5] ) );
  DFFRQX2M \regArr_reg[10][4]  ( .D(n133), .CK(CLK), .RN(n211), .Q(
        \regArr[10][4] ) );
  DFFRQX2M \regArr_reg[10][3]  ( .D(n132), .CK(CLK), .RN(n211), .Q(
        \regArr[10][3] ) );
  DFFRQX2M \regArr_reg[10][2]  ( .D(n131), .CK(CLK), .RN(n211), .Q(
        \regArr[10][2] ) );
  DFFRQX2M \regArr_reg[10][1]  ( .D(n130), .CK(CLK), .RN(n211), .Q(
        \regArr[10][1] ) );
  DFFRQX2M \regArr_reg[10][0]  ( .D(n129), .CK(CLK), .RN(n211), .Q(
        \regArr[10][0] ) );
  DFFRQX2M \regArr_reg[6][7]  ( .D(n104), .CK(CLK), .RN(n209), .Q(
        \regArr[6][7] ) );
  DFFRQX2M \regArr_reg[6][6]  ( .D(n103), .CK(CLK), .RN(n209), .Q(
        \regArr[6][6] ) );
  DFFRQX2M \regArr_reg[6][5]  ( .D(n102), .CK(CLK), .RN(n209), .Q(
        \regArr[6][5] ) );
  DFFRQX2M \regArr_reg[6][4]  ( .D(n101), .CK(CLK), .RN(n209), .Q(
        \regArr[6][4] ) );
  DFFRQX2M \regArr_reg[6][3]  ( .D(n100), .CK(CLK), .RN(n209), .Q(
        \regArr[6][3] ) );
  DFFRQX2M \regArr_reg[6][2]  ( .D(n99), .CK(CLK), .RN(n208), .Q(
        \regArr[6][2] ) );
  DFFRQX2M \regArr_reg[6][1]  ( .D(n98), .CK(CLK), .RN(n208), .Q(
        \regArr[6][1] ) );
  DFFRQX2M \regArr_reg[6][0]  ( .D(n97), .CK(CLK), .RN(n208), .Q(
        \regArr[6][0] ) );
  DFFRQX2M \regArr_reg[12][7]  ( .D(n152), .CK(CLK), .RN(n212), .Q(
        \regArr[12][7] ) );
  DFFRQX2M \regArr_reg[12][6]  ( .D(n151), .CK(CLK), .RN(n212), .Q(
        \regArr[12][6] ) );
  DFFRQX2M \regArr_reg[12][5]  ( .D(n150), .CK(CLK), .RN(n212), .Q(
        \regArr[12][5] ) );
  DFFRQX2M \regArr_reg[12][4]  ( .D(n149), .CK(CLK), .RN(n212), .Q(
        \regArr[12][4] ) );
  DFFRQX2M \regArr_reg[12][3]  ( .D(n148), .CK(CLK), .RN(n212), .Q(
        \regArr[12][3] ) );
  DFFRQX2M \regArr_reg[12][2]  ( .D(n147), .CK(CLK), .RN(n212), .Q(
        \regArr[12][2] ) );
  DFFRQX2M \regArr_reg[12][1]  ( .D(n146), .CK(CLK), .RN(n212), .Q(
        \regArr[12][1] ) );
  DFFRQX2M \regArr_reg[12][0]  ( .D(n145), .CK(CLK), .RN(n212), .Q(
        \regArr[12][0] ) );
  DFFRQX2M \regArr_reg[8][7]  ( .D(n120), .CK(CLK), .RN(n210), .Q(
        \regArr[8][7] ) );
  DFFRQX2M \regArr_reg[8][6]  ( .D(n119), .CK(CLK), .RN(n210), .Q(
        \regArr[8][6] ) );
  DFFRQX2M \regArr_reg[8][5]  ( .D(n118), .CK(CLK), .RN(n210), .Q(
        \regArr[8][5] ) );
  DFFRQX2M \regArr_reg[8][4]  ( .D(n117), .CK(CLK), .RN(n210), .Q(
        \regArr[8][4] ) );
  DFFRQX2M \regArr_reg[8][3]  ( .D(n116), .CK(CLK), .RN(n210), .Q(
        \regArr[8][3] ) );
  DFFRQX2M \regArr_reg[8][2]  ( .D(n115), .CK(CLK), .RN(n210), .Q(
        \regArr[8][2] ) );
  DFFRQX2M \regArr_reg[8][1]  ( .D(n114), .CK(CLK), .RN(n210), .Q(
        \regArr[8][1] ) );
  DFFRQX2M \regArr_reg[8][0]  ( .D(n113), .CK(CLK), .RN(n209), .Q(
        \regArr[8][0] ) );
  DFFRQX2M \regArr_reg[4][7]  ( .D(n88), .CK(CLK), .RN(n208), .Q(
        \regArr[4][7] ) );
  DFFRQX2M \regArr_reg[4][6]  ( .D(n87), .CK(CLK), .RN(n208), .Q(
        \regArr[4][6] ) );
  DFFRQX2M \regArr_reg[4][5]  ( .D(n86), .CK(CLK), .RN(n208), .Q(
        \regArr[4][5] ) );
  DFFRQX2M \regArr_reg[4][4]  ( .D(n85), .CK(CLK), .RN(n208), .Q(
        \regArr[4][4] ) );
  DFFRQX2M \regArr_reg[4][3]  ( .D(n84), .CK(CLK), .RN(n207), .Q(
        \regArr[4][3] ) );
  DFFRQX2M \regArr_reg[4][2]  ( .D(n83), .CK(CLK), .RN(n207), .Q(
        \regArr[4][2] ) );
  DFFRQX2M \regArr_reg[4][1]  ( .D(n82), .CK(CLK), .RN(n207), .Q(
        \regArr[4][1] ) );
  DFFRQX2M \regArr_reg[4][0]  ( .D(n81), .CK(CLK), .RN(n207), .Q(
        \regArr[4][0] ) );
  DFFRQX2M \RdData_reg[7]  ( .D(n47), .CK(CLK), .RN(n205), .Q(RdData[7]) );
  DFFRQX2M \RdData_reg[6]  ( .D(n46), .CK(CLK), .RN(n205), .Q(RdData[6]) );
  DFFRQX2M \RdData_reg[5]  ( .D(n45), .CK(CLK), .RN(n205), .Q(RdData[5]) );
  DFFRQX2M \RdData_reg[4]  ( .D(n44), .CK(CLK), .RN(n205), .Q(RdData[4]) );
  DFFRQX2M \RdData_reg[3]  ( .D(n43), .CK(CLK), .RN(n205), .Q(RdData[3]) );
  DFFRQX2M \RdData_reg[2]  ( .D(n42), .CK(CLK), .RN(n205), .Q(RdData[2]) );
  DFFRQX2M \RdData_reg[1]  ( .D(n41), .CK(CLK), .RN(n205), .Q(RdData[1]) );
  DFFRQX2M \RdData_reg[0]  ( .D(n40), .CK(CLK), .RN(n209), .Q(RdData[0]) );
  DFFRQX2M \regArr_reg[1][6]  ( .D(n63), .CK(CLK), .RN(n206), .Q(REG1[6]) );
  DFFRQX2M \regArr_reg[0][7]  ( .D(n56), .CK(CLK), .RN(n206), .Q(REG0[7]) );
  DFFRQX2M \regArr_reg[0][6]  ( .D(n55), .CK(CLK), .RN(n206), .Q(REG0[6]) );
  DFFRQX2M \regArr_reg[0][5]  ( .D(n54), .CK(CLK), .RN(n206), .Q(REG0[5]) );
  DFFRQX2M \regArr_reg[0][4]  ( .D(n53), .CK(CLK), .RN(n206), .Q(REG0[4]) );
  DFFRQX2M \regArr_reg[0][3]  ( .D(n52), .CK(CLK), .RN(n206), .Q(REG0[3]) );
  DFFRQX2M \regArr_reg[0][2]  ( .D(n51), .CK(CLK), .RN(n205), .Q(REG0[2]) );
  DFFRQX2M \regArr_reg[0][1]  ( .D(n50), .CK(CLK), .RN(n205), .Q(REG0[1]) );
  DFFRQX2M \regArr_reg[0][0]  ( .D(n49), .CK(CLK), .RN(n205), .Q(REG0[0]) );
  DFFRQX2M \regArr_reg[2][1]  ( .D(n66), .CK(CLK), .RN(n206), .Q(REG2[1]) );
  DFFSQX2M \regArr_reg[2][0]  ( .D(n65), .CK(CLK), .SN(n205), .Q(REG2[0]) );
  DFFRQX2M RdData_VLD_reg ( .D(n48), .CK(CLK), .RN(n205), .Q(RdData_VLD) );
  DFFRQX2M \regArr_reg[3][0]  ( .D(n73), .CK(CLK), .RN(n207), .Q(REG3[0]) );
  DFFRQX2M \regArr_reg[1][1]  ( .D(n58), .CK(CLK), .RN(n206), .Q(REG1[1]) );
  DFFRQX2M \regArr_reg[1][5]  ( .D(n62), .CK(CLK), .RN(n206), .Q(REG1[5]) );
  DFFRQX2M \regArr_reg[1][4]  ( .D(n61), .CK(CLK), .RN(n206), .Q(REG1[4]) );
  DFFRQX2M \regArr_reg[1][7]  ( .D(n64), .CK(CLK), .RN(n206), .Q(REG1[7]) );
  DFFRQX2M \regArr_reg[1][3]  ( .D(n60), .CK(CLK), .RN(n206), .Q(REG1[3]) );
  DFFRQX2M \regArr_reg[1][2]  ( .D(n59), .CK(CLK), .RN(n206), .Q(REG1[2]) );
  DFFRQX2M \regArr_reg[1][0]  ( .D(n57), .CK(CLK), .RN(n206), .Q(REG1[0]) );
  DFFSQX2M \regArr_reg[3][5]  ( .D(n78), .CK(CLK), .SN(n205), .Q(REG3[5]) );
  DFFRQX2M \regArr_reg[3][7]  ( .D(n80), .CK(CLK), .RN(n207), .Q(REG3[7]) );
  DFFRQX2M \regArr_reg[3][6]  ( .D(n79), .CK(CLK), .RN(n207), .Q(REG3[6]) );
  DFFRQX2M \regArr_reg[3][3]  ( .D(n76), .CK(CLK), .RN(n207), .Q(REG3[3]) );
  DFFRQX2M \regArr_reg[3][2]  ( .D(n75), .CK(CLK), .RN(n207), .Q(REG3[2]) );
  DFFRQX2M \regArr_reg[3][4]  ( .D(n77), .CK(CLK), .RN(n207), .Q(REG3[4]) );
  DFFRQX2M \regArr_reg[3][1]  ( .D(n74), .CK(CLK), .RN(n207), .Q(REG3[1]) );
  DFFRQX2M \regArr_reg[2][4]  ( .D(n69), .CK(CLK), .RN(n207), .Q(REG2[4]) );
  DFFSQX2M \regArr_reg[2][7]  ( .D(n72), .CK(CLK), .SN(n205), .Q(REG2[7]) );
  DFFRQX2M \regArr_reg[2][3]  ( .D(n68), .CK(CLK), .RN(n206), .Q(REG2[3]) );
  DFFRQX2M \regArr_reg[2][6]  ( .D(n71), .CK(CLK), .RN(n207), .Q(REG2[6]) );
  DFFRQX2M \regArr_reg[2][2]  ( .D(n67), .CK(CLK), .RN(n207), .Q(REG2[2]) );
  DFFRQX2M \regArr_reg[2][5]  ( .D(n70), .CK(CLK), .RN(n207), .Q(REG2[5]) );
  NOR2BX2M U3 ( .AN(n38), .B(n203), .Y(n32) );
  NOR2BX2M U4 ( .AN(N13), .B(n199), .Y(n23) );
  NOR2BX2M U5 ( .AN(N13), .B(n204), .Y(n26) );
  NOR2BX2M U6 ( .AN(n27), .B(n203), .Y(n18) );
  NOR2X2M U7 ( .A(n204), .B(N13), .Y(n20) );
  NOR2X2M U8 ( .A(n199), .B(N13), .Y(n15) );
  INVX2M U9 ( .A(n200), .Y(n201) );
  INVX2M U10 ( .A(n198), .Y(n199) );
  INVX2M U11 ( .A(n200), .Y(n202) );
  BUFX2M U12 ( .A(n203), .Y(n200) );
  BUFX2M U13 ( .A(n204), .Y(n198) );
  NOR2BX2M U14 ( .AN(n27), .B(N11), .Y(n16) );
  NOR2BX2M U15 ( .AN(n38), .B(N11), .Y(n30) );
  NAND2X2M U16 ( .A(n18), .B(n15), .Y(n17) );
  NAND2X2M U17 ( .A(n30), .B(n15), .Y(n29) );
  NAND2X2M U18 ( .A(n32), .B(n15), .Y(n31) );
  NAND2X2M U19 ( .A(n30), .B(n20), .Y(n33) );
  NAND2X2M U20 ( .A(n32), .B(n20), .Y(n34) );
  NAND2X2M U21 ( .A(n20), .B(n16), .Y(n19) );
  NAND2X2M U22 ( .A(n20), .B(n18), .Y(n21) );
  NAND2X2M U23 ( .A(n23), .B(n16), .Y(n22) );
  NAND2X2M U24 ( .A(n23), .B(n18), .Y(n24) );
  NAND2X2M U25 ( .A(n26), .B(n16), .Y(n25) );
  NAND2X2M U26 ( .A(n26), .B(n18), .Y(n28) );
  NAND2X2M U27 ( .A(n30), .B(n23), .Y(n35) );
  NAND2X2M U28 ( .A(n32), .B(n23), .Y(n36) );
  NAND2X2M U29 ( .A(n30), .B(n26), .Y(n37) );
  NAND2X2M U30 ( .A(n32), .B(n26), .Y(n39) );
  NAND2X2M U31 ( .A(n15), .B(n16), .Y(n14) );
  INVX2M U32 ( .A(n12), .Y(n224) );
  NAND2BX2M U33 ( .AN(WrEn), .B(RdEn), .Y(n12) );
  NOR2BX2M U34 ( .AN(WrEn), .B(RdEn), .Y(n13) );
  NOR2BX2M U35 ( .AN(n13), .B(N14), .Y(n27) );
  AND2X2M U36 ( .A(N14), .B(n13), .Y(n38) );
  BUFX2M U37 ( .A(n219), .Y(n205) );
  BUFX2M U38 ( .A(n219), .Y(n206) );
  BUFX2M U39 ( .A(n218), .Y(n207) );
  BUFX2M U40 ( .A(n218), .Y(n208) );
  BUFX2M U41 ( .A(n217), .Y(n209) );
  BUFX2M U42 ( .A(n217), .Y(n210) );
  BUFX2M U43 ( .A(n216), .Y(n211) );
  BUFX2M U44 ( .A(n216), .Y(n212) );
  BUFX2M U45 ( .A(n215), .Y(n213) );
  BUFX2M U46 ( .A(n215), .Y(n214) );
  INVX2M U47 ( .A(WrData[5]), .Y(n227) );
  INVX2M U48 ( .A(N12), .Y(n204) );
  INVX2M U49 ( .A(N11), .Y(n203) );
  INVX2M U50 ( .A(WrData[0]), .Y(n220) );
  INVX2M U51 ( .A(WrData[1]), .Y(n221) );
  INVX2M U52 ( .A(WrData[2]), .Y(n222) );
  INVX2M U53 ( .A(WrData[3]), .Y(n223) );
  BUFX2M U54 ( .A(RST), .Y(n218) );
  BUFX2M U55 ( .A(RST), .Y(n217) );
  BUFX2M U56 ( .A(RST), .Y(n216) );
  BUFX2M U57 ( .A(RST), .Y(n215) );
  BUFX2M U58 ( .A(RST), .Y(n219) );
  INVX2M U59 ( .A(WrData[4]), .Y(n228) );
  INVX2M U60 ( .A(WrData[6]), .Y(n226) );
  INVX2M U61 ( .A(WrData[7]), .Y(n225) );
  OAI2BB2X1M U62 ( .B0(n14), .B1(n220), .A0N(REG0[0]), .A1N(n14), .Y(n49) );
  OAI2BB2X1M U63 ( .B0(n14), .B1(n221), .A0N(REG0[1]), .A1N(n14), .Y(n50) );
  OAI2BB2X1M U64 ( .B0(n14), .B1(n222), .A0N(REG0[2]), .A1N(n14), .Y(n51) );
  OAI2BB2X1M U65 ( .B0(n14), .B1(n223), .A0N(REG0[3]), .A1N(n14), .Y(n52) );
  OAI2BB2X1M U66 ( .B0(n14), .B1(n228), .A0N(REG0[4]), .A1N(n14), .Y(n53) );
  OAI2BB2X1M U67 ( .B0(n14), .B1(n227), .A0N(REG0[5]), .A1N(n14), .Y(n54) );
  OAI2BB2X1M U68 ( .B0(n14), .B1(n226), .A0N(REG0[6]), .A1N(n14), .Y(n55) );
  OAI2BB2X1M U69 ( .B0(n14), .B1(n225), .A0N(REG0[7]), .A1N(n14), .Y(n56) );
  OAI2BB2X1M U70 ( .B0(n220), .B1(n17), .A0N(REG1[0]), .A1N(n17), .Y(n57) );
  OAI2BB2X1M U71 ( .B0(n221), .B1(n17), .A0N(REG1[1]), .A1N(n17), .Y(n58) );
  OAI2BB2X1M U72 ( .B0(n222), .B1(n17), .A0N(REG1[2]), .A1N(n17), .Y(n59) );
  OAI2BB2X1M U73 ( .B0(n223), .B1(n17), .A0N(REG1[3]), .A1N(n17), .Y(n60) );
  OAI2BB2X1M U74 ( .B0(n228), .B1(n17), .A0N(REG1[4]), .A1N(n17), .Y(n61) );
  OAI2BB2X1M U75 ( .B0(n227), .B1(n17), .A0N(REG1[5]), .A1N(n17), .Y(n62) );
  OAI2BB2X1M U76 ( .B0(n226), .B1(n17), .A0N(REG1[6]), .A1N(n17), .Y(n63) );
  OAI2BB2X1M U77 ( .B0(n225), .B1(n17), .A0N(REG1[7]), .A1N(n17), .Y(n64) );
  OAI2BB2X1M U78 ( .B0(n220), .B1(n22), .A0N(\regArr[4][0] ), .A1N(n22), .Y(
        n81) );
  OAI2BB2X1M U79 ( .B0(n221), .B1(n22), .A0N(\regArr[4][1] ), .A1N(n22), .Y(
        n82) );
  OAI2BB2X1M U80 ( .B0(n222), .B1(n22), .A0N(\regArr[4][2] ), .A1N(n22), .Y(
        n83) );
  OAI2BB2X1M U81 ( .B0(n223), .B1(n22), .A0N(\regArr[4][3] ), .A1N(n22), .Y(
        n84) );
  OAI2BB2X1M U82 ( .B0(n228), .B1(n22), .A0N(\regArr[4][4] ), .A1N(n22), .Y(
        n85) );
  OAI2BB2X1M U83 ( .B0(n227), .B1(n22), .A0N(\regArr[4][5] ), .A1N(n22), .Y(
        n86) );
  OAI2BB2X1M U84 ( .B0(n226), .B1(n22), .A0N(\regArr[4][6] ), .A1N(n22), .Y(
        n87) );
  OAI2BB2X1M U85 ( .B0(n225), .B1(n22), .A0N(\regArr[4][7] ), .A1N(n22), .Y(
        n88) );
  OAI2BB2X1M U86 ( .B0(n220), .B1(n24), .A0N(\regArr[5][0] ), .A1N(n24), .Y(
        n89) );
  OAI2BB2X1M U87 ( .B0(n221), .B1(n24), .A0N(\regArr[5][1] ), .A1N(n24), .Y(
        n90) );
  OAI2BB2X1M U88 ( .B0(n222), .B1(n24), .A0N(\regArr[5][2] ), .A1N(n24), .Y(
        n91) );
  OAI2BB2X1M U89 ( .B0(n223), .B1(n24), .A0N(\regArr[5][3] ), .A1N(n24), .Y(
        n92) );
  OAI2BB2X1M U90 ( .B0(n228), .B1(n24), .A0N(\regArr[5][4] ), .A1N(n24), .Y(
        n93) );
  OAI2BB2X1M U91 ( .B0(n227), .B1(n24), .A0N(\regArr[5][5] ), .A1N(n24), .Y(
        n94) );
  OAI2BB2X1M U92 ( .B0(n226), .B1(n24), .A0N(\regArr[5][6] ), .A1N(n24), .Y(
        n95) );
  OAI2BB2X1M U93 ( .B0(n225), .B1(n24), .A0N(\regArr[5][7] ), .A1N(n24), .Y(
        n96) );
  OAI2BB2X1M U94 ( .B0(n220), .B1(n25), .A0N(\regArr[6][0] ), .A1N(n25), .Y(
        n97) );
  OAI2BB2X1M U95 ( .B0(n221), .B1(n25), .A0N(\regArr[6][1] ), .A1N(n25), .Y(
        n98) );
  OAI2BB2X1M U96 ( .B0(n222), .B1(n25), .A0N(\regArr[6][2] ), .A1N(n25), .Y(
        n99) );
  OAI2BB2X1M U97 ( .B0(n223), .B1(n25), .A0N(\regArr[6][3] ), .A1N(n25), .Y(
        n100) );
  OAI2BB2X1M U98 ( .B0(n228), .B1(n25), .A0N(\regArr[6][4] ), .A1N(n25), .Y(
        n101) );
  OAI2BB2X1M U99 ( .B0(n227), .B1(n25), .A0N(\regArr[6][5] ), .A1N(n25), .Y(
        n102) );
  OAI2BB2X1M U100 ( .B0(n226), .B1(n25), .A0N(\regArr[6][6] ), .A1N(n25), .Y(
        n103) );
  OAI2BB2X1M U101 ( .B0(n225), .B1(n25), .A0N(\regArr[6][7] ), .A1N(n25), .Y(
        n104) );
  OAI2BB2X1M U102 ( .B0(n220), .B1(n28), .A0N(\regArr[7][0] ), .A1N(n28), .Y(
        n105) );
  OAI2BB2X1M U103 ( .B0(n221), .B1(n28), .A0N(\regArr[7][1] ), .A1N(n28), .Y(
        n106) );
  OAI2BB2X1M U104 ( .B0(n222), .B1(n28), .A0N(\regArr[7][2] ), .A1N(n28), .Y(
        n107) );
  OAI2BB2X1M U105 ( .B0(n223), .B1(n28), .A0N(\regArr[7][3] ), .A1N(n28), .Y(
        n108) );
  OAI2BB2X1M U106 ( .B0(n228), .B1(n28), .A0N(\regArr[7][4] ), .A1N(n28), .Y(
        n109) );
  OAI2BB2X1M U107 ( .B0(n227), .B1(n28), .A0N(\regArr[7][5] ), .A1N(n28), .Y(
        n110) );
  OAI2BB2X1M U108 ( .B0(n226), .B1(n28), .A0N(\regArr[7][6] ), .A1N(n28), .Y(
        n111) );
  OAI2BB2X1M U109 ( .B0(n225), .B1(n28), .A0N(\regArr[7][7] ), .A1N(n28), .Y(
        n112) );
  OAI2BB2X1M U110 ( .B0(n220), .B1(n29), .A0N(\regArr[8][0] ), .A1N(n29), .Y(
        n113) );
  OAI2BB2X1M U111 ( .B0(n221), .B1(n29), .A0N(\regArr[8][1] ), .A1N(n29), .Y(
        n114) );
  OAI2BB2X1M U112 ( .B0(n222), .B1(n29), .A0N(\regArr[8][2] ), .A1N(n29), .Y(
        n115) );
  OAI2BB2X1M U113 ( .B0(n223), .B1(n29), .A0N(\regArr[8][3] ), .A1N(n29), .Y(
        n116) );
  OAI2BB2X1M U114 ( .B0(n228), .B1(n29), .A0N(\regArr[8][4] ), .A1N(n29), .Y(
        n117) );
  OAI2BB2X1M U115 ( .B0(n227), .B1(n29), .A0N(\regArr[8][5] ), .A1N(n29), .Y(
        n118) );
  OAI2BB2X1M U116 ( .B0(n226), .B1(n29), .A0N(\regArr[8][6] ), .A1N(n29), .Y(
        n119) );
  OAI2BB2X1M U117 ( .B0(n225), .B1(n29), .A0N(\regArr[8][7] ), .A1N(n29), .Y(
        n120) );
  OAI2BB2X1M U118 ( .B0(n220), .B1(n31), .A0N(\regArr[9][0] ), .A1N(n31), .Y(
        n121) );
  OAI2BB2X1M U119 ( .B0(n221), .B1(n31), .A0N(\regArr[9][1] ), .A1N(n31), .Y(
        n122) );
  OAI2BB2X1M U120 ( .B0(n222), .B1(n31), .A0N(\regArr[9][2] ), .A1N(n31), .Y(
        n123) );
  OAI2BB2X1M U121 ( .B0(n223), .B1(n31), .A0N(\regArr[9][3] ), .A1N(n31), .Y(
        n124) );
  OAI2BB2X1M U122 ( .B0(n228), .B1(n31), .A0N(\regArr[9][4] ), .A1N(n31), .Y(
        n125) );
  OAI2BB2X1M U123 ( .B0(n227), .B1(n31), .A0N(\regArr[9][5] ), .A1N(n31), .Y(
        n126) );
  OAI2BB2X1M U124 ( .B0(n226), .B1(n31), .A0N(\regArr[9][6] ), .A1N(n31), .Y(
        n127) );
  OAI2BB2X1M U125 ( .B0(n225), .B1(n31), .A0N(\regArr[9][7] ), .A1N(n31), .Y(
        n128) );
  OAI2BB2X1M U126 ( .B0(n220), .B1(n33), .A0N(\regArr[10][0] ), .A1N(n33), .Y(
        n129) );
  OAI2BB2X1M U127 ( .B0(n221), .B1(n33), .A0N(\regArr[10][1] ), .A1N(n33), .Y(
        n130) );
  OAI2BB2X1M U128 ( .B0(n222), .B1(n33), .A0N(\regArr[10][2] ), .A1N(n33), .Y(
        n131) );
  OAI2BB2X1M U129 ( .B0(n223), .B1(n33), .A0N(\regArr[10][3] ), .A1N(n33), .Y(
        n132) );
  OAI2BB2X1M U130 ( .B0(n228), .B1(n33), .A0N(\regArr[10][4] ), .A1N(n33), .Y(
        n133) );
  OAI2BB2X1M U131 ( .B0(n227), .B1(n33), .A0N(\regArr[10][5] ), .A1N(n33), .Y(
        n134) );
  OAI2BB2X1M U132 ( .B0(n226), .B1(n33), .A0N(\regArr[10][6] ), .A1N(n33), .Y(
        n135) );
  OAI2BB2X1M U133 ( .B0(n225), .B1(n33), .A0N(\regArr[10][7] ), .A1N(n33), .Y(
        n136) );
  OAI2BB2X1M U134 ( .B0(n220), .B1(n34), .A0N(\regArr[11][0] ), .A1N(n34), .Y(
        n137) );
  OAI2BB2X1M U135 ( .B0(n221), .B1(n34), .A0N(\regArr[11][1] ), .A1N(n34), .Y(
        n138) );
  OAI2BB2X1M U136 ( .B0(n222), .B1(n34), .A0N(\regArr[11][2] ), .A1N(n34), .Y(
        n139) );
  OAI2BB2X1M U137 ( .B0(n223), .B1(n34), .A0N(\regArr[11][3] ), .A1N(n34), .Y(
        n140) );
  OAI2BB2X1M U138 ( .B0(n228), .B1(n34), .A0N(\regArr[11][4] ), .A1N(n34), .Y(
        n141) );
  OAI2BB2X1M U139 ( .B0(n227), .B1(n34), .A0N(\regArr[11][5] ), .A1N(n34), .Y(
        n142) );
  OAI2BB2X1M U140 ( .B0(n226), .B1(n34), .A0N(\regArr[11][6] ), .A1N(n34), .Y(
        n143) );
  OAI2BB2X1M U141 ( .B0(n225), .B1(n34), .A0N(\regArr[11][7] ), .A1N(n34), .Y(
        n144) );
  OAI2BB2X1M U142 ( .B0(n220), .B1(n35), .A0N(\regArr[12][0] ), .A1N(n35), .Y(
        n145) );
  OAI2BB2X1M U143 ( .B0(n221), .B1(n35), .A0N(\regArr[12][1] ), .A1N(n35), .Y(
        n146) );
  OAI2BB2X1M U144 ( .B0(n222), .B1(n35), .A0N(\regArr[12][2] ), .A1N(n35), .Y(
        n147) );
  OAI2BB2X1M U145 ( .B0(n223), .B1(n35), .A0N(\regArr[12][3] ), .A1N(n35), .Y(
        n148) );
  OAI2BB2X1M U146 ( .B0(n228), .B1(n35), .A0N(\regArr[12][4] ), .A1N(n35), .Y(
        n149) );
  OAI2BB2X1M U147 ( .B0(n227), .B1(n35), .A0N(\regArr[12][5] ), .A1N(n35), .Y(
        n150) );
  OAI2BB2X1M U148 ( .B0(n226), .B1(n35), .A0N(\regArr[12][6] ), .A1N(n35), .Y(
        n151) );
  OAI2BB2X1M U149 ( .B0(n225), .B1(n35), .A0N(\regArr[12][7] ), .A1N(n35), .Y(
        n152) );
  OAI2BB2X1M U150 ( .B0(n220), .B1(n36), .A0N(\regArr[13][0] ), .A1N(n36), .Y(
        n153) );
  OAI2BB2X1M U151 ( .B0(n221), .B1(n36), .A0N(\regArr[13][1] ), .A1N(n36), .Y(
        n154) );
  OAI2BB2X1M U152 ( .B0(n222), .B1(n36), .A0N(\regArr[13][2] ), .A1N(n36), .Y(
        n155) );
  OAI2BB2X1M U153 ( .B0(n223), .B1(n36), .A0N(\regArr[13][3] ), .A1N(n36), .Y(
        n156) );
  OAI2BB2X1M U154 ( .B0(n228), .B1(n36), .A0N(\regArr[13][4] ), .A1N(n36), .Y(
        n157) );
  OAI2BB2X1M U155 ( .B0(n227), .B1(n36), .A0N(\regArr[13][5] ), .A1N(n36), .Y(
        n158) );
  OAI2BB2X1M U156 ( .B0(n226), .B1(n36), .A0N(\regArr[13][6] ), .A1N(n36), .Y(
        n159) );
  OAI2BB2X1M U157 ( .B0(n225), .B1(n36), .A0N(\regArr[13][7] ), .A1N(n36), .Y(
        n160) );
  OAI2BB2X1M U158 ( .B0(n220), .B1(n37), .A0N(\regArr[14][0] ), .A1N(n37), .Y(
        n161) );
  OAI2BB2X1M U159 ( .B0(n221), .B1(n37), .A0N(\regArr[14][1] ), .A1N(n37), .Y(
        n162) );
  OAI2BB2X1M U160 ( .B0(n222), .B1(n37), .A0N(\regArr[14][2] ), .A1N(n37), .Y(
        n163) );
  OAI2BB2X1M U161 ( .B0(n223), .B1(n37), .A0N(\regArr[14][3] ), .A1N(n37), .Y(
        n164) );
  OAI2BB2X1M U162 ( .B0(n228), .B1(n37), .A0N(\regArr[14][4] ), .A1N(n37), .Y(
        n165) );
  OAI2BB2X1M U163 ( .B0(n227), .B1(n37), .A0N(\regArr[14][5] ), .A1N(n37), .Y(
        n166) );
  OAI2BB2X1M U164 ( .B0(n226), .B1(n37), .A0N(\regArr[14][6] ), .A1N(n37), .Y(
        n167) );
  OAI2BB2X1M U165 ( .B0(n225), .B1(n37), .A0N(\regArr[14][7] ), .A1N(n37), .Y(
        n168) );
  OAI2BB2X1M U166 ( .B0(n220), .B1(n39), .A0N(\regArr[15][0] ), .A1N(n39), .Y(
        n169) );
  OAI2BB2X1M U167 ( .B0(n221), .B1(n39), .A0N(\regArr[15][1] ), .A1N(n39), .Y(
        n170) );
  OAI2BB2X1M U168 ( .B0(n222), .B1(n39), .A0N(\regArr[15][2] ), .A1N(n39), .Y(
        n171) );
  OAI2BB2X1M U169 ( .B0(n223), .B1(n39), .A0N(\regArr[15][3] ), .A1N(n39), .Y(
        n172) );
  OAI2BB2X1M U170 ( .B0(n228), .B1(n39), .A0N(\regArr[15][4] ), .A1N(n39), .Y(
        n173) );
  OAI2BB2X1M U171 ( .B0(n227), .B1(n39), .A0N(\regArr[15][5] ), .A1N(n39), .Y(
        n174) );
  OAI2BB2X1M U172 ( .B0(n226), .B1(n39), .A0N(\regArr[15][6] ), .A1N(n39), .Y(
        n175) );
  OAI2BB2X1M U173 ( .B0(n225), .B1(n39), .A0N(\regArr[15][7] ), .A1N(n39), .Y(
        n176) );
  OAI2BB2X1M U174 ( .B0(n221), .B1(n19), .A0N(REG2[1]), .A1N(n19), .Y(n66) );
  OAI2BB2X1M U175 ( .B0(n222), .B1(n19), .A0N(REG2[2]), .A1N(n19), .Y(n67) );
  OAI2BB2X1M U176 ( .B0(n223), .B1(n19), .A0N(REG2[3]), .A1N(n19), .Y(n68) );
  OAI2BB2X1M U177 ( .B0(n228), .B1(n19), .A0N(REG2[4]), .A1N(n19), .Y(n69) );
  OAI2BB2X1M U178 ( .B0(n227), .B1(n19), .A0N(REG2[5]), .A1N(n19), .Y(n70) );
  OAI2BB2X1M U179 ( .B0(n226), .B1(n19), .A0N(REG2[6]), .A1N(n19), .Y(n71) );
  OAI2BB2X1M U180 ( .B0(n220), .B1(n21), .A0N(REG3[0]), .A1N(n21), .Y(n73) );
  OAI2BB2X1M U181 ( .B0(n221), .B1(n21), .A0N(REG3[1]), .A1N(n21), .Y(n74) );
  OAI2BB2X1M U182 ( .B0(n222), .B1(n21), .A0N(REG3[2]), .A1N(n21), .Y(n75) );
  OAI2BB2X1M U183 ( .B0(n223), .B1(n21), .A0N(REG3[3]), .A1N(n21), .Y(n76) );
  OAI2BB2X1M U184 ( .B0(n228), .B1(n21), .A0N(REG3[4]), .A1N(n21), .Y(n77) );
  OAI2BB2X1M U185 ( .B0(n226), .B1(n21), .A0N(REG3[6]), .A1N(n21), .Y(n79) );
  OAI2BB2X1M U186 ( .B0(n225), .B1(n21), .A0N(REG3[7]), .A1N(n21), .Y(n80) );
  OAI2BB2X1M U187 ( .B0(n220), .B1(n19), .A0N(REG2[0]), .A1N(n19), .Y(n65) );
  OAI2BB2X1M U188 ( .B0(n225), .B1(n19), .A0N(REG2[7]), .A1N(n19), .Y(n72) );
  OAI2BB2X1M U189 ( .B0(n227), .B1(n21), .A0N(REG3[5]), .A1N(n21), .Y(n78) );
  AO22X1M U190 ( .A0(N43), .A1(n224), .B0(RdData[0]), .B1(n12), .Y(n40) );
  MX4X1M U191 ( .A(n4), .B(n2), .C(n3), .D(n1), .S0(N14), .S1(N13), .Y(N43) );
  MX4X1M U192 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(N11), 
        .S1(n199), .Y(n4) );
  MX4X1M U193 ( .A(\regArr[8][0] ), .B(\regArr[9][0] ), .C(\regArr[10][0] ), 
        .D(\regArr[11][0] ), .S0(N11), .S1(n199), .Y(n2) );
  AO22X1M U194 ( .A0(N42), .A1(n224), .B0(RdData[1]), .B1(n12), .Y(n41) );
  MX4X1M U195 ( .A(n8), .B(n6), .C(n7), .D(n5), .S0(N14), .S1(N13), .Y(N42) );
  MX4X1M U196 ( .A(\regArr[8][1] ), .B(\regArr[9][1] ), .C(\regArr[10][1] ), 
        .D(\regArr[11][1] ), .S0(N11), .S1(n199), .Y(n6) );
  MX4X1M U197 ( .A(\regArr[12][1] ), .B(\regArr[13][1] ), .C(\regArr[14][1] ), 
        .D(\regArr[15][1] ), .S0(n201), .S1(n199), .Y(n5) );
  AO22X1M U198 ( .A0(N41), .A1(n224), .B0(RdData[2]), .B1(n12), .Y(n42) );
  MX4X1M U199 ( .A(n177), .B(n10), .C(n11), .D(n9), .S0(N14), .S1(N13), .Y(N41) );
  MX4X1M U200 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n201), 
        .S1(N12), .Y(n177) );
  MX4X1M U201 ( .A(\regArr[8][2] ), .B(\regArr[9][2] ), .C(\regArr[10][2] ), 
        .D(\regArr[11][2] ), .S0(n201), .S1(N12), .Y(n10) );
  AO22X1M U202 ( .A0(N40), .A1(n224), .B0(RdData[3]), .B1(n12), .Y(n43) );
  MX4X1M U203 ( .A(n181), .B(n179), .C(n180), .D(n178), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U204 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n201), 
        .S1(N12), .Y(n181) );
  MX4X1M U205 ( .A(\regArr[8][3] ), .B(\regArr[9][3] ), .C(\regArr[10][3] ), 
        .D(\regArr[11][3] ), .S0(n201), .S1(N12), .Y(n179) );
  AO22X1M U206 ( .A0(N39), .A1(n224), .B0(RdData[4]), .B1(n12), .Y(n44) );
  MX4X1M U207 ( .A(n185), .B(n183), .C(n184), .D(n182), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U208 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n202), 
        .S1(N12), .Y(n185) );
  MX4X1M U209 ( .A(\regArr[8][4] ), .B(\regArr[9][4] ), .C(\regArr[10][4] ), 
        .D(\regArr[11][4] ), .S0(n201), .S1(N12), .Y(n183) );
  AO22X1M U210 ( .A0(N38), .A1(n224), .B0(RdData[5]), .B1(n12), .Y(n45) );
  MX4X1M U211 ( .A(n189), .B(n187), .C(n188), .D(n186), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U212 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n202), 
        .S1(N12), .Y(n189) );
  MX4X1M U213 ( .A(\regArr[8][5] ), .B(\regArr[9][5] ), .C(\regArr[10][5] ), 
        .D(\regArr[11][5] ), .S0(n202), .S1(N12), .Y(n187) );
  AO22X1M U214 ( .A0(N37), .A1(n224), .B0(RdData[6]), .B1(n12), .Y(n46) );
  MX4X1M U215 ( .A(n193), .B(n191), .C(n192), .D(n190), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U216 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n202), 
        .S1(N12), .Y(n193) );
  MX4X1M U217 ( .A(\regArr[8][6] ), .B(\regArr[9][6] ), .C(\regArr[10][6] ), 
        .D(\regArr[11][6] ), .S0(n202), .S1(N12), .Y(n191) );
  AO22X1M U218 ( .A0(N36), .A1(n224), .B0(RdData[7]), .B1(n12), .Y(n47) );
  MX4X1M U219 ( .A(n197), .B(n195), .C(n196), .D(n194), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U220 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n202), 
        .S1(N12), .Y(n197) );
  MX4X1M U221 ( .A(\regArr[8][7] ), .B(\regArr[9][7] ), .C(\regArr[10][7] ), 
        .D(\regArr[11][7] ), .S0(n202), .S1(N12), .Y(n195) );
  MX4X1M U222 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n201), 
        .S1(n199), .Y(n8) );
  MX4X1M U223 ( .A(\regArr[4][0] ), .B(\regArr[5][0] ), .C(\regArr[6][0] ), 
        .D(\regArr[7][0] ), .S0(N11), .S1(n199), .Y(n3) );
  MX4X1M U224 ( .A(\regArr[4][1] ), .B(\regArr[5][1] ), .C(\regArr[6][1] ), 
        .D(\regArr[7][1] ), .S0(n201), .S1(n199), .Y(n7) );
  MX4X1M U225 ( .A(\regArr[4][2] ), .B(\regArr[5][2] ), .C(\regArr[6][2] ), 
        .D(\regArr[7][2] ), .S0(n201), .S1(N12), .Y(n11) );
  MX4X1M U226 ( .A(\regArr[4][3] ), .B(\regArr[5][3] ), .C(\regArr[6][3] ), 
        .D(\regArr[7][3] ), .S0(n201), .S1(N12), .Y(n180) );
  MX4X1M U227 ( .A(\regArr[4][4] ), .B(\regArr[5][4] ), .C(\regArr[6][4] ), 
        .D(\regArr[7][4] ), .S0(n201), .S1(N12), .Y(n184) );
  MX4X1M U228 ( .A(\regArr[4][5] ), .B(\regArr[5][5] ), .C(\regArr[6][5] ), 
        .D(\regArr[7][5] ), .S0(n202), .S1(N12), .Y(n188) );
  MX4X1M U229 ( .A(\regArr[4][6] ), .B(\regArr[5][6] ), .C(\regArr[6][6] ), 
        .D(\regArr[7][6] ), .S0(n202), .S1(N12), .Y(n192) );
  MX4X1M U230 ( .A(\regArr[4][7] ), .B(\regArr[5][7] ), .C(\regArr[6][7] ), 
        .D(\regArr[7][7] ), .S0(n202), .S1(N12), .Y(n196) );
  MX4X1M U231 ( .A(\regArr[12][0] ), .B(\regArr[13][0] ), .C(\regArr[14][0] ), 
        .D(\regArr[15][0] ), .S0(n202), .S1(n199), .Y(n1) );
  MX4X1M U232 ( .A(\regArr[12][2] ), .B(\regArr[13][2] ), .C(\regArr[14][2] ), 
        .D(\regArr[15][2] ), .S0(n201), .S1(n199), .Y(n9) );
  MX4X1M U233 ( .A(\regArr[12][3] ), .B(\regArr[13][3] ), .C(\regArr[14][3] ), 
        .D(\regArr[15][3] ), .S0(n201), .S1(n199), .Y(n178) );
  MX4X1M U234 ( .A(\regArr[12][4] ), .B(\regArr[13][4] ), .C(\regArr[14][4] ), 
        .D(\regArr[15][4] ), .S0(n201), .S1(N12), .Y(n182) );
  MX4X1M U235 ( .A(\regArr[12][5] ), .B(\regArr[13][5] ), .C(\regArr[14][5] ), 
        .D(\regArr[15][5] ), .S0(n202), .S1(n199), .Y(n186) );
  MX4X1M U236 ( .A(\regArr[12][6] ), .B(\regArr[13][6] ), .C(\regArr[14][6] ), 
        .D(\regArr[15][6] ), .S0(n202), .S1(n199), .Y(n190) );
  MX4X1M U237 ( .A(\regArr[12][7] ), .B(\regArr[13][7] ), .C(\regArr[14][7] ), 
        .D(\regArr[15][7] ), .S0(n202), .S1(n199), .Y(n194) );
  OAI2BB1X2M U238 ( .A0N(RdData_VLD), .A1N(n13), .B0(n12), .Y(n48) );
endmodule


module ALU_OPER_WIDTH8_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0
 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n13), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n15), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n16), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n17), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n14), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n13), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n12), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n11), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n17), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n17), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n17), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n17), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n17), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n17), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n16), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n15), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n14), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n13), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n14), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n15), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n14), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n16), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n15), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n16), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n15), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n16), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n16), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n12), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  INVX2M U1 ( .A(b[0]), .Y(n18) );
  XNOR2X2M U2 ( .A(n18), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n18), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n18), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n18), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n18), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n18), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  OR2X2M U8 ( .A(n18), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  XNOR2X2M U9 ( .A(n18), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  NAND2X2M U10 ( .A(n2), .B(n3), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U11 ( .A(a[5]), .Y(n3) );
  INVX2M U12 ( .A(n18), .Y(n2) );
  NAND2X2M U13 ( .A(n4), .B(n5), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U14 ( .A(a[4]), .Y(n5) );
  INVX2M U15 ( .A(n18), .Y(n4) );
  NAND2X2M U16 ( .A(n6), .B(n7), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U17 ( .A(a[3]), .Y(n7) );
  INVX2M U18 ( .A(n18), .Y(n6) );
  NAND2X2M U19 ( .A(n2), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U20 ( .A(a[2]), .Y(n8) );
  NAND2X2M U21 ( .A(n6), .B(n9), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U22 ( .A(a[1]), .Y(n9) );
  NAND2X2M U23 ( .A(n4), .B(n10), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U24 ( .A(a[0]), .Y(n10) );
  NAND2X2M U25 ( .A(n2), .B(n1), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U26 ( .A(a[6]), .Y(n1) );
  INVX2M U27 ( .A(b[6]), .Y(n12) );
  INVX2M U28 ( .A(b[1]), .Y(n17) );
  INVX2M U29 ( .A(b[2]), .Y(n16) );
  INVX2M U30 ( .A(b[3]), .Y(n15) );
  INVX2M U31 ( .A(b[4]), .Y(n14) );
  INVX2M U32 ( .A(b[5]), .Y(n13) );
  INVX2M U33 ( .A(b[7]), .Y(n11) );
  CLKMX2X2M U34 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U40 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U41 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U46 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U47 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U51 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U52 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U55 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U56 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U58 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U59 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U60 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U61 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U62 ( .A(\u_div/CryTmp[7][1] ), .B(n19), .C(n17), .D(n16), .Y(
        quotient[7]) );
  AND3X1M U63 ( .A(n19), .B(n16), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U64 ( .A(\u_div/CryTmp[5][3] ), .B(n19), .Y(quotient[5]) );
  AND2X1M U65 ( .A(n20), .B(n15), .Y(n19) );
  AND2X1M U66 ( .A(\u_div/CryTmp[4][4] ), .B(n20), .Y(quotient[4]) );
  AND3X1M U67 ( .A(n21), .B(n14), .C(n13), .Y(n20) );
  AND3X1M U68 ( .A(n21), .B(n13), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U69 ( .A(\u_div/CryTmp[2][6] ), .B(n21), .Y(quotient[2]) );
  NOR2X1M U70 ( .A(b[6]), .B(b[7]), .Y(n21) );
  AND2X1M U71 ( .A(\u_div/CryTmp[1][7] ), .B(n11), .Y(quotient[1]) );
endmodule


module ALU_OPER_WIDTH8_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  XNOR2X2M U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U2 ( .A(B[6]), .Y(n3) );
  INVX2M U3 ( .A(B[0]), .Y(n9) );
  INVX2M U4 ( .A(B[2]), .Y(n7) );
  INVX2M U5 ( .A(B[3]), .Y(n6) );
  INVX2M U6 ( .A(B[4]), .Y(n5) );
  INVX2M U7 ( .A(B[5]), .Y(n4) );
  NAND2X2M U8 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U9 ( .A(B[1]), .Y(n8) );
  INVX2M U10 ( .A(A[0]), .Y(n1) );
  INVX2M U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_OPER_WIDTH8_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_OPER_WIDTH8_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n17), .A1(A[12]), .B0N(n18), .Y(n1) );
  XNOR2X2M U3 ( .A(A[7]), .B(n9), .Y(SUM[7]) );
  INVX2M U4 ( .A(B[7]), .Y(n9) );
  XNOR2X2M U5 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  NAND2X2M U6 ( .A(A[7]), .B(B[7]), .Y(n27) );
  BUFX2M U7 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U8 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U9 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U10 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U11 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U12 ( .A(A[5]), .Y(SUM[5]) );
  BUFX2M U13 ( .A(A[6]), .Y(SUM[6]) );
  XNOR2X1M U14 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U15 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U16 ( .A(n14), .B(n27), .Y(SUM[8]) );
  NAND2BX1M U17 ( .AN(n15), .B(n16), .Y(n14) );
  OAI21X1M U18 ( .A0(A[12]), .A1(n17), .B0(B[12]), .Y(n18) );
  XOR3XLM U19 ( .A(B[12]), .B(A[12]), .C(n17), .Y(SUM[12]) );
  OAI21BX1M U20 ( .A0(n19), .A1(n20), .B0N(n21), .Y(n17) );
  XNOR2X1M U21 ( .A(n20), .B(n22), .Y(SUM[11]) );
  NOR2X1M U22 ( .A(n21), .B(n19), .Y(n22) );
  NOR2X1M U23 ( .A(B[11]), .B(A[11]), .Y(n19) );
  AND2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n21) );
  OA21X1M U25 ( .A0(n23), .A1(n24), .B0(n25), .Y(n20) );
  CLKXOR2X2M U26 ( .A(n26), .B(n24), .Y(SUM[10]) );
  AOI2BB1X1M U27 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n24) );
  AND2X1M U28 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U30 ( .A0(n27), .A1(n15), .B0(n16), .Y(n10) );
  CLKNAND2X2M U31 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NOR2X1M U32 ( .A(B[8]), .B(A[8]), .Y(n15) );
  NAND2BX1M U33 ( .AN(n23), .B(n25), .Y(n26) );
  CLKNAND2X2M U34 ( .A(B[10]), .B(A[10]), .Y(n25) );
  NOR2X1M U35 ( .A(B[10]), .B(A[10]), .Y(n23) );
endmodule


module ALU_OPER_WIDTH8_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38;

  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n8), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n7), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n6), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n5), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n4), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n3), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  AND2X2M U2 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n21) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U12 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  CLKXOR2X2M U13 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  CLKXOR2X2M U14 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  CLKXOR2X2M U15 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U16 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  CLKXOR2X2M U17 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  CLKXOR2X2M U18 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(\A1[6] ) );
  INVX2M U19 ( .A(\ab[0][7] ), .Y(n22) );
  INVX2M U20 ( .A(\ab[0][5] ), .Y(n20) );
  INVX2M U21 ( .A(\ab[0][4] ), .Y(n19) );
  INVX2M U22 ( .A(\ab[0][3] ), .Y(n18) );
  INVX2M U23 ( .A(\ab[0][2] ), .Y(n17) );
  AND2X2M U24 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n11) );
  AND2X2M U25 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n12) );
  AND2X2M U26 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n13) );
  AND2X2M U27 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n14) );
  AND2X2M U28 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n15) );
  AND2X2M U29 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n16) );
  XNOR2X2M U30 ( .A(\ab[1][6] ), .B(n22), .Y(\SUMB[1][6] ) );
  XNOR2X2M U31 ( .A(\ab[1][5] ), .B(n21), .Y(\SUMB[1][5] ) );
  XNOR2X2M U32 ( .A(\ab[1][4] ), .B(n20), .Y(\SUMB[1][4] ) );
  XNOR2X2M U33 ( .A(\ab[1][3] ), .B(n19), .Y(\SUMB[1][3] ) );
  XNOR2X2M U34 ( .A(\ab[1][2] ), .B(n18), .Y(\SUMB[1][2] ) );
  XNOR2X2M U35 ( .A(\ab[1][1] ), .B(n17), .Y(\SUMB[1][1] ) );
  INVX2M U36 ( .A(A[7]), .Y(n31) );
  INVX2M U37 ( .A(A[6]), .Y(n32) );
  INVX2M U38 ( .A(A[1]), .Y(n37) );
  INVX2M U39 ( .A(A[0]), .Y(n38) );
  INVX2M U40 ( .A(A[3]), .Y(n35) );
  INVX2M U41 ( .A(A[2]), .Y(n36) );
  INVX2M U42 ( .A(A[5]), .Y(n33) );
  INVX2M U43 ( .A(A[4]), .Y(n34) );
  INVX2M U44 ( .A(B[6]), .Y(n24) );
  INVX2M U45 ( .A(B[0]), .Y(n30) );
  INVX2M U46 ( .A(B[2]), .Y(n28) );
  INVX2M U47 ( .A(B[3]), .Y(n27) );
  INVX2M U48 ( .A(B[7]), .Y(n23) );
  INVX2M U49 ( .A(B[4]), .Y(n26) );
  INVX2M U50 ( .A(B[5]), .Y(n25) );
  INVX2M U51 ( .A(B[1]), .Y(n29) );
  NOR2X1M U53 ( .A(n31), .B(n23), .Y(\ab[7][7] ) );
  NOR2X1M U54 ( .A(n31), .B(n24), .Y(\ab[7][6] ) );
  NOR2X1M U55 ( .A(n31), .B(n25), .Y(\ab[7][5] ) );
  NOR2X1M U56 ( .A(n31), .B(n26), .Y(\ab[7][4] ) );
  NOR2X1M U57 ( .A(n31), .B(n27), .Y(\ab[7][3] ) );
  NOR2X1M U58 ( .A(n31), .B(n28), .Y(\ab[7][2] ) );
  NOR2X1M U59 ( .A(n31), .B(n29), .Y(\ab[7][1] ) );
  NOR2X1M U60 ( .A(n31), .B(n30), .Y(\ab[7][0] ) );
  NOR2X1M U61 ( .A(n23), .B(n32), .Y(\ab[6][7] ) );
  NOR2X1M U62 ( .A(n24), .B(n32), .Y(\ab[6][6] ) );
  NOR2X1M U63 ( .A(n25), .B(n32), .Y(\ab[6][5] ) );
  NOR2X1M U64 ( .A(n26), .B(n32), .Y(\ab[6][4] ) );
  NOR2X1M U65 ( .A(n27), .B(n32), .Y(\ab[6][3] ) );
  NOR2X1M U66 ( .A(n28), .B(n32), .Y(\ab[6][2] ) );
  NOR2X1M U67 ( .A(n29), .B(n32), .Y(\ab[6][1] ) );
  NOR2X1M U68 ( .A(n30), .B(n32), .Y(\ab[6][0] ) );
  NOR2X1M U69 ( .A(n23), .B(n33), .Y(\ab[5][7] ) );
  NOR2X1M U70 ( .A(n24), .B(n33), .Y(\ab[5][6] ) );
  NOR2X1M U71 ( .A(n25), .B(n33), .Y(\ab[5][5] ) );
  NOR2X1M U72 ( .A(n26), .B(n33), .Y(\ab[5][4] ) );
  NOR2X1M U73 ( .A(n27), .B(n33), .Y(\ab[5][3] ) );
  NOR2X1M U74 ( .A(n28), .B(n33), .Y(\ab[5][2] ) );
  NOR2X1M U75 ( .A(n29), .B(n33), .Y(\ab[5][1] ) );
  NOR2X1M U76 ( .A(n30), .B(n33), .Y(\ab[5][0] ) );
  NOR2X1M U77 ( .A(n23), .B(n34), .Y(\ab[4][7] ) );
  NOR2X1M U78 ( .A(n24), .B(n34), .Y(\ab[4][6] ) );
  NOR2X1M U79 ( .A(n25), .B(n34), .Y(\ab[4][5] ) );
  NOR2X1M U80 ( .A(n26), .B(n34), .Y(\ab[4][4] ) );
  NOR2X1M U81 ( .A(n27), .B(n34), .Y(\ab[4][3] ) );
  NOR2X1M U82 ( .A(n28), .B(n34), .Y(\ab[4][2] ) );
  NOR2X1M U83 ( .A(n29), .B(n34), .Y(\ab[4][1] ) );
  NOR2X1M U84 ( .A(n30), .B(n34), .Y(\ab[4][0] ) );
  NOR2X1M U85 ( .A(n23), .B(n35), .Y(\ab[3][7] ) );
  NOR2X1M U86 ( .A(n24), .B(n35), .Y(\ab[3][6] ) );
  NOR2X1M U87 ( .A(n25), .B(n35), .Y(\ab[3][5] ) );
  NOR2X1M U88 ( .A(n26), .B(n35), .Y(\ab[3][4] ) );
  NOR2X1M U89 ( .A(n27), .B(n35), .Y(\ab[3][3] ) );
  NOR2X1M U90 ( .A(n28), .B(n35), .Y(\ab[3][2] ) );
  NOR2X1M U91 ( .A(n29), .B(n35), .Y(\ab[3][1] ) );
  NOR2X1M U92 ( .A(n30), .B(n35), .Y(\ab[3][0] ) );
  NOR2X1M U93 ( .A(n23), .B(n36), .Y(\ab[2][7] ) );
  NOR2X1M U94 ( .A(n24), .B(n36), .Y(\ab[2][6] ) );
  NOR2X1M U95 ( .A(n25), .B(n36), .Y(\ab[2][5] ) );
  NOR2X1M U96 ( .A(n26), .B(n36), .Y(\ab[2][4] ) );
  NOR2X1M U97 ( .A(n27), .B(n36), .Y(\ab[2][3] ) );
  NOR2X1M U98 ( .A(n28), .B(n36), .Y(\ab[2][2] ) );
  NOR2X1M U99 ( .A(n29), .B(n36), .Y(\ab[2][1] ) );
  NOR2X1M U100 ( .A(n30), .B(n36), .Y(\ab[2][0] ) );
  NOR2X1M U101 ( .A(n23), .B(n37), .Y(\ab[1][7] ) );
  NOR2X1M U102 ( .A(n24), .B(n37), .Y(\ab[1][6] ) );
  NOR2X1M U103 ( .A(n25), .B(n37), .Y(\ab[1][5] ) );
  NOR2X1M U104 ( .A(n26), .B(n37), .Y(\ab[1][4] ) );
  NOR2X1M U105 ( .A(n27), .B(n37), .Y(\ab[1][3] ) );
  NOR2X1M U106 ( .A(n28), .B(n37), .Y(\ab[1][2] ) );
  NOR2X1M U107 ( .A(n29), .B(n37), .Y(\ab[1][1] ) );
  NOR2X1M U108 ( .A(n30), .B(n37), .Y(\ab[1][0] ) );
  NOR2X1M U109 ( .A(n23), .B(n38), .Y(\ab[0][7] ) );
  NOR2X1M U110 ( .A(n24), .B(n38), .Y(\ab[0][6] ) );
  NOR2X1M U111 ( .A(n25), .B(n38), .Y(\ab[0][5] ) );
  NOR2X1M U112 ( .A(n26), .B(n38), .Y(\ab[0][4] ) );
  NOR2X1M U113 ( .A(n27), .B(n38), .Y(\ab[0][3] ) );
  NOR2X1M U114 ( .A(n28), .B(n38), .Y(\ab[0][2] ) );
  NOR2X1M U115 ( .A(n29), .B(n38), .Y(\ab[0][1] ) );
  NOR2X1M U116 ( .A(n30), .B(n38), .Y(PRODUCT[0]) );
  ALU_OPER_WIDTH8_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , 
        \A1[9] , \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , 
        \A1[2] , \A1[1] , \A1[0] }), .B({n10, n14, n16, n13, n15, n12, n11, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(
        PRODUCT[15:2]) );
endmodule


module ALU_OPER_WIDTH8 ( A, B, ALU_FUN, ALU_CLK, RST, EN, ALU_OUT, OUT_VALID
 );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input ALU_CLK, RST, EN;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N157, N158, N159, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140;
  wire   [15:0] ALU_OUT_Comb;

  DFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .CK(ALU_CLK), .RN(RST), .Q(
        ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .CK(ALU_CLK), .RN(RST), .Q(
        ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .CK(ALU_CLK), .RN(RST), .Q(
        ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .CK(ALU_CLK), .RN(RST), .Q(
        ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .CK(ALU_CLK), .RN(RST), .Q(
        ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .CK(ALU_CLK), .RN(RST), .Q(
        ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .CK(ALU_CLK), .RN(RST), .Q(
        ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .CK(ALU_CLK), .RN(RST), .Q(
        ALU_OUT[0]) );
  DFFRQX2M OUT_VALID_reg ( .D(EN), .CK(ALU_CLK), .RN(RST), .Q(OUT_VALID) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .CK(ALU_CLK), .RN(RST), 
        .Q(ALU_OUT[15]) );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .CK(ALU_CLK), .RN(RST), 
        .Q(ALU_OUT[14]) );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .CK(ALU_CLK), .RN(RST), 
        .Q(ALU_OUT[13]) );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .CK(ALU_CLK), .RN(RST), 
        .Q(ALU_OUT[12]) );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .CK(ALU_CLK), .RN(RST), 
        .Q(ALU_OUT[11]) );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .CK(ALU_CLK), .RN(RST), 
        .Q(ALU_OUT[10]) );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .CK(ALU_CLK), .RN(RST), .Q(
        ALU_OUT[9]) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .CK(ALU_CLK), .RN(RST), .Q(
        ALU_OUT[8]) );
  BUFX2M U3 ( .A(A[6]), .Y(n11) );
  NOR2BX2M U4 ( .AN(n35), .B(n124), .Y(n31) );
  OAI2BB1X2M U7 ( .A0N(N118), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[9]) );
  OAI2BB1X2M U8 ( .A0N(N119), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1X2M U9 ( .A0N(N120), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[11]) );
  OAI2BB1X2M U10 ( .A0N(N121), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U11 ( .A0N(N122), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U12 ( .A0N(N123), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U13 ( .A0N(N124), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[15]) );
  OAI2BB1X2M U14 ( .A0N(n140), .A1N(n105), .B0(n101), .Y(n47) );
  OAI2BB1X2M U15 ( .A0N(n100), .A1N(n99), .B0(n101), .Y(n48) );
  NOR2BX2M U16 ( .AN(n106), .B(n137), .Y(n37) );
  AND2X2M U17 ( .A(n99), .B(n105), .Y(n42) );
  AND2X2M U18 ( .A(n106), .B(n105), .Y(n50) );
  BUFX2M U19 ( .A(n41), .Y(n13) );
  NOR2X2M U20 ( .A(n107), .B(n137), .Y(n41) );
  INVX2M U21 ( .A(n100), .Y(n137) );
  INVX2M U22 ( .A(n91), .Y(n138) );
  INVX2M U23 ( .A(n107), .Y(n140) );
  NAND2X2M U24 ( .A(EN), .B(n123), .Y(n32) );
  INVX2M U25 ( .A(EN), .Y(n124) );
  NOR3BX2M U26 ( .AN(n105), .B(n139), .C(ALU_FUN[2]), .Y(n49) );
  NOR3X2M U27 ( .A(n137), .B(ALU_FUN[2]), .C(n139), .Y(n35) );
  NOR2X2M U28 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n106) );
  AND3X2M U29 ( .A(n106), .B(n136), .C(n3), .Y(n46) );
  NAND3X2M U30 ( .A(n140), .B(n136), .C(n3), .Y(n36) );
  NAND2X2M U31 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n107) );
  INVX2M U32 ( .A(ALU_FUN[0]), .Y(n136) );
  NOR2X2M U33 ( .A(n136), .B(n3), .Y(n105) );
  NOR2X2M U34 ( .A(n3), .B(ALU_FUN[0]), .Y(n100) );
  NAND3X2M U35 ( .A(n3), .B(ALU_FUN[0]), .C(n99), .Y(n91) );
  INVX2M U36 ( .A(ALU_FUN[1]), .Y(n139) );
  NAND3X2M U37 ( .A(n106), .B(ALU_FUN[0]), .C(n3), .Y(n101) );
  AND2X2M U38 ( .A(ALU_FUN[2]), .B(n139), .Y(n99) );
  AND4X2M U39 ( .A(N159), .B(n99), .C(n3), .D(n136), .Y(n90) );
  AOI31X2M U40 ( .A0(n75), .A1(n76), .A2(n77), .B0(n124), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U41 ( .A0(N102), .A1(n50), .B0(N93), .B1(n37), .Y(n75) );
  AOI221XLM U42 ( .A0(n8), .A1(n138), .B0(n13), .B1(n133), .C0(n78), .Y(n77)
         );
  AOI222X1M U43 ( .A0(N111), .A1(n35), .B0(n7), .B1(n42), .C0(N127), .C1(n49), 
        .Y(n76) );
  AOI31X2M U44 ( .A0(n69), .A1(n70), .A2(n71), .B0(n124), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U45 ( .A0(N103), .A1(n50), .B0(N94), .B1(n37), .Y(n69) );
  AOI221XLM U46 ( .A0(n9), .A1(n138), .B0(n13), .B1(n132), .C0(n72), .Y(n71)
         );
  AOI222X1M U47 ( .A0(N112), .A1(n35), .B0(n8), .B1(n42), .C0(N128), .C1(n49), 
        .Y(n70) );
  AOI31X2M U48 ( .A0(n63), .A1(n64), .A2(n65), .B0(n124), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U49 ( .A0(N104), .A1(n50), .B0(N95), .B1(n37), .Y(n63) );
  AOI221XLM U50 ( .A0(n138), .A1(n10), .B0(n13), .B1(n131), .C0(n66), .Y(n65)
         );
  AOI222X1M U51 ( .A0(N113), .A1(n35), .B0(n9), .B1(n42), .C0(N129), .C1(n49), 
        .Y(n64) );
  AOI31X2M U52 ( .A0(n57), .A1(n58), .A2(n59), .B0(n124), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U53 ( .A0(N105), .A1(n50), .B0(N96), .B1(n37), .Y(n57) );
  AOI221XLM U54 ( .A0(n138), .A1(n11), .B0(n13), .B1(n130), .C0(n60), .Y(n59)
         );
  AOI222X1M U55 ( .A0(N114), .A1(n35), .B0(n10), .B1(n42), .C0(N130), .C1(n49), 
        .Y(n58) );
  AOI31X2M U56 ( .A0(n51), .A1(n52), .A2(n53), .B0(n124), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U57 ( .A0(N106), .A1(n50), .B0(N97), .B1(n37), .Y(n51) );
  AOI221XLM U58 ( .A0(n138), .A1(n12), .B0(n13), .B1(n129), .C0(n54), .Y(n53)
         );
  AOI222X1M U59 ( .A0(N115), .A1(n35), .B0(n42), .B1(n11), .C0(N131), .C1(n49), 
        .Y(n52) );
  AOI31X2M U60 ( .A0(n38), .A1(n39), .A2(n40), .B0(n124), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U61 ( .A0(N132), .A1(n49), .B0(N116), .B1(n35), .Y(n39) );
  AOI22X1M U62 ( .A0(N107), .A1(n50), .B0(N98), .B1(n37), .Y(n38) );
  AOI221XLM U63 ( .A0(n13), .A1(n128), .B0(n42), .B1(n12), .C0(n43), .Y(n40)
         );
  AOI31X2M U64 ( .A0(n93), .A1(n94), .A2(n95), .B0(n124), .Y(ALU_OUT_Comb[0])
         );
  AOI22X1M U65 ( .A0(N100), .A1(n50), .B0(N91), .B1(n37), .Y(n93) );
  AOI211X2M U66 ( .A0(n13), .A1(n135), .B0(n96), .C0(n97), .Y(n95) );
  AOI222X1M U67 ( .A0(N109), .A1(n35), .B0(n5), .B1(n42), .C0(N125), .C1(n49), 
        .Y(n94) );
  AOI31X2M U68 ( .A0(n81), .A1(n82), .A2(n83), .B0(n124), .Y(ALU_OUT_Comb[1])
         );
  AOI211X2M U69 ( .A0(n7), .A1(n138), .B0(n84), .C0(n85), .Y(n83) );
  AOI222X1M U70 ( .A0(N126), .A1(n49), .B0(n13), .B1(n134), .C0(n6), .C1(n42), 
        .Y(n82) );
  AOI222X1M U71 ( .A0(N92), .A1(n37), .B0(N110), .B1(n35), .C0(N101), .C1(n50), 
        .Y(n81) );
  AOI21X2M U72 ( .A0(n33), .A1(n34), .B0(n124), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U73 ( .A0(N99), .A1(n37), .B0(n123), .Y(n33) );
  AOI2BB2XLM U74 ( .B0(N117), .B1(n35), .A0N(n128), .A1N(n36), .Y(n34) );
  INVX2M U75 ( .A(n4), .Y(n122) );
  OAI222X1M U76 ( .A0(n55), .A1(n122), .B0(n4), .B1(n56), .C0(n36), .C1(n130), 
        .Y(n54) );
  AOI221XLM U77 ( .A0(n11), .A1(n46), .B0(n47), .B1(n129), .C0(n13), .Y(n56)
         );
  AOI221XLM U78 ( .A0(n46), .A1(n129), .B0(n11), .B1(n48), .C0(n42), .Y(n55)
         );
  INVX2M U79 ( .A(n92), .Y(n123) );
  AOI211X2M U80 ( .A0(N108), .A1(n50), .B0(n13), .C0(n47), .Y(n92) );
  BUFX2M U81 ( .A(ALU_FUN[3]), .Y(n3) );
  INVX2M U82 ( .A(n6), .Y(n134) );
  INVX2M U83 ( .A(n5), .Y(n135) );
  INVX2M U84 ( .A(n11), .Y(n129) );
  INVX2M U85 ( .A(n12), .Y(n128) );
  INVX2M U86 ( .A(n8), .Y(n132) );
  INVX2M U87 ( .A(n7), .Y(n133) );
  INVX2M U88 ( .A(n10), .Y(n130) );
  INVX2M U89 ( .A(n9), .Y(n131) );
  OAI222X1M U90 ( .A0(n79), .A1(n119), .B0(B[2]), .B1(n80), .C0(n36), .C1(n134), .Y(n78) );
  AOI221XLM U91 ( .A0(n7), .A1(n46), .B0(n47), .B1(n133), .C0(n13), .Y(n80) );
  AOI221XLM U92 ( .A0(n46), .A1(n133), .B0(n7), .B1(n48), .C0(n42), .Y(n79) );
  OAI222X1M U93 ( .A0(n73), .A1(n121), .B0(B[3]), .B1(n74), .C0(n36), .C1(n133), .Y(n72) );
  AOI221XLM U94 ( .A0(n8), .A1(n46), .B0(n47), .B1(n132), .C0(n13), .Y(n74) );
  AOI221XLM U95 ( .A0(n46), .A1(n132), .B0(n8), .B1(n48), .C0(n42), .Y(n73) );
  OAI222X1M U96 ( .A0(n67), .A1(n127), .B0(B[4]), .B1(n68), .C0(n36), .C1(n132), .Y(n66) );
  INVX2M U97 ( .A(B[4]), .Y(n127) );
  AOI221XLM U98 ( .A0(n9), .A1(n46), .B0(n47), .B1(n131), .C0(n13), .Y(n68) );
  AOI221XLM U99 ( .A0(n46), .A1(n131), .B0(n9), .B1(n48), .C0(n42), .Y(n67) );
  OAI222X1M U100 ( .A0(n61), .A1(n126), .B0(B[5]), .B1(n62), .C0(n36), .C1(
        n131), .Y(n60) );
  INVX2M U101 ( .A(B[5]), .Y(n126) );
  AOI221XLM U102 ( .A0(n10), .A1(n46), .B0(n47), .B1(n130), .C0(n13), .Y(n62)
         );
  AOI221XLM U103 ( .A0(n46), .A1(n130), .B0(n10), .B1(n48), .C0(n42), .Y(n61)
         );
  OAI222X1M U104 ( .A0(n44), .A1(n125), .B0(B[7]), .B1(n45), .C0(n36), .C1(
        n129), .Y(n43) );
  INVX2M U105 ( .A(B[7]), .Y(n125) );
  AOI221XLM U106 ( .A0(n46), .A1(n12), .B0(n47), .B1(n128), .C0(n13), .Y(n45)
         );
  AOI221XLM U107 ( .A0(n46), .A1(n128), .B0(n12), .B1(n48), .C0(n42), .Y(n44)
         );
  INVX2M U108 ( .A(n14), .Y(n118) );
  OAI2B2X1M U109 ( .A1N(B[0]), .A0(n98), .B0(n91), .B1(n134), .Y(n97) );
  AOI221XLM U110 ( .A0(n46), .A1(n135), .B0(n5), .B1(n48), .C0(n42), .Y(n98)
         );
  OAI2B2X1M U111 ( .A1N(B[1]), .A0(n86), .B0(n36), .B1(n135), .Y(n85) );
  AOI221XLM U112 ( .A0(n46), .A1(n134), .B0(n6), .B1(n48), .C0(n42), .Y(n86)
         );
  INVX2M U113 ( .A(n25), .Y(n120) );
  OAI21X2M U114 ( .A0(B[0]), .A1(n102), .B0(n103), .Y(n96) );
  AOI31X2M U115 ( .A0(N157), .A1(n3), .A2(n104), .B0(n90), .Y(n103) );
  AOI221XLM U116 ( .A0(n5), .A1(n46), .B0(n47), .B1(n135), .C0(n13), .Y(n102)
         );
  NOR3X2M U117 ( .A(n139), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n104) );
  OAI21X2M U118 ( .A0(B[1]), .A1(n87), .B0(n88), .Y(n84) );
  AOI31X2M U119 ( .A0(N158), .A1(n3), .A2(n89), .B0(n90), .Y(n88) );
  AOI221XLM U120 ( .A0(n6), .A1(n46), .B0(n47), .B1(n134), .C0(n13), .Y(n87)
         );
  NOR3X2M U121 ( .A(n136), .B(ALU_FUN[2]), .C(n139), .Y(n89) );
  BUFX2M U122 ( .A(A[7]), .Y(n12) );
  BUFX2M U123 ( .A(A[1]), .Y(n6) );
  BUFX2M U124 ( .A(A[0]), .Y(n5) );
  BUFX2M U125 ( .A(A[3]), .Y(n8) );
  BUFX2M U126 ( .A(A[2]), .Y(n7) );
  BUFX2M U127 ( .A(A[5]), .Y(n10) );
  BUFX2M U128 ( .A(A[4]), .Y(n9) );
  BUFX2M U129 ( .A(B[6]), .Y(n4) );
  INVX2M U130 ( .A(B[0]), .Y(n117) );
  INVX2M U131 ( .A(B[2]), .Y(n119) );
  INVX2M U132 ( .A(B[3]), .Y(n121) );
  NOR2X1M U133 ( .A(n128), .B(B[7]), .Y(n113) );
  NAND2BX1M U134 ( .AN(B[4]), .B(n9), .Y(n29) );
  NAND2BX1M U135 ( .AN(n9), .B(B[4]), .Y(n18) );
  CLKNAND2X2M U136 ( .A(n29), .B(n18), .Y(n108) );
  NOR2X1M U137 ( .A(n121), .B(n8), .Y(n26) );
  NOR2X1M U138 ( .A(n119), .B(n7), .Y(n17) );
  NOR2X1M U139 ( .A(n117), .B(n5), .Y(n14) );
  CLKNAND2X2M U140 ( .A(n7), .B(n119), .Y(n28) );
  NAND2BX1M U141 ( .AN(n17), .B(n28), .Y(n23) );
  AOI21X1M U142 ( .A0(n14), .A1(n134), .B0(B[1]), .Y(n15) );
  AOI211X1M U143 ( .A0(n6), .A1(n118), .B0(n23), .C0(n15), .Y(n16) );
  CLKNAND2X2M U144 ( .A(n8), .B(n121), .Y(n27) );
  OAI31X1M U145 ( .A0(n26), .A1(n17), .A2(n16), .B0(n27), .Y(n19) );
  NAND2BX1M U146 ( .AN(n10), .B(B[5]), .Y(n111) );
  OAI211X1M U147 ( .A0(n108), .A1(n19), .B0(n18), .C0(n111), .Y(n20) );
  NAND2BX1M U148 ( .AN(B[5]), .B(n10), .Y(n30) );
  XNOR2X1M U149 ( .A(n11), .B(n4), .Y(n110) );
  AOI32X1M U150 ( .A0(n20), .A1(n30), .A2(n110), .B0(n4), .B1(n129), .Y(n21)
         );
  CLKNAND2X2M U151 ( .A(B[7]), .B(n128), .Y(n114) );
  OAI21X1M U152 ( .A0(n113), .A1(n21), .B0(n114), .Y(N159) );
  CLKNAND2X2M U153 ( .A(n5), .B(n117), .Y(n24) );
  OA21X1M U154 ( .A0(n24), .A1(n134), .B0(B[1]), .Y(n22) );
  AOI211X1M U155 ( .A0(n24), .A1(n134), .B0(n23), .C0(n22), .Y(n25) );
  AOI31X1M U156 ( .A0(n120), .A1(n28), .A2(n27), .B0(n26), .Y(n109) );
  OAI2B11X1M U157 ( .A1N(n109), .A0(n108), .B0(n30), .C0(n29), .Y(n112) );
  AOI32X1M U158 ( .A0(n112), .A1(n111), .A2(n110), .B0(n11), .B1(n122), .Y(
        n115) );
  AOI2B1X1M U159 ( .A1N(n115), .A0(n114), .B0(n113), .Y(n116) );
  CLKINVX1M U160 ( .A(n116), .Y(N158) );
  NOR2X1M U161 ( .A(N159), .B(N158), .Y(N157) );
  ALU_OPER_WIDTH8_DW_div_uns_0 div_47 ( .a({n12, n11, n10, n9, n8, n7, n6, n5}), .b({B[7], n4, B[5:0]}), .quotient({N132, N131, N130, N129, N128, N127, N126, 
        N125}) );
  ALU_OPER_WIDTH8_DW01_sub_0 sub_41 ( .A({1'b0, n12, n11, n10, n9, n8, n7, n6, 
        n5}), .B({1'b0, B[7], n4, B[5:0]}), .CI(1'b0), .DIFF({N108, N107, N106, 
        N105, N104, N103, N102, N101, N100}) );
  ALU_OPER_WIDTH8_DW01_add_0 add_38 ( .A({1'b0, n12, n11, n10, n9, n8, n7, n6, 
        n5}), .B({1'b0, B[7], n4, B[5:0]}), .CI(1'b0), .SUM({N99, N98, N97, 
        N96, N95, N94, N93, N92, N91}) );
  ALU_OPER_WIDTH8_DW02_mult_0 mult_44 ( .A({n12, n11, n10, n9, n8, n7, n6, n5}), .B({B[7], n4, B[5:0]}), .TC(1'b0), .PRODUCT({N124, N123, N122, N121, N120, 
        N119, N118, N117, N116, N115, N114, N113, N112, N111, N110, N109}) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module SYS_TOP ( RST_N, UART_CLK, REF_CLK, UART_RX_IN, scan_clk, scan_rst, 
        test_mode, SE, SI, SO, UART_TX_O, parity_error, framing_error );
  input [3:0] SI;
  output [3:0] SO;
  input RST_N, UART_CLK, REF_CLK, UART_RX_IN, scan_clk, scan_rst, test_mode,
         SE;
  output UART_TX_O, parity_error, framing_error;
  wire   REF_SCAN_CLK, UART_SCAN_CLK, RX_CLK, RX_SCAN_CLK, TX_CLK, TX_SCAN_CLK,
         RSTN_SCAN_RST, SYNC_SCAN_RST2, RX_VLD, RX_VLD_SYNC, WR_INC, RD_INC,
         FIFO_FULL, F_EMPTY, BUSY, ALU_OUT_VLD, RD_D_VLD, ALU_EN, GATE_EN,
         WrEn, RdEn, CLK_ALU, _1_net_, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n13, n14;
  wire   [7:0] RX_OUT_P;
  wire   [7:0] RX_OUT_SYNC;
  wire   [7:0] WR_DATA;
  wire   [7:0] RD_DATA;
  wire   [7:0] div_ratio;
  wire   [7:0] UART_CONFIG;
  wire   [7:0] Pre_div;
  wire   [15:0] ALU_OUT;
  wire   [7:0] Rd_D;
  wire   [3:0] ALU_FUN;
  wire   [3:0] Address;
  wire   [7:0] Wr_D;
  wire   [7:0] Op_A;
  wire   [7:0] Op_B;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;
  assign SO[3] = n7;

  AND2X2M U3 ( .A(n14), .B(n8), .Y(SYNC_SCAN_RST2) );
  NAND2X2M U4 ( .A(n9), .B(n10), .Y(n2) );
  BUFX2M U5 ( .A(Address[1]), .Y(n5) );
  INVX2M U6 ( .A(F_EMPTY), .Y(n1) );
  BUFX2M U7 ( .A(Address[0]), .Y(n4) );
  OR2X2M U8 ( .A(GATE_EN), .B(n3), .Y(_1_net_) );
  INVX4M U9 ( .A(n2), .Y(n6) );
  BUFX2M U10 ( .A(test_mode), .Y(n3) );
  INVXLM U16 ( .A(n7), .Y(n13) );
  INVXLM U17 ( .A(n13), .Y(n14) );
  mux2X1_1 U0_mux2X1 ( .IN_0(REF_CLK), .IN_1(scan_clk), .SEL(n3), .OUT(
        REF_SCAN_CLK) );
  mux2X1_4 U1_mux2X1 ( .IN_0(UART_CLK), .IN_1(scan_clk), .SEL(n3), .OUT(
        UART_SCAN_CLK) );
  mux2X1_3 U2_mux2X1 ( .IN_0(RX_CLK), .IN_1(scan_clk), .SEL(n3), .OUT(
        RX_SCAN_CLK) );
  mux2X1_2 U3_mux2X1 ( .IN_0(TX_CLK), .IN_1(scan_clk), .SEL(n3), .OUT(
        TX_SCAN_CLK) );
  mux2X1_0 U4_mux2X1 ( .IN_0(RST_N), .IN_1(scan_rst), .SEL(n3), .OUT(
        RSTN_SCAN_RST) );
  mux2X1_6 U5_mux2X1 ( .IN_0(1'b0), .IN_1(scan_rst), .SEL(n3), .OUT(n10) );
  mux2X1_5 U6_mux2X1 ( .IN_0(1'b0), .IN_1(scan_rst), .SEL(n3), .OUT(n8) );
  RST_SYNC_test_1 RST_SYNC1_INST ( .CLK(REF_SCAN_CLK), .RST(RSTN_SCAN_RST), 
        .SYNC_RST(n9), .test_si(SI[3]), .test_se(SE) );
  RST_SYNC_test_0 RST_SYNC2_INST ( .CLK(UART_SCAN_CLK), .RST(RSTN_SCAN_RST), 
        .SYNC_RST(n7), .test_si(n9), .test_se(SE) );
  DataSynchronizer_BUS_WIDTH8 DATA_SYNC_INST ( .Unsync_bus(RX_OUT_P), 
        .bus_enable(RX_VLD), .CLK(REF_SCAN_CLK), .RST(n6), .sync_bus(
        RX_OUT_SYNC), .enable_pulse(RX_VLD_SYNC) );
  FIFO_TOP_DATA_WIDTH8 FIFO_INST ( .wclk(REF_SCAN_CLK), .rclk(TX_SCAN_CLK), 
        .wrst_n(n6), .rrst_n(SYNC_SCAN_RST2), .winc(WR_INC), .rinc(RD_INC), 
        .wdata(WR_DATA), .rdata(RD_DATA), .wfull(FIFO_FULL), .empty(F_EMPTY)
         );
  PULSE_GEN PLSE_GEN_INST ( .clk(TX_SCAN_CLK), .rst(SYNC_SCAN_RST2), .lvl_sig(
        BUSY), .pulse_sig(RD_INC) );
  ClkDiv_0 CLK_DIV_TX_INST ( .i_ref_clk(UART_SCAN_CLK), .i_rst_n(
        SYNC_SCAN_RST2), .i_clk_en(1'b1), .i_div_ratio(div_ratio), .o_div_clk(
        TX_CLK) );
  CLKDIV_MUX PRE_MUX_INST ( .IN(UART_CONFIG[7:2]), .OUT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, Pre_div[3:0]}) );
  ClkDiv_1 CLK_DIV_RX_INST ( .i_ref_clk(UART_SCAN_CLK), .i_rst_n(
        SYNC_SCAN_RST2), .i_clk_en(1'b1), .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, 
        Pre_div[3:0]}), .o_div_clk(RX_CLK) );
  UART_DATA_WIDTH8 UART_INST ( .RST(SYNC_SCAN_RST2), .TX_CLK(TX_SCAN_CLK), 
        .RX_CLK(RX_SCAN_CLK), .RX_IN_S(UART_RX_IN), .RX_OUT_P(RX_OUT_P), 
        .RX_OUT_V(RX_VLD), .TX_IN_P(RD_DATA), .TX_IN_V(n1), .TX_OUT_S(
        UART_TX_O), .TX_OUT_V(BUSY), .Prescale(UART_CONFIG[7:2]), 
        .parity_enable(UART_CONFIG[0]), .parity_type(UART_CONFIG[1]), 
        .parity_error(parity_error), .framing_error(framing_error) );
  SYS_CTRL SYS_CTRL_INST ( .clk(REF_SCAN_CLK), .rst_n(n6), .RX_P_Data(
        RX_OUT_SYNC), .RX_D_VLD(RX_VLD_SYNC), .RdData(Rd_D), .RdData_Valid(
        RD_D_VLD), .ALU_OUT(ALU_OUT), .OUT_Valid(ALU_OUT_VLD), .FIFO_FULL(
        FIFO_FULL), .Address(Address), .WrEn(WrEn), .RdEn(RdEn), .WrData(Wr_D), 
        .ALU_EN(ALU_EN), .ALU_FUN(ALU_FUN), .CLK_EN(GATE_EN), .WR_DATA(WR_DATA), .WR_INC(WR_INC) );
  RegFile_WIDTH8_DEPTH16 REG_FILE_INST ( .CLK(REF_SCAN_CLK), .RST(n6), .WrEn(
        WrEn), .RdEn(RdEn), .Address({Address[3:2], n5, n4}), .WrData(Wr_D), 
        .RdData(Rd_D), .RdData_VLD(RD_D_VLD), .REG0(Op_A), .REG1(Op_B), .REG2(
        UART_CONFIG), .REG3(div_ratio) );
  ALU_OPER_WIDTH8 ALU_INST ( .A(Op_A), .B(Op_B), .ALU_FUN(ALU_FUN), .ALU_CLK(
        CLK_ALU), .RST(n6), .EN(ALU_EN), .ALU_OUT(ALU_OUT), .OUT_VALID(
        ALU_OUT_VLD) );
  CLK_GATE CLK_GATE_INST ( .CLK_EN(_1_net_), .CLK(REF_SCAN_CLK), .GATED_CLK(
        CLK_ALU) );
endmodule

