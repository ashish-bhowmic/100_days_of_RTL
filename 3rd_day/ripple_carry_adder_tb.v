`timescale 1ns/1ps
`include "ripple_carry_adder.v"

module ripple_carry_adder_tb();

reg [3:0]a,b;
reg cin;
wire cout;
wire [3:0]  sum;

ripple_carry_adder dut (.a(a),.b(b),.cin(cin),.cout(cout),.sum(sum));


initial begin
    $dumpfile("ripple_carry_adder.vcd");
    $dumpvars (1);
    $monitor("a=%b\tb=%b\tcin=%b\tsum=%b\tcout=%b\t",a,b,cin,sum,cout);

    a =0;b=0;cin=0;
    #5;
    repeat (16) begin
        #5 a=a+1;
        repeat (16) begin
            #5 b=b+1;
            repeat (2) begin
                #5 cin =~cin;
            end
        end

    end
end



endmodule