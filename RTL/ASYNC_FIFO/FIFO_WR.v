module FIFO_WR #(parameter FIFO_DEPTH = 8, parameter ADDR_WIDTH = 4)(
    input wire   [7:0] wdata,
    input wire   wclk, wrst_n, winc,
    input wire   [ADDR_WIDTH-1:0] rptr_gray,  
    output wire  [ADDR_WIDTH-1:0] wptr_gray, 
    output wire  [ADDR_WIDTH-2:0] waddr, 
    output wire  wclken, 
    output wire  wfull
);

    reg [ADDR_WIDTH-1:0] wptr;


    assign wptr_gray = wptr ^ (wptr >> 1);
    assign wfull = ((wptr_gray[ADDR_WIDTH-1] != rptr_gray[ADDR_WIDTH-1]) &&
                    (wptr_gray[ADDR_WIDTH-2] != rptr_gray[ADDR_WIDTH-2]) &&
                    (wptr_gray[ADDR_WIDTH-3:0] == rptr_gray[ADDR_WIDTH-3:0]));
    assign wclken = winc && !wfull;
    assign waddr = wptr[ADDR_WIDTH-2:0] ;

    always @(posedge wclk or negedge wrst_n) 
     begin
        if (!wrst_n)
         begin
            wptr <= 0;
         end 
        else if (winc && !wfull)
         begin
            wptr <= (wptr + 1);
         end
    end
endmodule



