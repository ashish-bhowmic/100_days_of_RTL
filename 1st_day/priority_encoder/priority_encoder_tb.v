`timescale 1ns/1ps
`include "/share_folder/verilog/100_days_of_RTL/1st_day/priority_encoder/priority_encoder.v"

module priority_encoder_tb();


reg [7:0]in;
wire [2:0]out;

priority_encoder dut(.in(in),.out(out));

initial begin
    $dumpfile("priority_encoder.vcd");
    $dumpvars(1);
    $display("Input            |  Output");

    $monitor("  %b      ->    %b",in,out);
    in = 0;
    repeat (256) begin
        #5 in = in + 1 ;
    end

    $finish;

end



endmodule