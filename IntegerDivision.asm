@R1              // Load the address of R1 into the A register
D=M              // D = M[R1], i.e., the value stored at R1
@DIVIDE_BY_ZERO  // Define label DIVIDE_BY_ZERO for division by zero handling
D;JEQ            // Jump to DIVIDE_BY_ZERO if D == 0 (i.e., division by zero)
 
@R0
D=M
@R5
M=0
@SKIP_R0_NEG     // Define label SKIP_R0_NEG for negative R0 handling
D;JGE
@R5
M=1
(SKIP_R0_NEG)   // Label SKIP_R0_NEG
@R0
D=M
@ABS_R0
M=D
@SKIP_R0_ABS
D;JGE
@ABS_R0
M=-D
(SKIP_R0_ABS)
 
@R1
D=M
@R6
M=0
@SKIP_R1_NEG
D;JGE
@R6
M=1
(SKIP_R1_NEG)
@R1
D=M
@ABS_R1
M=D
@SKIP_R1_ABS
D;JGE
@ABS_R1
M=-D
(SKIP_R1_ABS)
 
@ABS_R0
D=M
@32768
D=D-A
@CHECK_OVERFLOW
D;JEQ
@START_DIVISION
0;JMP
 
(CHECK_OVERFLOW)
@ABS_R1
D=M
@1
D=D-A
@OVERFLOW_ERROR
D;JEQ
@START_DIVISION  
 
(START_DIVISION)
@ABS_R0
D=M
@R3
M=D
@R2
M=0
 
(LOOP)
@ABS_R1
D=M
@R3
D=M-D
@END_LOOP
D;JLT
@ABS_R1
D=M
@R3
M=M-D
@R2
M=M+1
@LOOP
0;JMP
 
(END_LOOP)
@R5
D=M
@R6
D=D-M
@SET_NEGATIVE_QUOTIENT
D;JNE
@SET_REMAINDER_SIGN
0;JMP
 
(SET_NEGATIVE_QUOTIENT)
@R2
M=-M
 
(SET_REMAINDER_SIGN)
@R5
D=M
@SKIP_REMAINDER_NEG
D;JEQ
@R3
M=-M
 
(SKIP_REMAINDER_NEG)
@R4
M=0
@END
0;JMP
 
(DIVIDE_BY_ZERO)
@R2
M=0
@R3
M=0
@R4
M=1
@END
0;JMP
 
(OVERFLOW_ERROR)
@R2
M=0
@R3
M=0
@R4
M=1
@END
0;JMP
 
(END)
@END
0;JMP
 
// SumArrayEntries.asm
// Computes the sum of all entries in an array
// R0: memory address of first array element
// R1: number of elements in array
// R2: final result (sum of array elements)
// R3-R15: can be used as temporary variables
 
// Check if array length is positive
@R1
D=M              // D = array length
@ZERO_RESULT     // If length <= 0, set result to 0
D;JLE
 
// Initialize variables
@R2
M=0              // R2 = sum = 0
@R0  
D=M              // D = base address
@R3
M=D              // R3 = current pointer = base address
@R1
D=M              // D = array length
@R4
M=D              // R4 = counter = array length
 
// Main loop: iterate through array elements
(LOOP)
@R4
D=M              // D = counter
@END_LOOP
D;JEQ            // If counter == 0, exit loop
 
@R3
A=M              // A = current pointer address
D=M              // D = M[current pointer] = current array element
@R2
M=M+D            // sum += current element
 
@R3
M=M+1            // pointer++, move to next element
@R4
M=M-1            // counter--, decrement counter
@LOOP
0;JMP            // Continue loop
 
(END_LOOP)
@END
0;JMP
 
(ZERO_RESULT)
@R2
M=0              // Set result to 0
@END
0;JMP
 
(END)
@END
0;JMP
 
