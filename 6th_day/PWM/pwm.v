module pwm (
    clk,rst,pwm_out,duty_cycle
);
input clk,rst;
output reg pwm_out;
input [7:0] duty_cycle;
reg [7:0] counter;



always @(posedge clk or negedge rst) begin
    if (!rst) begin
        counter<=0;
        pwm_out <= 0;
    end
    else begin
        counter <= counter +1;
        if (counter<duty_cycle) begin
            pwm_out <=1'b1;
        end
        else begin
            pwm_out <= 1'b0;
        end
    end
end


endmodule