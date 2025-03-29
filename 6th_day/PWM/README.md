# Verilog PWM Generator with Asynchronous Reset

This repository contains Verilog code for a PWM (Pulse Width Modulation) generator module and its testbench.

## Files

* `pwm.v`: Verilog module implementing a PWM generator.
* `pwm_tb.v`: Verilog testbench for simulating the `pwm` module.

## Description

`pwm.v` generates a PWM output signal (`pwm_out`) based on an 8-bit duty cycle input (`duty_cycle`). It features an asynchronous reset (`rst`).

`pwm_tb.v` generates a 100 MHz clock and applies an asynchronous reset to test the `pwm` module. It sets the duty cycle to a fixed value and dumps waveforms to `pwm.vcd` for visualization.

## Simulation Instructions

### Vivado Simulation

1.  Create a Vivado project.
2.  Add `pwm.v` and `pwm_tb.v` as source files.
3.  Run behavioral simulation.

### ModelSim Simulation

1.  Create a ModelSim project (optional).
2.  Add `pwm.v` and `pwm_tb.v` as source files.
3.  Compile with `vlog pwm.v pwm_tb.v`.
4.  Simulate with `vsim pwm_tb`.
5.  Add signals to waveform and run simulation.

## Notes

* Timescale is `1ns/1ps`.
* Testbench generates a 100 MHz clock.
* Duty cycle is set to 50% (128/255).
* Waveforms are dumped to `pwm.vcd`.
