# Simple Multicycle RISC-V Processor

## Overview

This project implements and extends a simple multicycle RISC-V processor model using SystemVerilog.

The design includes a datapath, control unit, top-level processor module, simulation environment, instruction memory, data memory, and an assembly test program.

## Features

- Multicycle RISC-V processor structure
- Separate datapath and control modules
- Instruction decoding through opcode and funct3 fields
- Support for memory access, arithmetic, branch, and jump instructions
- Assembly test program
- Instruction and data memory initialization files
- ModelSim simulation environment

## Technologies Used

- SystemVerilog
- RISC-V Assembly
- ModelSim
- Computer Architecture
- Datapath Design
- Control Unit Design
- Finite-State Machines

## Files

- `rv_dp.sv` - datapath module
- `rv_ctl.sv` - control unit module
- `rv_top.sv` - top-level processor module
- `rv_sim.sv` - simulation/testbench environment
- `params.inc` - processor control constants and instruction definitions
- `test.s` - assembly test program
- `imem.hex` - instruction memory image
- `dmem_init.hex` - initial data memory contents

## What I Learned

- How a multicycle processor executes instructions across multiple states
- How control signals coordinate datapath behavior
- How instruction decoding maps to processor states
- How assembly programs are loaded into instruction memory
- How SystemVerilog can be used to model processor hardware
