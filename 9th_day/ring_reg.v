module ring_reg (
    clk,rst,Q
);

    input clk,rst;
    output reg [3:0]Q;

    always @(posedge clk) begin
        if (rst) begin
            Q<=4'b1000;        
        end
        else begin
            Q<= {Q[0],Q[3:1]};
        end
        
    end

    
    
endmodule