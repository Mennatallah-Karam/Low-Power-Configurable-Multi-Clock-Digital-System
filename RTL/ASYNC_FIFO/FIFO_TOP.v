module FIFO_TOP #(parameter DATA_WIDTH = 8, parameter FIFO_DEPTH = 8, parameter ADDR_WIDTH = 4)(
    input wire wclk, rclk, wrst_n, rrst_n,
    input wire winc, rinc,
    input wire  [DATA_WIDTH-1:0] wdata,
    output wire [DATA_WIDTH-1:0] rdata,
    output wire wfull, empty
);

    wire [ADDR_WIDTH-2:0] waddr, raddr;
    wire [ADDR_WIDTH-1:0] wptr_gray, rptr_gray;
    wire [ADDR_WIDTH-1:0] sync_r2w, sync_w2r;
    wire wclken;


    FIFO_WR #(.FIFO_DEPTH(FIFO_DEPTH), .ADDR_WIDTH(ADDR_WIDTH)) fifo_wr (
        .wdata(wdata),
        .wclk(wclk),
        .wrst_n(wrst_n),
        .winc(winc),
        .rptr_gray(sync_r2w),
        .wptr_gray(wptr_gray),
        .waddr(waddr),
        .wclken(wclken),
        .wfull(wfull)
    );


    FIFO_RD #(.FIFO_DEPTH(FIFO_DEPTH), .ADDR_WIDTH(ADDR_WIDTH)) fifo_rd (
        .wptr_gray(sync_w2r),
        .rclk(rclk),
        .rrst_n(rrst_n),
        .rinc(rinc),
        .raddr(raddr),
        .rptr_gray(rptr_gray),
        .empty(empty)
    );


    DF_SYNC #(.SYNC_WIDTH(ADDR_WIDTH)) sync_rptr_gray_to_wptr_gray (
        .RST(wrst_n),
        .CLK(wclk),
        .async_signal(rptr_gray),
        .sync_signal(sync_r2w)
    );


    DF_SYNC #(.SYNC_WIDTH(ADDR_WIDTH)) sync_wptr_gray_to_rptr_gray (
        .RST(rrst_n),
        .CLK(rclk),
        .async_signal(wptr_gray),
        .sync_signal(sync_w2r)
    );


    FIFO_MEM_CNTRL #(.DATA_WIDTH(DATA_WIDTH), .FIFO_DEPTH(FIFO_DEPTH), .ADDR_WIDTH(ADDR_WIDTH)) fifo_mem (
        .wdata(wdata),
        .waddr(waddr),
        .raddr(raddr),
        .wclk(wclk),
        .rclk(rclk),
        .wrst_n(wrst_n),
        .wclken(wclken),
        .rdata(rdata)
    );

endmodule


