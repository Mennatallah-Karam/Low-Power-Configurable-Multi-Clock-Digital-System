module FIFO_RD #(parameter FIFO_DEPTH = 8, parameter ADDR_WIDTH = 4)(
    input wire   [ADDR_WIDTH-1:0] wptr_gray,
    input wire   rclk, rrst_n, rinc,
    output wire  [ADDR_WIDTH-2:0] raddr, 
    output wire  [ADDR_WIDTH-1:0] rptr_gray,
    output wire  empty
);

    reg [ADDR_WIDTH-1:0] rptr;

    assign rptr_gray = rptr ^ (rptr >> 1);
    assign empty = (rptr_gray == wptr_gray);
    assign raddr = rptr[ADDR_WIDTH-2:0] ;

    always @(posedge rclk or negedge rrst_n)
     begin
        if (!rrst_n)
         begin
            rptr <= 0;
         end 
        else if (rinc && !empty)
         begin
            rptr <= (rptr + 1);
         end
      end
endmodule




