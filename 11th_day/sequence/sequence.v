module sequence (
    clk,rst,in,detected
);
    input rst,clk,in;
    output reg detected;

    parameter s0 = 3'b000,
              s1 = 3'b001,
              s2 = 3'b011,
              s3 = 3'b110,
              s4 = 3'b111;

    reg [2:0]state, next_state;
    always @(posedge clk) begin

        if (rst) begin
            state <= s0;
            detected <=0;
            
        end
        else begin
            state <= next_state;
        end
        
    end

    always @(*) begin
        case (state)
            s0: next_state = (in==1)?s1:s0; 
            s1: next_state = (in==1)?s2:s0; 
            s2: next_state = (in==0)?s3:s1; 
            s3: next_state = (in==1)?s4:s0; 
            s4: next_state = (in==1)?s1:s0; 
            default: next_state = s0;
        endcase
    end

    always @(posedge clk) begin
        if (state==s4) begin
            detected <= 1'b1;
        end
        else begin
            detected <= 1'b0;
        end
    end


endmodule