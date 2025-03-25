module priority_encoder (
    input [7:0]in,
    output reg [2:0]out
);

always @(*) begin
    if (in[7]) begin
        out = 3'b111;
    end
    else if (in[6]) begin
        out = 3'b110;
    end
    else if (in[5]) begin
        out = 3'b101;
    end
    else if (in[4]) begin
        out = 3'b100;
    end
    else if (in[3]) begin
        out = 3'b011;
    end
    else if (in[2]) begin
        out = 3'b010;
    end
    else if (in[1]) begin
        out = 3'b001;
    end
    else  begin
        out = 3'b000;
    end
end



    
endmodule