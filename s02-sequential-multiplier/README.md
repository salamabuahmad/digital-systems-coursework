# Sequential 32-bit Multiplier

## Overview

This project implements a sequential 32-bit multiplier in SystemVerilog.  
The design separates the multiplier into a datapath/arithmetic unit and a finite-state control unit.

The project also includes an optimized version that reduces unnecessary cycles for smaller input values.

## Features

- 32-bit by 32-bit multiplication
- 64-bit product output
- Sequential control using an FSM
- Separate arithmetic and control modules
- Standard multiplier implementation
- Optimized fast multiplier implementation
- SystemVerilog testbenches
- ModelSim waveform simulation

## Technologies Used

- SystemVerilog
- ModelSim
- Finite-State Machines
- Sequential Logic
- Datapath and Control Design

## Files

- `mult32x32.sv` - top-level multiplier
- `mult32x32_arith.sv` - arithmetic/datapath module
- `mult32x32_fsm.sv` - control FSM
- `mult32x32_fast.sv` - optimized top-level multiplier
- `mult32x32_fast_arith.sv` - optimized datapath
- `mult32x32_fast_fsm.sv` - optimized FSM
- `mult32x32_test.sv` - standard multiplier testbench
- `mult32x32_fast_test.sv` - fast multiplier testbench
- `mult16x16.s` - assembly test program

## Simulation

The project was simulated using ModelSim.  
Waveform screenshots are included in the `screenshots/` folder.

## What I Learned

- Designing sequential circuits using FSMs
- Splitting a hardware design into datapath and control logic
- Handling clock, reset, start, and busy signals
- Testing hardware modules through simulation
- Optimizing a sequential design by reducing unnecessary computation cycles
