`timescale 1ns/1ps
`include "sync_fifo.v"
module sync_fifo_tb;

  // Parameters
  parameter DEPTH = 8;
  parameter DATA_WIDTH = 8;

  // Signals
  reg clk;
  reg rst;
  reg read;
  reg write;
  reg [DATA_WIDTH-1:0] data_in;
  wire [DATA_WIDTH-1:0] data_out;
  wire full;
  wire empty;

  // Instantiate the FIFO module
  sync_fifo #(
    .depth(DEPTH)
  ) u_fifo (
    .clk(clk),
    .rst(rst),
    .read(read),
    .write(write),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Test sequence
  initial begin
    // Initialize signals
    clk = 0;
    rst = 1;
    read = 0;
    write = 0;
    data_in = 0;

    // Dump waveforms for visualization with GTKWave
    $dumpfile("sync_fifo_tb.vcd");
    $dumpvars(0, sync_fifo_tb);

    // Reset the FIFO
    #10 rst = 0;
    #10;

    // --- Test Case 1: Write and Read ---
    $display("Test Case 1: Write and Read ---");
    write = 1; data_in = 8'h11; #10;
    write = 1; data_in = 8'h22; #10;
    write = 1; data_in = 8'h33; #10;
    write = 0; #10;

    read = 1; #10; $display("Read: %h, Empty: %b", data_out, empty);
    read = 1; #10; $display("Read: %h, Empty: %b", data_out, empty);
    read = 1; #10; $display("Read: %h, Empty: %b", data_out, empty);
    read = 0; #10;

    // --- Test Case 2: Fill the FIFO ---
    $display("--- Test Case 2: Fill the FIFO ---");
    write = 1; data_in = 8'h44; #10;
    write = 1; data_in = 8'h55; #10;
    write = 1; data_in = 8'h66; #10;
    write = 1; data_in = 8'h77; #10;
    write = 1; data_in = 8'h88; #10;
    write = 1; data_in = 8'h99; #10;
    write = 1; data_in = 8'hAA; #10;
    write = 1; data_in = 8'hBB; #10;
    #10;
    $display("Full: %b", full);
    write = 1; data_in = 8'hCC; #10; // Attempt to write when full
    $display("Full after attempt: %b", full);
    write = 0; #10;

    // --- Test Case 3: Empty the FIFO ---
    $display("--- Test Case 3: Empty the FIFO ---");
    read = 1; #10; $display("Read: %h, Empty: %b", data_out, empty);
    read = 1; #10; $display("Read: %h, Empty: %b", data_out, empty);
    read = 1; #10; $display("Read: %h, Empty: %b", data_out, empty);
    read = 1; #10; $display("Read: %h, Empty: %b", data_out, empty);
    read = 1; #10; $display("Read: %h, Empty: %b", data_out, empty);
    read = 1; #10; $display("Read: %h, Empty: %b", data_out, empty);
    read = 1; #10; $display("Read: %h, Empty: %b", data_out, empty);
    read = 1; #10; $display("Read: %h, Empty: %b", data_out, empty);
    #10;
    $display("Empty: %b", empty);
    read = 1; #10; $display("Read when empty: %h, Empty: %b", data_out, empty); // Attempt to read when empty
    read = 0; #10;

    // --- Test Case 4: Write and Read Interleaved ---
    $display("--- Test Case 4: Write and Read Interleaved ---");
    write = 1; data_in = 8'hD1; #10;
    read = 1;  $display("Read: %h, Empty: %b", data_out, empty);
    write = 1; data_in = 8'hD2; #10;
    write = 1; data_in = 8'hD3; #10;
    read = 1;  $display("Read: %h, Empty: %b", data_out, empty);
    read = 1;  $display("Read: %h, Empty: %b", data_out, empty);
    write = 1; data_in = 8'hD4; #10;
    write = 0; read = 0; #20;

    $finish;
  end

  // Monitor for visualization in simulation output (runs once at time 0)
  initial begin
    $monitor("Time=%t, RST=%b, WR=%b, RD=%b, Din=%h, Dout=%h, Full=%b, Empty=%b, WP=%d, RP=%d, Count=%d",
             $time, rst, write, read, data_in, u_fifo.data_out, full, empty, u_fifo.write_pointer, u_fifo.read_pointer, u_fifo.count);
  end

endmodule