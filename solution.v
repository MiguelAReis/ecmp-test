`timescale 1ns / 1ps
`include "iob_lib.vh"

module circuit
  #(
    parameter W=32
    )
  (
   `INPUT(rst,1),
   `INPUT(clk,1),
   `INPUT(en,1),
   `INPUT(in,8),
   `OUTPUT(y,W)
   );

   `SIGNAL_SIGNED(inputNumber,8)
   `SIGNAL_SIGNED(result,W)
   `SIGNAL_SIGNED(result_N_1,W)

   `SIGNAL(cnt, 7) //7-bit counter as iterator

   `SIGNAL2OUT(y, result) //connect internal y to output

   //y shift register 
   `REG_ARE(clk, rst, 1'b0, cnt!=99, result_N_1, result)

   //iteration counter
   `COUNTER_ARE(clk, rst, cnt!=99, cnt)

   //compute next why
   `COMB inputNumber = in;
   `COMB result = result_N_1*2 +inputNumber;

   
   
endmodule
