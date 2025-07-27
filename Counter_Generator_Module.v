// counter_gen.v
module counter_gen(
    input wire clk,
    input wire rst,
    input wire enable,
    input wire [127:0] iv,
    output reg [127:0] counter_out
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            counter_out <= iv;
        else if (enable)
            counter_out <= counter_out + 1;
    end
endmodule
