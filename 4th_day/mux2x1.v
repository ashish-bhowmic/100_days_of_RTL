module mux2x1 (
    y,a,b,sel
);

input a,b,sel;
output y;

assign y = sel?b:a;


    
endmodule