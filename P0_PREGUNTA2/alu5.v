`timescale 1ns / 1ps

module alu5(
    input  wire [4:0] A,
    input  wire [4:0] B,
    input  wire [1:0] ALUControl,
    output reg  [4:0] Result,
    output wire [3:0] ALUFlags
);

    wire [4:0] condinvb;
    wire [5:0] sum;
    wire neg, zero, carry, overflow;

    assign condinvb = ALUControl[0] ? ~B : B;
    assign sum = {1'b0, A} + {1'b0, condinvb} + ALUControl[0];

    always @(*) begin
        case (ALUControl)
            2'b00: Result = sum[4:0];
            2'b01: Result = sum[4:0];
            2'b10: Result = A & B;
            2'b11: Result = A | B;
            default: Result = 5'b00000;
        endcase
    end

    assign neg = Result[4];
    assign zero = (Result == 5'b00000);

    assign carry = ~ALUControl[1] & sum[5];

    assign overflow = ~ALUControl[1] &
                      ~(A[4] ^ B[4] ^ ALUControl[0]) &
                      (A[4] ^ sum[4]);

    assign ALUFlags = {neg, zero, carry, overflow};

endmodule
