`timescale 1ns / 1ps

module shift_left (
    input  wire [4:0] A,
    input  wire [1:0] bshift,
    output wire [4:0] A_desplazado
);

    assign A_desplazado = A << bshift;

endmodule
