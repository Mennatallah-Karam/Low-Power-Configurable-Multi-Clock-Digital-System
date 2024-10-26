module CLK_GATE (
input      CLK_EN,
input      CLK,
output     GATED_CLK
);



reg     Latch_Out ;


always @(CLK or CLK_EN)
 begin
  if(!CLK)      
   begin
    Latch_Out <= CLK_EN ;
   end
 end
 

assign  GATED_CLK = CLK && Latch_Out ;

/*



TLATNCAX12M U0_TLATNCAX12M (
.E(CLK_EN),
.CK(CLK),
.ECK(GATED_CLK)
);

*/




endmodule
