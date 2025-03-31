`timescale 1ns/1ps
`include "ring_reg.v"

module ring_reg_tb();

  reg clk, rst;
  wire [3:0] Q;

ring_reg DUT (
    .clk(clk),
    .rst(rst),
    .Q(Q)
  );

always begin
    #5 clk=~clk;
end

initial begin
    $dumpfile("ring_reg.vcd");
    $dumpvars(1);
    $monitor("Time=%0t, rst=%b, clk=%b, Q=%b", $time, rst, clk, Q);
    clk =0;
    rst =1;
    #20;
    rst =0;
    #100;
    $finish;

end
endmodule