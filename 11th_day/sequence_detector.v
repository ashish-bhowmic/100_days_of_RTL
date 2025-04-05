module sequence_detector (
    clk, rst, in, detect
);
    input clk, rst, in;
    output reg detect;

    reg [2:0] state,next_state;
    localparam  s0 = 3'b000,  // Initial state (waiting for '1')
                s1 = 3'b001,  // After '1'
                s2 = 3'b010,  // After '10'
                s3 = 3'b011,  // After '100'
                s4 = 3'b100;  // After '1001' (detection state)

    // State update process
    always @(posedge clk) begin
        if (rst) begin
            state <= s0;
            detect <= 0;
        end else begin
            state <= next_state;
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            s0: next_state = (in == 1) ? s1 : s0;  // From s0, on '1' go to s1
            s1: next_state = (in == 0) ? s2 : s1;  // From s1, on '0' go to s2
            s2: next_state = (in == 0) ? s3 : s1;  // From s2, on '0' go to s3, else go back to s1
            s3: next_state = (in == 1) ? s4 : s0;  // From s3, on '1' go to s4 (detection), else reset to s0
            s4: next_state = (in == 1) ? s1 : s0;  // From s4, on '1' go back to s1, on '0' reset to s0
            default: next_state = s0;  // Default state (reset to s0)
        endcase
    end

    // Detection logic (set detect signal when the sequence '1001' is detected)
    always @(posedge clk) begin
        if (state == s4) begin
            detect <= 1'b1;  // Sequence '1001' detected
        end else begin
            detect <= 1'b0;  // Reset detect when not in state s4
        end
    end
endmodule
