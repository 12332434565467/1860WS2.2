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
 
