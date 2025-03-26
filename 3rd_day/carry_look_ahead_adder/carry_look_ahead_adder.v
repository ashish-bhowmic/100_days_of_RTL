module full_adder (
    input a,b,cin,
    output sum,cout, p,g
);

assign sum = a^b^cin;
assign cout = (a&b) | (a&cin) | (b&cin);

assign p = a^b;
assign g = a&b;
    
endmodule

module carry_look_ahead_adder (
    input [3:0] a,b,
    input cin,
    output cout,
    output [3:0] sum
);
wire [3:0]p,g,c,co; // Added wire co to get the carry output of each full adder

full_adder m1 (a[0],b[0],cin,sum[0],co[0],p[0],g[0]);
full_adder m2 (a[1],b[1],c[1],sum[1],co[1],p[1],g[1]);
full_adder m3 (a[2],b[2],c[2],sum[2],co[2],p[2],g[2]);
full_adder m4 (a[3],b[3],c[3],sum[3],co[3],p[3],g[3]);

assign c[0] = cin;
assign c[1] = g[0] | (p[0] & c[0]);
assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);
assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c[0]);

endmodule