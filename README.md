# Digital Hardware Projects

A collection of digital logic and computer architecture projects completed as part of COMP 300 (Digital Systems) at the University of San Diego. These projects demonstrate progressive implementation of hardware concepts from fundamental logic gates to a fully pipelined RISC-V processor.

## Projects Overview

### 1. Full Adder
**Language:** Schematic/Verilog | **Focus:** Combinational Logic

Designed a full adder circuit from first principles using schematic capture, implementing the fundamental building block for all binary arithmetic operations.

**Key Accomplishments:**
- Derived logic equations from truth table analysis
- Implemented carry-in and carry-out propagation for multi-bit cascading
- Verified functionality through ModelSim waveform simulation
- Synthesized design for FPGA deployment using Quartus

**Skills Demonstrated:** Truth tables, combinational logic design, schematic capture, simulation verification

---

### 2. Seven Segment Display Decoder
**Language:** Schematic/Verilog | **Focus:** Boolean Optimization

Built a 4-bit binary to 7-segment display decoder, converting binary inputs (0-15) to the appropriate segment patterns for hexadecimal display.

**Key Accomplishments:**
- Derived minimal Boolean equations using Karnaugh maps for all 7 output segments
- Applied algebraic simplification and De Morgan's theorem for gate reduction
- Designed optimized PLA-style circuit layout following best practices
- Verified all 16 input combinations through comprehensive testbench simulation

**Skills Demonstrated:** K-maps, Boolean algebra, logic minimization, schematic design

---

### 3. Adventure Game FSM
**Language:** Schematic/Verilog | **Focus:** Finite State Machines

Implemented a text-based adventure game using finite state machine logic. The game tracks player navigation through rooms, sword acquisition, and win/death conditions.

**Key Accomplishments:**
- Designed complete state transition diagram with 7 states
- Derived next-state and output equations from state transition tables
- Implemented separate FSMs for room navigation and sword tracking
- Built comprehensive testbenches verifying all game paths (win and death scenarios)

**Skills Demonstrated:** FSM design, state encoding, sequential logic, testbench development

---

### 4. Thunderbird Turn Signal FSM
**Language:** SystemVerilog | **Focus:** Sequential Circuit Design

Implemented the classic Ford Thunderbird sequential turn signal pattern using a Moore finite state machine. Controls six tail lights in a cascading on/off pattern.

**Key Accomplishments:**
- Designed 7-state Moore FSM with clean state encoding
- Implemented synchronous reset and proper clock edge triggering
- Built exhaustive testbench covering all state transitions and edge cases
- Verified proper signal timing through waveform analysis

**Skills Demonstrated:** Moore FSM, SystemVerilog, synchronous design, testbench methodology

---

### 5. Arithmetic Logic Unit (ALU)
**Language:** SystemVerilog | **Focus:** Arithmetic Circuits

Designed a parameterized N-bit ALU supporting core arithmetic and logical operations required for processor implementation.

**Key Accomplishments:**
- Implemented 7 operations: ADD, SUB, AND, OR, XOR, NOR, SLT
- Built parameterized design supporting arbitrary bit widths (default 16-bit)
- Implemented zero flag, carry out, and signed overflow detection
- Handled edge cases for signed arithmetic and set-less-than comparison

**Skills Demonstrated:** Parameterized modules, arithmetic operations, overflow detection, ALU design

---

### 6. RISC-V Single-Cycle Processor
**Language:** SystemVerilog | **Focus:** Processor Architecture

Built a complete single-cycle implementation of a subset of the RISC-V RV32I instruction set, executing one instruction per clock cycle.

**Key Accomplishments:**
- Implemented full datapath with instruction memory, register file, ALU, and data memory
- Designed main decoder and ALU decoder for control signal generation
- Supported R-type, I-type, S-type, B-type, and U-type instruction formats
- Implemented instructions: ADD, SUB, AND, OR, SLT, LW, SW, BEQ, BNE, LUI, XORI
- Verified execution through assembly test programs with waveform analysis

**Skills Demonstrated:** Processor architecture, datapath design, control logic, RISC-V ISA

---

### 7. Pipelined Processor, Part I
**Language:** SystemVerilog | **Focus:** Pipeline Architecture

Converted the single-cycle processor to a 5-stage pipelined architecture, enabling instruction-level parallelism and improved throughput.

**Key Accomplishments:**
- Implemented classic 5-stage pipeline: IF, ID, EX, MEM, WB
- Designed pipeline registers to hold instruction state between stages
- Propagated control signals through pipeline stages
- Verified correct instruction flow through multi-instruction test sequences

**Skills Demonstrated:** Pipelining, pipeline registers, instruction-level parallelism, throughput optimization

---

### 8. Pipelined Processor, Part II
**Language:** SystemVerilog | **Focus:** Hazard Resolution

Extended the pipelined processor with full hazard detection and resolution, handling data dependencies and control flow changes.

**Key Accomplishments:**
- Implemented forwarding unit for EX-EX and MEM-EX data hazards
- Built hazard detection unit for load-use stall insertion
- Designed pipeline flushing for branch misprediction handling
- Created 7 targeted unit tests validating each hazard scenario
- Verified complete processor functionality with comprehensive test suite

**Skills Demonstrated:** Data hazards, control hazards, forwarding, stalling, pipeline flushing

---

## Technical Skills Demonstrated

| Category | Technologies |
|----------|-------------|
| **Languages** | SystemVerilog, Verilog, Schematic Design |
| **Tools** | Intel Quartus Prime, ModelSim, RISC-V Toolchain |
| **Concepts** | Combinational Logic, Sequential Logic, FSMs, Processor Architecture |
| **Techniques** | K-maps, Boolean Algebra, Pipelining, Hazard Resolution |
| **Architecture** | RISC-V RV32I, Single-Cycle, 5-Stage Pipeline |
