// aes_round.v
module aes_round(
    input wire [127:0] data_in,
    input wire [127:0] key,
    output wire [127:0] data_out
);
    // Simplified AES: Just XOR plaintext with key
    assign data_out = data_in ^ key;
endmodule
