`timescale 1ns / 1ps
`include "sync_lifo.v"

module sync_lifo_tb;

    parameter DATA_WIDTH = 8;
    parameter DEPTH = 8;
    parameter CLK_PERIOD = 10;

    reg clk;
    reg rst;
    reg write;
    reg read;
    reg [DATA_WIDTH-1:0] data_in;
    wire [DATA_WIDTH-1:0] data_out;
    wire full;
    wire empty;

    sync_lifo #(
        .depth(DEPTH)
    ) uut (
        .clk(clk),
        .rst(rst),
        .read(read),
        .write(write),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    initial begin
        rst = 1; # (CLK_PERIOD * 2); rst = 0; # CLK_PERIOD;

        $display("Minimal Test (Slightly More) with Count Debug:");

        // Write one element
        write = 1; data_in = 8'h11; #CLK_PERIOD; write = 0; #CLK_PERIOD;

        // Read it
        read = 1; #CLK_PERIOD; read = 0;
        $display("  Read 1: data_out=%h, empty=%b, count=%d", data_out, empty, uut.count);

        // Try to read again from empty
        read = 1; #CLK_PERIOD; read = 0;
        $display("  Read 2 (empty): data_out=%h, empty=%b, count=%d", data_out, empty, uut.count);

        // Write multiple elements
        write = 1; data_in = 8'h31; #CLK_PERIOD;
        write = 1; data_in = 8'h32; #CLK_PERIOD;
        write = 1; data_in = 8'h38; #CLK_PERIOD;
        write = 1; data_in = 8'h26; #CLK_PERIOD;
        write = 1; data_in = 8'h10; #CLK_PERIOD; write = 0; #CLK_PERIOD;

        // Read multiple elements (LIFO order: 10, 26, 38, 32, 31)
        read = 1; #CLK_PERIOD;
        $display("  Read 3: data_out=%h (Expect 10), empty=%b, count=%d", data_out, empty, uut.count);
        read = 1; #CLK_PERIOD;
        $display("  Read 4: data_out=%h (Expect 26), empty=%b, count=%d", data_out, empty, uut.count);
        read = 1; #CLK_PERIOD;
        $display("  Read 5: data_out=%h (Expect 38), empty=%b, count=%d", data_out, empty, uut.count);
        read = 1; #CLK_PERIOD;
        $display("  Read 6: data_out=%h (Expect 32), empty=%b, count=%d", data_out, empty, uut.count);
        read = 1; #CLK_PERIOD;
        $display("  Read 7: data_out=%h (Expect 31), empty=%b, count=%d", data_out, empty, uut.count);
        read = 1; #CLK_PERIOD;
        $display("  Read 8 (empty): data_out=%h (Expect 11 or 0), empty=%b, count=%d", data_out, empty, uut.count);
        read = 1; #CLK_PERIOD;
        $display("  Read 9 (empty): data_out=%h (Expect 11 or 0), empty=%b (expect 1), count=%d", data_out, empty, uut.count);

        read = 0;

        $finish;
    end

endmodule