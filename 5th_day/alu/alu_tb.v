`timescale 1ns/1ps
`include "alu.v"

module alu_tb();

reg [3:0]a,b;
reg [2:0] sel;
wire carry,borrow;
wire [3:0] result;

alu dut(.a(a),.b(b),.sel(sel),.carry(carry),.result(result),.borrow(borrow));

initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0,alu_tb);
    $monitor("a=%b\tb=%b\tsel=%b\tresult=%b\tcarry=%b\tborrow=%b",a,b,sel,result,carry,borrow);
    a=4'b1101;b=4'b0110;sel=3'b000; #5;
    a=4'b1001;b=4'b1110;sel=3'b001; #5;
    a=4'b1100;b=4'b1111;sel=3'b010; #5;
    a=4'b0011;b=4'b0011;sel=3'b011; #5;
    a=4'b1101;b=4'b1110;sel=3'b100; #5;
    a=4'b1111;b=4'b0000;sel=3'b101; #5;
    a=4'b1011;b=4'b1100;sel=3'b110; #5;
    a=4'b1111;b=4'b1111;sel=3'b111; #5;
end

endmodule