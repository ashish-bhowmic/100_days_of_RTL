`timescale 1ns/1ps
`include "full_adder.v"

module  full_adder_tb(
);

wire sum, carry;
reg a,b,cin;

full_adder_using_decoder dut(a,b,cin,sum,carry);
initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars(1);
    $monitor ("a=%b\tb=%b\tcin=%b\tsum=%b\tcarry=%b\t",a,b,cin,sum,carry);

        #10 a = 0; b = 0; cin = 0; #10;
        #10 a = 0; b = 0; cin = 1; #10;
        #10 a = 0; b = 1; cin = 0; #10;
        #10 a = 0; b = 1; cin = 1; #10;
        #10 a = 1; b = 0; cin = 0; #10;
        #10 a = 1; b = 0; cin = 1; #10;
        #10 a = 1; b = 1; cin = 0; #10;
        #10 a = 1; b = 1; cin = 1; #10;
        $finish;
end

    
endmodule