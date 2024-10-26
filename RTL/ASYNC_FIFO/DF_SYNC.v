module DF_SYNC #(parameter SYNC_WIDTH = 1)( 
    input wire RST,
    input wire CLK,
    input wire  [SYNC_WIDTH-1:0] async_signal,  
    output wire [SYNC_WIDTH-1:0] sync_signal
);

    reg [SYNC_WIDTH-1:0] sync_ff1, sync_ff2;  

    always @(posedge CLK or negedge RST)
    begin
        if (!RST) 
        begin
            sync_ff1 <= 0;  
            sync_ff2 <= 0;
        end 
        else 
        begin
            sync_ff1 <= async_signal;  
            sync_ff2 <= sync_ff1;     
        end
    end

    assign sync_signal = sync_ff2;  

endmodule




