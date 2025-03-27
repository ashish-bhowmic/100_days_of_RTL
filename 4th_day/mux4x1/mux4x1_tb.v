`timescale 1ns/1ps
`include "mux4x1.v"

module mux4x1_tb();


reg [3:0]i;
reg [1:0]sel;
wire y;

mux4x1 dut(i,sel,y);

initial begin
    $dumpfile ("mux4x1.vcd");
    $dumpvars(1);
    $monitor("i=%b\tsel=%b\ty=%b\t",i,sel,y);
    i=4'b0000;sel=2'b00;
    repeat (16)begin
            repeat (4) begin
                #5 sel = sel+1;
            end
            sel = 2'b00;
            #5 i = i+1;
        
    end
    $finish;
end

endmodule