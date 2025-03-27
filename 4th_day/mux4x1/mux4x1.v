`include "/share_folder/verilog/new/100_days_of_RTL/4th_day/mux2x1.v"
//mux3x1 using 2x1 mux

module mux4x1 (
    input [3:0]i,
    input [1:0]sel,
    output y
    
);

wire [1:0]w;

mux2x1 m1 (.a(i[0]),.b(i[1]),.sel(sel[0]),.y(w[0]));
mux2x1 m2 (.a(i[2]),.b(i[3]),.sel(sel[0]),.y(w[1]));

mux2x1 m3 (.a(w[0]),.b(w[1]),.sel(sel[1]),.y(y));
    
endmodule