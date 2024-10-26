module FIFO_MEM_CNTRL #(parameter DATA_WIDTH = 8, parameter FIFO_DEPTH = 8, parameter ADDR_WIDTH = 4)(
    input wire [DATA_WIDTH-1:0] wdata,
    input wire [ADDR_WIDTH-2:0] waddr, raddr,
    input wire wclk, rclk, wrst_n,
    input wire wclken,
    output wire [DATA_WIDTH-1:0] rdata
);

    reg [DATA_WIDTH-1:0] fifo_mem [0:FIFO_DEPTH-1];
    integer i;

    always @(posedge wclk or negedge wrst_n) 
     begin
        if (!wrst_n)
         begin
            for (i = 0; i < FIFO_DEPTH; i = i + 1)
                fifo_mem[i] <= 0;
         end
        else if (wclken)
         begin
            fifo_mem[waddr] <= wdata;
         end
     end

    assign rdata = fifo_mem[raddr];

endmodule

