# FPGA CNN Accelerator

A scalable FPGA-oriented CNN accelerator written in Verilog/SystemVerilog.

This project implements a modular and scalable CNN accelerator architecture using RTL design principles. The architecture evolves from basic CNN hardware blocks into a controlled streaming accelerator pipeline with scalable parameterized infrastructure.

The project is simulation-driven and verified using Icarus Verilog and GTKWave on Linux.

---

# Current Status

# Phase 1 Complete
# Phase 2 Complete

---

# Project Goals

This project focuses on learning and implementing:

- FPGA accelerator architecture
- CNN hardware pipelines
- Streaming dataflow systems
- Handshake-controlled pipelines
- Scalable RTL infrastructure
- FPGA-oriented design methodology
- CNN accelerator fundamentals
- Hardware verification workflows

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

# Implemented Architecture

```text
Input Pixels
↓
Sliding Window Generator
↓
Convolution Engine
↓
Handshake Pipeline
↓
ReLU Activation
↓
Streaming Feature Outputs
```

---

# Project Structure

```text
cnn_accelerator/
│
├── rtl/
│   ├── scalable_mac_unit.v
│   ├── scalable_fifo.v
│   ├── scalable_register_file.v
│   ├── scalable_line_buffer.v
│   ├── scalable_sliding_window.v
│   ├── scalable_convolution_engine.v
│   ├── scalable_relu.v
│   ├── scalable_max_pool.v
│   ├── scalable_handshake_stage.v
│   ├── scalable_feature_map_buffer.v
│   ├── scalable_cnn_pipeline.v
│   └── streaming_max_pool.v
│
├── tb/
│   ├── scalable_mac_unit_tb.v
│   ├── scalable_fifo_tb.v
│   ├── scalable_register_file_tb.v
│   ├── scalable_line_buffer_tb.v
│   ├── scalable_sliding_window_tb.v
│   ├── scalable_convolution_engine_tb.v
│   ├── scalable_relu_tb.v
│   ├── scalable_max_pool_tb.v
│   ├── scalable_handshake_stage_tb.v
│   ├── scalable_feature_map_buffer_tb.v
│   ├── scalable_cnn_pipeline_tb.v
│   ├── cnn_pipeline_handshake_tb.v
│   └── streaming_max_pool_tb.v
│
├── scripts/
├── waveforms/
│
├── Makefile
├── README.md
└── .gitignore
```

---

# Phase 1 Overview

Phase 1 focused on building the fundamental CNN accelerator pipeline.

Implemented:
- Signed INT8 MAC Unit
- FIFO Buffer
- Register File
- Line Buffer
- Sliding Window Generator
- Convolution Engine
- ReLU Activation
- Max Pooling
- Full CNN Pipeline Integration

Core concepts learned:
- streaming CNN pipelines
- convolution hardware
- CNN dataflow
- RTL verification
- pipelined processing

---

# Phase 2 Overview

Phase 2 focused on transforming the architecture into a scalable and controlled streaming accelerator.

Implemented:
- Valid/Ready Handshake Protocol
- Controlled Streaming Pipeline
- Feature Map Buffering
- Streaming Max Pool Integration
- Parameterized RTL Architecture
- Scalable CNN Pipeline

Core concepts learned:
- handshake-based synchronization
- backpressure
- pipeline stalling
- scalable RTL design
- reusable hardware architecture
- controlled streaming systems

---

# Implemented Modules

## 1. Scalable MAC Unit

Implements signed multiply-accumulate arithmetic.

Operation:

```text
acc_out = acc_in + (a × b)
```

Purpose:
- convolution arithmetic
- CNN computation core

---

## 2. Scalable FIFO

Implements:
- streaming buffers
- queue-based storage
- flow synchronization

Features:
- full/empty flags
- scalable depth
- parameterized width

---

## 3. Scalable Register File

Implements:
- configurable local storage
- indexed read/write memory

Purpose:
- temporary feature storage
- weight storage

---

## 4. Scalable Line Buffer

Implements:
- image row buffering
- delayed pixel streaming

Purpose:
- support sliding window generation

---

## 5. Scalable Sliding Window Generator

Generates:
- streaming 3×3 convolution windows

Purpose:
- convert serial pixel stream into spatial CNN windows

---

## 6. Scalable Convolution Engine

Implements:
- 3×3 convolution
- kernel multiplication
- accumulation

Kernel:

```text
1 0 1
0 1 0
1 0 1
```

Purpose:
- feature extraction

---

## 7. Scalable ReLU

Implements:

```text
f(x) = max(0, x)
```

Purpose:
- CNN activation
- nonlinearity

---

## 8. Scalable Max Pool

Implements:
- 2×2 max pooling

Purpose:
- feature reduction
- bandwidth reduction

---

## 9. Scalable Handshake Stage

Implements:
- valid/ready protocol
- controlled streaming
- pipeline synchronization

Purpose:
- safe inter-stage communication

---

## 10. Scalable Feature Map Buffer

Implements:
- feature storage memory
- buffered CNN outputs

Purpose:
- pooling preparation
- future CNN layer support

---

## 11. Scalable CNN Pipeline

Integrated architecture:

```text
Sliding Window
→ Convolution
→ Handshake Stage
→ ReLU
```

Purpose:
- scalable streaming CNN accelerator

---

# Simulation Workflow

## Compile + Simulate

```bash
make
```

## Open Waveforms

```bash
make wave
```

---

# Verification

All modules are verified using:
- dedicated Verilog testbenches
- GTKWave waveform analysis

Verification includes:
- signed arithmetic correctness
- streaming correctness
- handshake correctness
- convolution correctness
- pooling correctness
- pipeline synchronization

---

# Design Philosophy

This project focuses on:

- streaming accelerator design
- scalable RTL architecture
- FPGA-oriented implementation
- reusable hardware infrastructure
- modular CNN hardware systems

The architecture is intentionally developed incrementally to build deep understanding of accelerator engineering fundamentals.

---

# Future Roadmap

# Phase 3
FPGA implementation and optimization:
- synthesis
- timing analysis
- DSP inference
- BRAM inference
- FPGA resource optimization
- pipeline optimization

# Phase 4
Advanced accelerator architecture:
- systolic arrays
- PE arrays
- parallel convolution
- multi-channel CNN support

# Phase 5
Software integration:
- Python verification
- automated test generation
- image preprocessing

# Phase 6
Real FPGA deployment:
- board implementation
- benchmarking
- real-time demonstrations

---

# Learning Objectives

This project develops understanding of:

- FPGA architecture
- CNN accelerator hardware
- streaming dataflow systems
- scalable RTL design
- accelerator synchronization
- hardware pipelines
- AI accelerator fundamentals
- digital hardware verification

---

# How To Run

## 1. Clone Repository

```bash
git clone <your-repository-link>
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
- Git
- VS Code

Ubuntu/Kubuntu:

```bash
sudo apt install iverilog gtkwave git
```

---

# Recommended VS Code Extensions

- Verilog HDL/SystemVerilog
- Error Lens
- GitLens

---

# Author

FPGA CNN Accelerator Project  
Verilog/SystemVerilog RTL Design