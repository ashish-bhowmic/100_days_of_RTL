module sync_fifo (
    input clk,rst,read,write,
    input [7:0]data_in,
    output reg [7:0]data_out, 
    output reg full,empty
);
parameter depth = 8;
localparam address_bit = $clog2(depth);
reg [7:0]mem[0:depth-1];
reg [address_bit-1:0]read_pointer,write_pointer;
reg [address_bit:0]count;

always @(posedge clk) begin
    if (rst) begin
        data_out <=0;
        read_pointer <=0;
        write_pointer <= 0;
        empty = 1;
        full =0;
        count =0;
        for (integer i =0 ;i<depth ;i =i+1 ) begin
            mem[i] <=8'b0;
        end
    end
    else begin
        if (write && !full) begin
            mem[write_pointer] <= data_in;
            write_pointer <= write_pointer +1;
            if (write_pointer==depth) begin
                write_pointer <=0;
            end
            count <=count +1;
        end
        if (read && !empty) begin
            data_out <= mem[read_pointer];
            read_pointer <= read_pointer +1;
            if (read_pointer == depth) begin    
                read_pointer <= 0;
            end
            count <= count -1;
        end
        if (count ==depth) begin
            full <=1;
        end else begin
            full <= 1'b0;
        end

        if (count==0) begin
            empty <= 1;
        end
        else begin
            empty <=0;
        end

    end
    
end

    
endmodule