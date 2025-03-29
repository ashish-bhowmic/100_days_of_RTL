module universal_counter (
    count_out,clk,rst,en,up_down_count,load,load_value
);

input clk,rst,en,up_down_count,load;
input [3:0] load_value;
output reg [3:0]count_out;

always @(posedge clk) begin
    if (rst) begin
        count_out <= 4'b000; //reset the counter to 0.
    end
    else begin
        if (en) begin  //check enable pin.
            if (load) begin
                count_out <= load_value; //load value to count_out.
            end
            else if (up_down_count) begin
                count_out <= count_out +1; // Up counting from load value.
            end
            else begin
                count_out <= count_out -1; // Down counting from load value.
            end
            
        end
    end
    
end
    
endmodule