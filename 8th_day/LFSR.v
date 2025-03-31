module LFSR (
    clk,rst,Q
);
    
    input clk,rst;
    output reg [3:0]Q;

    wire D= Q[3]^Q[0];

    always @(posedge clk) begin
        if (rst) begin
            Q[3] <= 1'b1;
            Q[2:0] <= 3'b000;           
        end
        else begin
            Q <= {D,Q[3:1]};
        end      
    end
endmodule