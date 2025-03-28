`timescale 1ns/1ps
`include "freq_div.v"

module freq_div_tb();

reg clk,rst;
wire clk_out;
//parameter div = 10; 

freq_div dut(.clk(clk),.rst(rst),.clk_out(clk_out));

always begin
    #0.5 clk =~clk;
end

initial begin

    $dumpfile("freq.vcd");
    $dumpvars(1);

    $monitor("Time=%0t\trst =%b\tclk=%b\t clk_out=%b", $time, rst, clk, clk_out);
    rst = 0;clk =0;
    #10;
    rst =1;
    #100;
    $finish;
end




endmodule