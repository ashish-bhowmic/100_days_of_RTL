`timescale 1ns/1ps
`include "mux2x1.v"

module mux2x1_tb();

reg a,b,sel;
wire y;

mux2x1 dut(.y(y),.a(a),.b(b),.sel(sel));

initial begin
    $dumpfile ("mux2x1.vcd");
    $dumpvars(1);
    $monitor("a=%b\tb=%b\tsel=%b\ty=%b\t",a,b,sel,y);
    a=1;b=1;sel=0;
    repeat (2)begin
        #5 a=~a;
        repeat (2)begin
            #5 b=~b;
            repeat (2) begin
                #5 sel = ~sel;
            end
        end
    end
    
    $finish;
end




endmodule