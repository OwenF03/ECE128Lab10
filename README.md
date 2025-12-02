# ECE128Lab10
# Owen Funk and David Riley

## Description

Implement a multiplier which reads operands from ROM, and write the result into RAM. The design was implemented and tested using AMD Vivado 2023.1.

## Instructions to run

Download all of the provided files and create a new project using AMD Vivado 2023.1, and select the Xilinx Artic-7 FPGA (XC7A35T-ICPG236C) as the board. Add the module files (all .v files that don't end in tb) as design sources, the .xdc file as constratint sources, and the .v files that end with tb as simulation sources. The specific sources for each problem are listed below. 

# Which Files Correspond to Each Part

Design sources : Multiplier.v (top control module and multiplier module), RAM.v (read/write memory module), ROM.v (read only memory file)

Simulation sources : Multiplier_tb.v (testbench for system)

Memory sources: mem.h (hex file containing instructions to be read by ROM module)

Constraints : None, this module is not deployed to an FPGA board
