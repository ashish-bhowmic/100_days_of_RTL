`timescale 1ns/1ps
`include "sequence.v"

module sequence_tb();


    reg rst,clk,in;
    wire detected;
sequence dut (
    clk,rst,in,detected
);

always begin
    #5 clk=~clk;
end

initial begin
    clk=0;rst = 1;
    #10;
    rst =0;
    $monitor ("rst=%b\tin=%b\tclk=%b\tdetected=%b\t",rst,in,clk,detected);

    @(posedge clk) in =1;
    @(posedge clk) in =0;
    @(posedge clk) in =1;
    @(posedge clk) in =1;
    @(posedge clk) in =0;
    @(posedge clk) in =1;
    @(posedge clk) in =1;
    @(posedge clk) in =1;
    @(posedge clk) in =1;
    @(posedge clk) in =1;
    @(posedge clk) in =1;
    #20;
    $finish;
end

endmodule