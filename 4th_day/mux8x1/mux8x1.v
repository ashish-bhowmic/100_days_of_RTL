`include "/share_folder/verilog/new/100_days_of_RTL/4th_day/mux4x1/mux4x1.v"
// making 8x1 mux by using 2 4x1 and 1 2x1 muxes


module mux8x1 (
    I,SEL,Y
);

input [7:0]I;
input [2:0]SEL;
output Y;
wire [1:0]W;


mux4x1 M1 (.i(I[3:0]),.sel(SEL[1:0]),.y(W[0]));
mux4x1 M2 (.i(I[7:4]),.sel(SEL[1:0]),.y(W[1]));


mux2x1 M3 (.a(W[0]),.b(W[1]),.sel(SEL[2]),.y(Y) );


  
endmodule