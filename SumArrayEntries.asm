// Compute the sum of all entries in an array
// R0 = base address of array
// R1 = number of elements
// R2 = sum of elements (output)

// Initialize sum to 0
@R2
M=0        

// Check if R1 (size) is <= 0
@R1
D=M       
@END        
D;JLE      // If size <= 0, skip computation

// Initialize loop counter
@R1
D=M        
@COUNTER
M=D        // Store counter in R3

@R0
D=M        
@ADDR
M=D        // Store base address in R4

(LOOP)
@COUNTER
D=M        
@END        
D;JEQ      // If counter == 0, exit loop

// Load array entry
@ADDR
A=M        
D=M        

// Add entry to sum
@R2
M=M+D      

// Move to next entry
@ADDR
M=M+1      

// Decrement counter
@COUNTER
M=M-1      
@LOOP
0;JMP      

(END)
@END
0;JMP      // Infinite loop to halt