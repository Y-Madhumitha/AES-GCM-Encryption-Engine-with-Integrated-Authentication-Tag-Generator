// tb_gcm_engine.v
`timescale 1ns/1ps

module tb_gcm_engine();
    reg clk;
    reg rst;
    reg start;
    reg [127:0] key;
    reg [127:0] iv;
    reg [127:0] plaintext;
    wire [127:0] ciphertext;
    wire [127:0] auth_tag;
    wire done;

    gcm_engine uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .key(key),
        .iv(iv),
        .plaintext(plaintext),
        .ciphertext(ciphertext),
        .auth_tag(auth_tag),
        .done(done)
    );

    initial clk = 0;
    always #5 clk = ~clk; // 100MHz clock

    initial begin
        rst = 1;
        start = 0;
        key = 0;
        iv = 0;
        plaintext = 0;
        #20;
        
        rst = 0;
        key = 128'h2b7e151628aed2a6abf7158809cf4f3c; // example key
        iv = 128'h000102030405060708090a0b0c0d0e0f;  // example IV
        plaintext = 128'h6bc1bee22e409f96e93d7e117393172a; // example plaintext
        #10;
        start = 1;
        #10;
        start = 0;

        wait(done);
        #100;
        $finish;
    end
endmodule
