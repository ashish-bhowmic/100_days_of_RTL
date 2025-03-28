# Verilog Frequency Divider (Divide-by-10)

This repository contains Verilog code for a divide-by-10 frequency divider and its testbench.

## Files

* `freq_div.v`: Verilog module for the frequency divider.
* `freq_div_tb.v`: Verilog testbench for simulating the module.

## Description

`freq_div.v` implements a module that divides an input clock (`clk`) by 10, producing an output clock (`clk_out`) with a 50% duty cycle. It uses an asynchronous reset (`rst`).

`freq_div_tb.v` generates a 1 GHz clock and applies a reset to test the `freq_div` module. Waveforms are dumped to `freq.vcd` for visualization.

## Simulation

To simulate:

1.  Use a Verilog simulator (e.g., Icarus Verilog).
2.  Compile: `iverilog -o freq_div_tb freq_div.v freq_div_tb.v`
3.  Run: `vvp freq_div_tb`
4.  View waveforms: `gtkwave freq.vcd`

## Notes

* Ensure your simulator's timescale is set to `1ns/1ps`.
* Output frequency is 1/10th of input frequency.

