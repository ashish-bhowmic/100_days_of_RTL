module pattern_gen (
    input clk,rst,
    output  [7:0] out
);

reg [2:0]count;
reg [7:0]a,c;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <=3'b000;
        a <= {4'd1,4'd0};
        c <= {4'd0,4'd1};
        
    end
    else begin
        count <= count+1;
        if (count) begin
            a<= {a[6:4],a[7],a[3:0]};
        end
    end
    
end
assign out = (count)? a:c;

endmodule