# FPGA CNN Accelerator

A streaming FPGA-oriented CNN accelerator written in Verilog/SystemVerilog.

This project implements the foundational architecture of a Convolutional Neural Network (CNN) accelerator using a fully modular RTL design approach. The design is simulation-driven and verified using Icarus Verilog and GTKWave on Linux.

---

# Project Goals

The goal of this project is to learn and implement:

- FPGA accelerator architecture
- Streaming CNN pipelines
- RTL design methodology
- Convolution hardware
- Activation functions
- Pooling hardware
- Pipelined dataflow systems
- CNN hardware fundamentals
- Verification workflows

---

# Current Status

## Phase 1 Complete

Implemented:

- Signed INT8 MAC Unit
- FIFO Buffer
- Register File
- Line Buffer
- Sliding Window Generator
- Convolution Engine
- ReLU Activation Unit
- Max Pooling Unit
- Full CNN Pipeline Integration

---

# Implemented Pipeline

```text
Input Pixels
↓
Sliding Window Generator
↓
Convolution Engine
↓
ReLU Activation
↓
Output Feature Stream
```

---

# Technologies Used

## Languages
- Verilog/SystemVerilog

## Tools
- VS Code
- Icarus Verilog
- GTKWave
- Verilator
- Yosys
- Git/GitHub

## Platform
- Kubuntu Linux

---

# Project Structure

```text
cnn_accelerator/
│
├── docs/
├── rtl/
│   ├── mac_unit.v
│   ├── fifo.v
│   ├── register_file.v
│   ├── line_buffer.v
│   ├── sliding_window.v
│   ├── convolution_engine.v
│   ├── relu.v
│   ├── max_pool.v
│   └── cnn_pipeline.v
│
├── tb/
│   ├── mac_tb.v
│   ├── fifo_tb.v
│   ├── register_file_tb.v
│   ├── line_buffer_tb.v
│   ├── sliding_window_tb.v
│   ├── convolution_engine_tb.v
│   ├── relu_tb.v
│   ├── max_pool_tb.v
│   └── cnn_pipeline_tb.v
│
├── sim/
├── waveforms/
├── scripts/
│
├── Makefile
├── README.md
└── .gitignore
```

---

# Phase 1 Modules

## 1. MAC Unit

Implements signed INT8 multiply-accumulate operation.

Operation:

```text
acc_out = acc_in + (a × b)
```

Purpose:
- Fundamental computation block for CNNs
- Core arithmetic unit for convolution

---

## 2. FIFO Buffer

Implements:
- write/read buffering
- flow control
- queue-based storage

Features:
- full flag
- empty flag
- sequential data handling

Purpose:
- streaming synchronization
- pipeline buffering

---

## 3. Register File

Implements:
- small local memory
- indexed read/write access

Purpose:
- temporary storage
- activation/weight storage

---

## 4. Line Buffer

Implements:
- previous row storage
- streaming image buffering

Purpose:
- support sliding window generation
- enable convolution on streamed pixels

---

## 5. Sliding Window Generator

Generates:
- moving 3×3 convolution windows

Purpose:
- convert serial pixel stream into spatial CNN windows

---

## 6. Convolution Engine

Implements:
- 3×3 convolution operation
- kernel multiplication
- accumulation

Kernel:

```text
1 0 1
0 1 0
1 0 1
```

Purpose:
- CNN feature extraction

---

## 7. ReLU Activation Unit

Implements:
- Rectified Linear Unit activation

Operation:

```text
f(x) = max(0, x)
```

Purpose:
- introduce nonlinearity
- remove negative activations

---

## 8. Max Pooling Unit

Implements:
- 2×2 max pooling

Purpose:
- feature map reduction
- bandwidth reduction
- feature compression

---

## 9. Full CNN Pipeline

Integrated streaming architecture:

```text
Sliding Window
→ Convolution
→ ReLU
```

Purpose:
- continuous CNN hardware processing pipeline

---

# Simulation Workflow

## Compile + Run

```bash
make
```

## Open Waveforms

```bash
make wave
```

---

# Verification

All modules are individually verified using:
- dedicated Verilog testbenches
- GTKWave waveform analysis

Verification includes:
- signed arithmetic correctness
- FIFO behavior
- convolution correctness
- activation correctness
- pooling correctness
- streaming pipeline validation

---

# Design Philosophy

This project focuses on:

- streaming dataflow architecture
- modular RTL design
- pipelined hardware systems
- FPGA-oriented accelerator design
- scalable CNN infrastructure

The accelerator is intentionally designed incrementally to build strong architecture understanding before advanced optimization stages.

---

# Future Roadmap

## Phase 2
- Proper streaming max pooling integration
- Feature map buffering
- Pipeline control logic
- Valid/ready handshaking

## Phase 3
- Processing Element (PE) arrays
- Systolic array architecture
- Parallel convolution

## Phase 4
- Memory optimization
- Double buffering
- Bandwidth optimization

## Phase 5
- Python verification infrastructure
- Tensor/image preprocessing
- Automated test generation

## Phase 6
- FPGA deployment
- Resource utilization analysis
- Performance benchmarking

---

# Learning Objectives

This project is intended to develop understanding of:

- FPGA architecture
- CNN accelerator hardware
- Streaming pipelines
- Hardware dataflow
- Parallel computation
- RTL verification
- Pipelined digital systems
- AI hardware fundamentals

---

# How To Run

## 1. Clone Repository

```bash
git clone <your-repo-link>
```

## 2. Enter Project

```bash
cd cnn_accelerator
```

## 3. Compile + Simulate

```bash
make
```

## 4. Open Waveforms

```bash
make wave
```

---

# Requirements

Install:

- Icarus Verilog
- GTKWave
- VS Code
- Git

Ubuntu/Kubuntu:

```bash
sudo apt install iverilog gtkwave git
```

---

# Development Environment

Recommended VS Code Extensions:

- Verilog HDL/SystemVerilog
- Error Lens
- GitLens

---

# Key Concepts Implemented

- Signed INT8 arithmetic
- Streaming CNN dataflow
- Sliding window generation
- Convolution computation
- Activation pipelines
- Max pooling
- Pipelined RTL systems
- FPGA-oriented architecture

---

# Author

FPGA CNN Accelerator Project  
Verilog/SystemVerilog RTL Design