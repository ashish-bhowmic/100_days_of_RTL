`timescale 1ns/1ps
`include "universal_counter.v"

module universal_counter_tb();
reg clk,rst,en,up_down_count,load;
reg [3:0] load_value;
wire [3:0]count_out;

universal_counter dut (
    count_out,clk,rst,en,
    up_down_count,load,load_value
);

always begin
    #5 clk =~clk;
end

initial begin
    $dumpfile ("counter.vcd");
    $dumpvars (1);
    $monitor ("clk=%b\trst=%b\ten=%b\tload=%b\tup_down=%b\tload_value=%b\tcounter_out=%b",
    clk,rst,en,load,up_down_count,load_value,count_out);
end

initial begin
    clk = 0; rst =1;#10;
    rst = 0;
end

initial begin
    en =1; load =1; load_value = 4'd6; #30;
    load =0; up_down_count =1; #40;
    up_down_count =0; #40;

    rst = 1; #10;
    rst =0;
    en =1; load =1; load_value = 4'd8; #30;
    load =0; up_down_count =1; #40;
    up_down_count =0; #40;
    #100;
    $finish;

end
endmodule