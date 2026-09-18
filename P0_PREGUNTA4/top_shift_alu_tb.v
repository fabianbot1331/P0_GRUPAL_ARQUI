`timescale 1ns / 1ps

module top_shift_alu_tb;

    reg  [4:0] A;
    reg  [4:0] B;
    reg  [1:0] bshift;
    reg  [2:0] ALUControl;

    wire [4:0] Result;
    wire [3:0] ALUFlags;

    top_shift_alu dut (
        .A(A),
        .B(B),
        .bshift(bshift),
        .ALUControl(ALUControl),
        .Result(Result),
        .ALUFlags(ALUFlags)
    );

    initial begin

        B = 5'd0;
        ALUControl = 3'b000;

        A = 5'd3;
        bshift = 2'b00;
        #10;

        A = 5'd3;
        bshift = 2'b01;
        #10;

        A = 5'd3;
        bshift = 2'b10;
        #10;

        A = 5'd3;
        bshift = 2'b11;
        #10;

        $finish;
    end

endmodule
