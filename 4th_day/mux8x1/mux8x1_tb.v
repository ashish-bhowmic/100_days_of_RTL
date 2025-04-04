`timescale 1ns/1ps
`include "mux8x1.v"

module mux8x1_tb();

reg [7:0]I;
reg [2:0]SEL;
wire Y;

mux8x1 dut(I,SEL,Y);
initial begin
    $dumpfile ("mux8x1.vcd");
    $dumpvars(1);
    $monitor("I=%b\tSEL=%b\tY=%b\t",I,SEL,Y);
    I= 8'd1; SEL=3'b000;
    #5;
    repeat (8)begin
            repeat (8) begin
                #5 SEL = SEL+1;
            end
            SEL =3'b000;
            #5 I = I*2;
        
    end
    $finish;
end


endmodule