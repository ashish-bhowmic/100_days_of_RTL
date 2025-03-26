`timescale 1ns / 1ps
`include "carry_look_ahead_adder.v"

module carry_look_ahead_adder_tb;

  // Inputs
  reg [3:0] a;
  reg [3:0] b;
  reg cin;

  // Outputs
  wire [3:0] sum;
  wire cout;

  // Instantiate the Unit Under Test (UUT)
  carry_look_ahead_adder uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  initial begin
    // Initialize Inputs
    a = 4'b0000;
    b = 4'b0000;
    cin = 1'b0;

    // Test Cases
    $display("Test Case 1: a=0000, b=0000, cin=0");
    #10;
    $display("a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);

    a = 4'b0001;
    b = 4'b0010;
    cin = 1'b0;
    $display("Test Case 2: a=0001, b=0010, cin=0");
    #10;
    $display("a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);

    a = 4'b1111;
    b = 4'b0001;
    cin = 1'b0;
    $display("Test Case 3: a=1111, b=0001, cin=0");
    #10;
    $display("a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);

    a = 4'b1010;
    b = 4'b0101;
    cin = 1'b1;
    $display("Test Case 4: a=1010, b=0101, cin=1");
    #10;
    $display("a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);

    a = 4'b1111;
    b = 4'b1111;
    cin = 1'b1;
    $display("Test Case 5: a=1111, b=1111, cin=1");
    #10;
    $display("a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);

    // Add more test cases as needed
    $finish;
  end

endmodule