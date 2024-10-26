module SYS_TB;

  reg RST_N;
  reg UART_CLK;
  reg REF_CLK;
  reg UART_RX_IN;
  wire UART_TX_O;
  wire parity_error;
  wire framing_error;
  

  localparam REF_CLK_PERIOD = 20;    
  localparam UART_CLK_PERIOD = 271;  

  SYS_TOP DUT (
    .RST_N(RST_N),
    .UART_CLK(UART_CLK),
    .REF_CLK(REF_CLK),
    .UART_RX_IN(UART_RX_IN),
    .UART_TX_O(UART_TX_O),
    .parity_error(parity_error),
    .framing_error(framing_error)
  );

  always #(REF_CLK_PERIOD / 2) REF_CLK = ~REF_CLK;
  always #(UART_CLK_PERIOD / 2) UART_CLK = ~UART_CLK;

  initial begin
    RST_N = 0;
    UART_CLK = 0;
    REF_CLK = 0;
    UART_RX_IN = 1;  
    #100;
    RST_N = 1;

    send_uart_command(8'hAA);  
    send_uart_command(8'h4);  
    send_uart_command(8'hFB); 

    send_uart_command(8'hBB);  
    send_uart_command(8'h4); 

    send_uart_command(8'hAA);  
    send_uart_command(8'h5);  
    send_uart_command(8'hC5); 

    send_uart_command(8'hBB);  
    send_uart_command(8'h5); 

    send_uart_command(8'hCC);  
    send_uart_command(8'h8); 
    send_uart_command(8'h5);  
    send_uart_command(8'h0); 

    send_uart_command(8'hCC);  
    send_uart_command(8'h13); 
    send_uart_command(8'h3);  
    send_uart_command(8'h1); 

    send_uart_command(8'hCC);  
    send_uart_command(8'h5); 
    send_uart_command(8'h3);  
    send_uart_command(8'h2); 

    send_uart_command(8'hDD);  
    send_uart_command(8'h1); 

    send_uart_command(8'hCC);  
    send_uart_command(8'hA5); 
    send_uart_command(8'hB3);  
    send_uart_command(8'h2); 

    send_uart_command(8'hCC);  
    send_uart_command(8'h53); 
    send_uart_command(8'h61);  
    send_uart_command(8'h2); 



    #100000;
    $stop;
  end

  task send_uart_command(input [7:0] cmd);
    integer i;
    begin
      #(UART_CLK_PERIOD*32);
      UART_RX_IN = 0;
      for (i = 0; i < 8; i = i + 1) 
      begin
        #(UART_CLK_PERIOD*32);
        UART_RX_IN = cmd[i];
      end

      #(UART_CLK_PERIOD*32);
      UART_RX_IN = ^cmd;

      #(UART_CLK_PERIOD*32);
      UART_RX_IN = 1;

    end
  endtask

endmodule