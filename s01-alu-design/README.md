# 64-bit ALU Design

## Overview

This project implements a 64-bit arithmetic logic unit using SystemVerilog.  
The design is built from smaller reusable hardware modules, including multiplexers, a full adder/subtractor unit, and a 1-bit ALU slice.

## Features

- 2-to-1 multiplexer
- 4-to-1 multiplexer
- Full adder/subtractor module
- 1-bit ALU slice
- 64-bit ALU composed from smaller modules
- Basic SystemVerilog testbenches

## Technologies Used

- SystemVerilog
- ModelSim
- Digital logic design
- Modular hardware design

## Files

- `mux2.sv` - 2-input multiplexer
- `mux4.sv` - 4-input multiplexer
- `fas.sv` - full adder/subtractor
- `alu1bit.sv` - single-bit ALU slice
- `alu64bit.sv` - 64-bit ALU
- `*_test.sv` - simulation testbenches

## What I Learned

- Building large hardware modules from smaller components
- Designing reusable combinational logic modules
- Writing simple testbenches for simulation
- Understanding how ALU operations are composed at the bit level
