// gcm_engine.v
module gcm_engine(
    input wire clk,
    input wire rst,
    input wire start,
    input wire [127:0] key,
    input wire [127:0] iv,
    input wire [127:0] plaintext,
    output reg [127:0] ciphertext,
    output reg [127:0] auth_tag,
    output reg done
);

    reg enable_counter;
    wire [127:0] counter_value;
    wire [127:0] aes_out;
    wire [127:0] auth_tag_out;

    // Instantiate counter
    counter_gen counter_inst(
        .clk(clk),
        .rst(rst),
        .enable(enable_counter),
        .iv(iv),
        .counter_out(counter_value)
    );

    // Instantiate AES round
    aes_round aes_inst(
        .data_in(counter_value),
        .key(key),
        .data_out(aes_out)
    );

    // Instantiate GCM authentication tag generator
    gcm_auth_tag auth_inst(
        .ciphertext(aes_out),
        .counter_value(counter_value),
        .auth_tag(auth_tag_out)
    );

    reg [2:0] state;

    localparam IDLE = 3'd0,
               LOAD = 3'd1,
               ENC  = 3'd2,
               AUTH = 3'd3,
               DONE = 3'd4;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            enable_counter <= 0;
            done <= 0;
            ciphertext <= 0;
            auth_tag <= 0;
        end else begin
            case(state)
                IDLE: begin
                    done <= 0;
                    if (start)
                        state <= LOAD;
                end
                LOAD: begin
                    enable_counter <= 1;
                    state <= ENC;
                end
                ENC: begin
                    enable_counter <= 0;
                    ciphertext <= aes_out ^ plaintext;
                    state <= AUTH;
                end
                AUTH: begin
                    auth_tag <= auth_tag_out;
                    state <= DONE;
                end
                DONE: begin
                    done <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end

endmodule
