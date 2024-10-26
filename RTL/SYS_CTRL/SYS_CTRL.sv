module SYS_CTRL (
    input wire clk,
    input wire rst_n,
    input wire [7:0] RX_P_Data,
    input wire RX_D_VLD,
    input wire [7:0] RdData,
    input wire RdData_Valid,
    input wire [15:0] ALU_OUT,
    input wire OUT_Valid,
    input wire FIFO_FULL,
    
    output reg [3:0] Address,
    output reg WrEn,
    output reg RdEn,
    output reg [7:0] WrData,
    output reg ALU_EN,
    output reg [3:0] ALU_FUN,
    output reg CLK_EN,
    output reg clk_div_en,
    output reg [7:0] WR_DATA,
    output reg WR_INC
);

localparam RF_WR_CMD   = 8'hAA,
          RF_RD_CMD   = 8'hBB,
          ALU_OP_CMD  = 8'hCC,
          ALU_NOP_CMD = 8'hDD;

typedef enum bit [3:0] {
    IDLE        = 4'b0000,
    WRITE_ADDR  = 4'b0010,
    WRITE_DATA  = 4'b0011,
    READ_ADDR   = 4'b0100,
    ALU_OP_A    = 4'b0101,
    ALU_OP_B    = 4'b0110,
    ALU_FUN_OP  = 4'b0111,
    READ_DATA   = 4'b1000,
    ALU_OUT_ST  = 4'b1001 
} state_e;

state_e state, next_state;

reg [7:0] operand_A, operand_B;
reg [3:0] Address_s;
reg ALU_OUT_BYTE; 

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        state <= IDLE;
    else
        state <= next_state;
end

always @(*) begin
    next_state = state;
    case (state)
        IDLE: begin
            if (RX_D_VLD) begin
                case (RX_P_Data)
                    RF_WR_CMD: next_state = WRITE_ADDR;
                    RF_RD_CMD: next_state = READ_ADDR;
                    ALU_OP_CMD: next_state = ALU_OP_A;
                    ALU_NOP_CMD: next_state = ALU_FUN_OP;
                    default: next_state = IDLE;
                endcase
            end
            else
                next_state = IDLE;
        end

        WRITE_ADDR: begin
            if (RX_D_VLD)
                next_state = WRITE_DATA;
        end

        WRITE_DATA: begin
            if (RX_D_VLD)
                next_state = IDLE;
        end

        READ_ADDR: begin
            if (RX_D_VLD)
                next_state = READ_DATA;
        end

        ALU_OP_A: begin
            if (RX_D_VLD)
                next_state = ALU_OP_B;
        end

        ALU_OP_B: begin
            if (RX_D_VLD)
                next_state = ALU_FUN_OP;
        end

        ALU_FUN_OP: begin
            if (RX_D_VLD)
                next_state = ALU_OUT_ST;
        end

        READ_DATA: begin
            if (!FIFO_FULL && RdData_Valid)
                next_state = IDLE;
            else
                next_state = READ_DATA;
        end

            ALU_OUT_ST: begin  
                if (!FIFO_FULL && OUT_Valid)
                 begin
                   if(ALU_OUT_BYTE == 1'b1)
                     next_state = IDLE; 
                 end 
                  else
                    next_state = ALU_OUT_ST; 
            end

        default: next_state = IDLE;
    endcase
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        Address_s <= 0;
        ALU_OUT_BYTE <= 0;
    end
    else if (state == WRITE_ADDR) begin
        Address_s <= Address;
    end
    else if (state == ALU_OUT_ST && WR_INC && ALU_OUT_BYTE == 1'b0) begin
        ALU_OUT_BYTE <= 1;
    end
    else if (WR_INC && ALU_OUT_BYTE == 1'b1) begin
        ALU_OUT_BYTE <= 0;
    end
end

always @(*) begin
    WrEn = 0;
    RdEn = 0;
    ALU_EN = 0;
    ALU_FUN = 0;
    CLK_EN = 0;
    clk_div_en = 1;
    Address = Address_s;
    WR_DATA = 8'b0;
    WR_INC = 0;
    WrData = 0;
    operand_A = 0;
    operand_B = 0;

    case (state)
        IDLE: begin
        end

        WRITE_ADDR: begin
            if (RX_D_VLD)
                Address = RX_P_Data[3:0];
        end

        WRITE_DATA: begin
            if (RX_D_VLD) begin
                WrData = RX_P_Data;
                WrEn = 1;
            end
        end

        READ_ADDR: begin
            if (RX_D_VLD) begin
                Address = RX_P_Data[3:0];
                RdEn = 1;
            end
        end

        ALU_OP_A: begin
            if (RX_D_VLD) begin
                operand_A = RX_P_Data;
                Address = 4'b0000;
                WrData = operand_A;
                WrEn = 1;
            end
        end

        ALU_OP_B: begin
            if (RX_D_VLD) begin
                operand_B = RX_P_Data;
                Address = 4'b0001;
                WrData = operand_B;
                WrEn = 1;
            end
        end

        ALU_FUN_OP: begin
            CLK_EN = 1;
            if (RX_D_VLD) begin
                ALU_FUN = RX_P_Data[3:0];
                ALU_EN = 1;
            end
        end

        READ_DATA: begin
            if (RdData_Valid) begin
                WR_DATA = RdData;
                WR_INC = 1;
            end
        end

        ALU_OUT_ST: begin
            CLK_EN = 1;
            if (OUT_Valid) begin
                WR_DATA = (ALU_OUT_BYTE) ? ALU_OUT[15:8] : ALU_OUT[7:0];
                WR_INC = 1;
                ALU_EN = 1;
            end
        end
    endcase
end
endmodule

