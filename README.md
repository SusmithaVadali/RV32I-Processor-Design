# RV32I Processor Design

This project involves the design and implementation of a pipelined 32-bit RISC-V processor (RV32I architecture) using Verilog on the Xilinx FPGA platform. Developed as part of my internship, the processor incorporates key performance optimization techniques and area-power trade-offs suitable for modern VLSI systems.

## 🔧 Features

- **Instruction Set Architecture**: Implements the base RV32I instruction set.
- **Pipelined Architecture**: Improved instruction throughput using a classic 5-stage pipeline (IF, ID, EX, MEM, WB).
- **Hazard Management**: Efficient handling of data and control hazards through forwarding and hazard detection units.
- **Memory Integration**: Utilized Block RAM (BRAM) to reduce LUT usage and enhance FPGA resource efficiency.
- **Functional Validation**: Verified processor correctness using test programs including the Fibonacci sequence.

## ⚙️ CMOS Optimization

The processor was further synthesized using **32nm CMOS technology** to evaluate physical design metrics:

- **Area**: 0.17837 mm²  
- **Dynamic Power**: 17.22 mW  
- **Leakage Power**: 0.25 mW  
- **Clock Delay**: 20 ns  
- **Maximum Frequency**: 50 MHz

These metrics demonstrate the design’s high efficiency and suitability for embedded and low-power applications.

## 🧪 Tools Used

- **Hardware Description**: Verilog HDL  
- **FPGA Platform**: Xilinx  
- **Synthesis Tool**: Synopsys Design Compiler  
- **Technology Library**: 32nm CMOS Standard Cell Library


