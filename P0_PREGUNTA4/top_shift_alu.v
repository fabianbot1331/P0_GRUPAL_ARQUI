`timescale 1ns / 1ps

module top_shift_alu (
    input  wire [4:0] A,
    input  wire [4:0] B,
    input  wire [1:0] bshift,
    input  wire [2:0] ALUControl,
    output wire [4:0] Result,
    output wire [3:0] ALUFlags
);

    wire [4:0] A_desplazado;

    shift_left shift_unit (
        .A(A),
        .bshift(bshift),
        .A_desplazado(A_desplazado)
    );

    alu5_xor alu_unit (
        .A(A_desplazado),
        .B(B),
        .ALUControl(ALUControl),
        .Result(Result),
        .ALUFlags(ALUFlags)
    );

endmodule
