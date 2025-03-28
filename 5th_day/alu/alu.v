module alu (
    a,b,sel,carry, result,borrow
);

input [3:0]a,b;
input [2:0] sel;

output reg [3:0] result;
output reg carry,borrow;

always @(*) begin
    case (sel) 
        3'b000: {carry,result}= a+b; // Addition 
        3'b001: {borrow,result}= a-b; //subtraction
        3'b010: result= a&b; //AND
        3'b011: result= a|b; //OR
        3'b100: result= a^b; //XOR
        3'b101: result= a&&b; // Logical AND
        3'b110: result= a||b; // Logical OR
    
        default: 
            result = 4'b0000; //Default ZERO
        
    endcase
end


    
endmodule