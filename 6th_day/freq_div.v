module freq_div (
    clk,clk_out,rst
);

input clk,rst;
output reg clk_out;
reg [3:0]count;
parameter div = 10; 

always @(posedge clk or negedge rst) begin

    if (!rst) begin
        count <= 0;
        clk_out <= 0;
    end
    else if (count ==(div/2 -1)) begin
        clk_out <=~clk_out;
        count <= 0;
    end
    else begin
        count <=count +1;
    end
    
end
    
endmodule