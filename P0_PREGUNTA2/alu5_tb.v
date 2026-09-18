`timescale 1ns / 1ps

module alu5_tb;

    reg  [4:0] A;
    reg  [4:0] B;
    reg  [1:0] ALUControl;

    wire [4:0] Result;
    wire [3:0] ALUFlags;

    alu5 dut (
        .A(A),
        .B(B),
        .ALUControl(ALUControl),
        .Result(Result),
        .ALUFlags(ALUFlags)
    );

    initial begin

        A = 5'd3;
        B = 5'd5;
        ALUControl = 2'b00;
        #10;

        // 2. 5 - 5 = 0
        A = 5'd5;
        B = 5'd5;
        ALUControl = 2'b01;
        #10;

        A = 5'd8;
        B = 5'd1;
        ALUControl = 2'b10;
        #10;

        A = 5'd5;
        B = 5'd7;
        ALUControl = 2'b11;
        #10;

        $finish;
    end

endmodule
