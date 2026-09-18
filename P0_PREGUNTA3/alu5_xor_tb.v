`timescale 1ns / 1ps

module alu5_xor_tb;

    reg  [4:0] A;
    reg  [4:0] B;
    reg  [2:0] ALUControl;

    wire [4:0] Result;
    wire [3:0] ALUFlags;

    alu5_xor dut (
        .A(A),
        .B(B),
        .ALUControl(ALUControl),
        .Result(Result),
        .ALUFlags(ALUFlags)
    );

    initial begin

        A = 5'd3;
        B = 5'd5;
        ALUControl = 3'b000;
        #10;

        A = 5'd5;
        B = 5'd5;
        ALUControl = 3'b001;
        #10;

        A = 5'd8;
        B = 5'd1;
        ALUControl = 3'b010;
        #10;

        A = 5'd5;
        B = 5'd7;
        ALUControl = 3'b011;
        #10;

        A = 5'd9;
        B = 5'd6;
        ALUControl = 3'b100;
        #10;

        $finish;
    end

endmodule
