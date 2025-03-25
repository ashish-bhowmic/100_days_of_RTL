`timescale 1ns/1ps
`include "decoder.v"

module decoder_tb ();

reg [2:0] in;
wire [7:0]out;

decoder dut (.in(in), .out(out));

initial begin
    $dumpfile("decoder.vcd");
    $dumpvars(1);
    $display ("Input      |   Output\n");
    
    $monitor("%b        |   %b",in,out);
    in = 0;
    #5;
    repeat (8) begin
        #5 in =in +1;
    end
end


endmodule