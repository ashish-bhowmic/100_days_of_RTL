# Pattern Generator in Verilog

This repository contains the Verilog RTL code for a pattern generator module. The module is designed to output a specific repeating sequence of 8-bit patterns based on a clock and reset input.

## Overview

The `pattern_gen.v` module implements a sequential logic circuit that cycles through the following 8-bit patterns:
0000_0001
0001_0000
0000_0001
0010_0000
0000_0001
0100_0000
0000_0001
1000_0000

The pattern repeats indefinitely after the last pattern in the sequence.

## Files

* **`pattern_gen.v`**: Contains the Verilog RTL code for the pattern generator module.
* **`pattern_gen_tb.v`**: Contains a Verilog testbench to simulate and verify the functionality of the `pattern_gen` module.
* **`pattern.vcd`**: (Generated after simulation) A Value Change Dump (VCD) file that records the signal waveforms during simulation.

## Module Ports

The `pattern_gen` module has the following ports:

* **`input clk`**: Clock input. The pattern advances on the positive edge of this clock.
* **`input rst`**: Asynchronous reset input (active high). When `rst` is high, the output is initialized to `8'b0000_0001` and the internal counter is reset.
* **`output reg [7:0] out`**: 8-bit output register that holds the current pattern in the sequence.

## Testbench

The `pattern_gen_tb.v` file provides a test environment for the `pattern_gen` module. It includes:

* Clock generation with a period of 10 time units.
* Assertion of the reset signal for a short duration at the beginning of the simulation.
* Instantiation of the `pattern_gen` module.
* A `$monitor` statement to display the time and the values of the output (`out`), internal registers (`a`, `c`), and the counter (`count`).
* A `$dumpfile` and `$dumpvars` setup to generate a VCD file for waveform viewing.

## Simulation (Linux)

To simulate the design on a Linux system, assuming you have Icarus Verilog (`iverilog`) and GTKWave (`gtkwave`) installed:

1.  **Compile the Verilog files:**
    ```bash
    iverilog pattern_gen_tb.v 
    ```

2.  **Run the simulation:**
    ```bash
    ./a.out
    ```

3.  **View the waveforms (optional):**
    ```bash
    gtkwave pattern.vcd &
    ```

## Implementation Notes

* The pattern sequence is implemented using a 3-bit internal counter and a `case` statement within a clocked `always` block.
* The reset is asynchronous, meaning the output will be reset to the initial value regardless of the clock edge when the reset signal is high.
* The testbench monitors the output and internal signals (`a`, `c`, `count`) for verification.

## Potential Enhancements

* **Parameterization:** The pattern sequence could be made configurable using Verilog parameters.
* **Synchronous Reset:** The reset could be made synchronous to the clock edge.
* **More Complex Patterns:** The module could be extended to generate more intricate or user-defined patterns.
* **Control Signals:** Input signals could be added to control the start, stop, or direction of the pattern generation.

