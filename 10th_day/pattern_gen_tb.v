`timescale 1ns/1ps
`include "pattern_gen.v"

module pattern_gen_tb();

reg clk,rst;
wire  [7:0] out;

pattern_gen dut(.clk(clk),.rst(rst),.out(out));

always begin
    #5 clk=~clk;
end

initial begin
    $dumpfile("pattern.vcd");
    $dumpvars(0,pattern_gen_tb);
    $monitor("time=%0t\t out=%b\ta=%b\tc=%b\tcount=%b\tclk=%b\trst=%b",$time,out,dut.a, dut.c, dut.count,clk,rst);

    clk =0;rst=1;
    #10;
    rst =0;
    #100;
    $finish;    
end

endmodule