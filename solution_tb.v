`timescale 1ns / 1ps
`include "iob_lib.vh"

`define W 32

module circuit_tb;

   `CLOCK(clk, 10)
   `RESET(rst, 1, 10)
   `SIGNAL(en, 1)
   `SIGNAL_OUT(y, `W)

   `SIGNAL(in, 8)

   integer i;
   
   initial begin
      $dumpfile("circuit.vcd");
      $dumpvars();
      en=0;
      for (i=0; i<100; i=i+1) begin
        in =$random;
        @(posedge clk) #10 en=1; $display("Iteration %d: Input %d Output %d",i+1, $signed (in), $signed(y));
      end

      @(posedge clk) #100 $finish;

   end 

   circuit
     #(
       .W(`W)
       ) 
   c0
     (
      .rst(rst),
      .clk(clk),
      .en(en),
      .in(in),
      .y(y)
      );


endmodule
