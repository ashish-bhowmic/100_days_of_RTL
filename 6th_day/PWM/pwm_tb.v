`timescale 1ns/1ps
`include "pwm.v"

module pwm_tb();

reg clk,rst;
reg [7:0] duty_cycle;
wire pwm_out;

pwm dut (.clk(clk),.pwm_out(pwm_out),.duty_cycle(duty_cycle),.rst(rst));

always begin
    #5 clk = ~clk;
end
initial begin
    clk = 0;rst = 0;
    #10;
    rst = 1;
    duty_cycle = 8'd128;
    #200;
    $finish;
end


endmodule