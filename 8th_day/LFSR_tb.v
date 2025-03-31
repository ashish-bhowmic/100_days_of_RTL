`timescale 1ns/1ps
`include "LFSR.v"

module LFSR_tb;

  reg clk, rst;
  wire [3:0] Q;

  LFSR DUT (
    .clk(clk),
    .rst(rst),
    .Q(Q)
  );

always begin
    #5 clk=~clk;
end

initial begin
    $dumpfile("lfsr.vcd");
    $dumpvars(1);
    $monitor("Time=%0t, rst=%b, clk=%b, Q=%b", $time, rst, clk, Q);
    clk =0;
    rst =1;
    #20;
    rst =0;
    #200;
    $finish;

end

endmodule