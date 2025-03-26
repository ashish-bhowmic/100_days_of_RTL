module full_adder (
     a,b,cin,sum,cout
);
output sum,cout;
input a,b,cin;

assign sum = a^b^cin;
assign cout = a&b | b&cin |cin&a;
    
endmodule

module ripple_carry_adder ( 
    input [3:0] a,b,
    input cin,
    output cout,
    output [3:0] sum
);

wire [2:0] w;

full_adder m1 (a[0],b[0],cin,sum[0],w[0]);
full_adder m2 (a[1],b[1],w[0],sum[1],w[1]);
full_adder m3 (a[2],b[2],w[1],sum[2],w[2]);
full_adder m4 (a[3],b[3],w[2],sum[3],cout);
    
endmodule