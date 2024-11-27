# ICS3203-CAT2-Assembly-NickHesbourneAgong-151952

This repository contains the solutions for CAT 2 of ICS3203 in Assembly language. The tasks showcase various assembly programming concepts including control flow, array manipulation, subroutines, and port-based simulations.

## Table of Contents
1. [Control Flow and Conditional Logic](#control-flow-and-conditional-logic)
2. [Array Manipulation with Looping and Reversal](#array-manipulation-with-looping-and-reversal)
3. [Modular Program with Subroutines for Factorial Calculation](#modular-program-with-subroutines-for-factorial-calculation)
4. [Data Monitoring and Control Using Port-Based Simulation](#data-monitoring-and-control-using-port-based-simulation)
5. [Compilation and Execution](#compilation-and-execution)
6. [Insights and Challenges](#insights-and-challenges)

---

### 1. Control Flow and Conditional Logic
**Purpose:**  
This program prompts the user for a number and classifies it as **POSITIVE**, **NEGATIVE**, or **ZERO** using conditional and unconditional jumps.

**Key Features:**
- Input conversion from string to integer.
- Conditional jumps (`jg`, `jl`) for positive and negative numbers.
- Unconditional jumps (`jmp`) to manage program flow.

---

### 2. Array Manipulation with Looping and Reversal
**Purpose:**  
The program accepts an array of integers (e.g., five values) and reverses the array in place, demonstrating in-memory manipulation.

**Key Features:**
- User input parsing and validation.
- Reversal using a two-pointer approach without additional memory.
- Outputs the reversed array to the console.

---

### 3. Modular Program with Subroutines for Factorial Calculation
**Purpose:**  
This program calculates the factorial of a given number using a subroutine to demonstrate modular programming with stack management.

**Key Features:**
- Factorial computation with recursive-like looping.
- Stack usage for preserving registers.
- Result conversion from integer to ASCII for display.

---

### 4. Data Monitoring and Control Using Port-Based Simulation
**Purpose:**  
Simulates a sensor monitoring system that performs actions based on sensor input levels.

**Key Features:**
- Reads sensor values to determine water levels.
- Actions include toggling a motor and an alarm system.
- Uses memory-mapped I/O for motor and alarm statuses.

---

### 5. Compilation and Execution

#### Prerequisites
- NASM (Netwide Assembler)
- Ubuntu or a Linux environment for execution.

#### Compilation Steps
For each program, execute the following commands in the terminal:

1. Assemble the program:
   ```bash
   nasm -f elf64 <filename.asm> -o <filename.o>

2. Link the object file:
   ld <filename.o> -o <output>

3. Run the executable:
   ./<output>



### 6. Insights and Challenges

**Control Flow and Conditional Logic**
 Using both conditional and unconditional jumps streamlined program flow.

 Parsing input efficiently while managing invalid inputs.

 **Array Manipulation with Looping and Reversal**
 Leveraged direct memory manipulation to reverse arrays in place.
 Ensuring index boundaries were respected during reversal.

 **Modular Program with Subroutines for Factorial Calculation**
 Modular code improved readability and reusability.
  Managing registers and stack pointers to avoid data corruption.

  **Data Monitoring and Control Using Port-Based Simulation**
  Simulating I/O operations demonstrated the power of low-level programming.
  Designing the decision-making logic to handle all sensor input scenarios.

  ### 7. Author
  Nick Hesbourne Agon'g
Strathmore University
ICS3203 - Assembly Language Programming