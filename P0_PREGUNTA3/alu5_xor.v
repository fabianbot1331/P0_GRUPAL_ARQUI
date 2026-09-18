`timescale 1ns / 1ps

module alu5_xor (
    input  wire [4:0] A,
    input  wire [4:0] B,
    input  wire [2:0] ALUControl,
    output reg  [4:0] Result,
    output wire [3:0] ALUFlags
);

    wire [4:0] condinvb;
    wire [5:0] sum;
    wire neg, zero, carry, overflow;

    wire is_add;
    wire is_sub;
    wire is_arithmetic;

    assign is_add = (ALUControl == 3'b000);
    assign is_sub = (ALUControl == 3'b001);
    assign is_arithmetic = is_add | is_sub;

    assign condinvb = is_sub ? ~B : B;

    assign sum = {1'b0, A}
               + {1'b0, condinvb}
               + is_sub;

    always @(*) begin
        case (ALUControl)
            3'b000: Result = sum[4:0]; // ADD
            3'b001: Result = sum[4:0]; // SUB
            3'b010: Result = A & B;    // AND
            3'b011: Result = A | B;    // OR
            3'b100: Result = A ^ B;    // XOR
            default: Result = 5'b00000;
        endcase
    end

    assign neg = Result[4];
    assign zero = (Result == 5'b00000);

    assign carry = is_arithmetic & sum[5];

    assign overflow = is_arithmetic &
                      ~(A[4] ^ B[4] ^ is_sub) &
                      (A[4] ^ sum[4]);

    assign ALUFlags = {neg, zero, carry, overflow};

endmodule
