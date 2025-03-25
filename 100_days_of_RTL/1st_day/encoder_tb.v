`timescale 1ns/1ps
`include "encoder.v"

module encoder_tb();


reg [7:0]in;
wire [2:0]out;

encoder dut(.in(in),.out(out));

initial begin
    $dumpfile("encoder.vcd");
    $dumpvars(1);
    $display("Input            |  Output");
    $monitor("  %b      ->    %b",in,out);
    in = 1;
    repeat (8) begin
        #5 in = in *2 ;
    end
    #5 in = 300;

    $finish;

end








endmodule