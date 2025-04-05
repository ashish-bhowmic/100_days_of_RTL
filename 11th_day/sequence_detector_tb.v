`timescale 1ns/1ps
`include "sequence_detector.v"

module tb_sequence_detector;

    // Inputs
    reg clk;
    reg rst;
    reg in;

    // Outputs
    wire detect;

    // Instantiate the sequence_detector module
    sequence_detector dut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .detect(detect)
    );

    // Clock Generation
    always begin
        #5 clk = ~clk;  // Generate clock with a period of 10ns
    end

    initial begin

        $dumpfile("detector.vcd");
	    $dumpvars (1);
        // Initialize Inputs
        clk = 0;
        rst = 1;  // Apply reset initially
        in = 0;

        // Apply Reset
        #10;
        rst = 0;  // Release reset
	
        // Monitor the signals during the simulation
        $monitor("clk=%b\t rst=%b\t in=%b\t detect=%b\t state=%b", clk, rst, in, detect, dut.state);


        @(posedge clk) in =1;
        @(posedge clk) in =0;
        @(posedge clk) in =0;
        @(posedge clk) in =1;
        @(posedge clk) in =0;
        @(posedge clk) in =1;
        @(posedge clk) in =1;
        @(posedge clk) in =0;
        @(posedge clk) in =0;
        @(posedge clk) in =1;
        @(posedge clk) in =1;
        #20;
        $finish;
    end

endmodule
