module ClkDiv #( 
 parameter RATIO_WD = 8 
)
 (
    input wire i_ref_clk,
    input wire i_rst_n,
    input wire i_clk_en,
    input wire [RATIO_WD-1:0] i_div_ratio,
    output wire o_div_clk
);

    reg [RATIO_WD-1:0] counter;
    reg flag;
    wire clk_div_en;
    wire odd;
    wire [RATIO_WD-1:0] Half_P;
    reg reg_div_clk;


    assign clk_div_en = i_clk_en && (i_div_ratio != 1) && (|i_div_ratio); 
    assign odd = i_div_ratio[0];                       
    assign Half_P = i_div_ratio >> 1;  

    assign o_div_clk = (!clk_div_en && i_rst_n) ? i_ref_clk : reg_div_clk;               

    always @(posedge i_ref_clk or negedge i_rst_n) 
    begin
        if (!i_rst_n) 
        begin
            counter <= 0;
            reg_div_clk <= 0; 
            flag <= 0;
        end 
        else if (clk_div_en) 
        begin
            if (!odd)
            begin
                if (counter == (Half_P - 1))
                begin
                    counter <= 0;
                    reg_div_clk <= ~reg_div_clk;
                end 
                else
                    counter <= counter + 1;

            end 
            else
            begin
                if (flag == 0) 
                begin
                    if (counter == (Half_P - 1)) 
                    begin
                        counter <= 0;
                        reg_div_clk <= 0;
                        flag <= 1;  
                    end 
                    else 
                        counter <= counter + 1;

                end 
                else
                 begin
                    if (counter == (Half_P)) 
                    begin
                        counter <= 0;
                        reg_div_clk <= 1;
                        flag <= 0;  
                    end 
                   else
                        counter <= counter + 1;

                end
            end
        end 
    end
endmodule

