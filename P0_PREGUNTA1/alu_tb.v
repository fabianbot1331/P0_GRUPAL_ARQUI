`timescale 1ns / 1ps

module alu_tb;

    reg [31:0] a, b;
    reg [1:0] ALUControl;

    wire [31:0] Result;
    wire [3:0] ALUFlags;

    alu uut (
        .a(a),
        .b(b),
        .ALUControl(ALUControl),
        .Result(Result),
        .ALUFlags(ALUFlags)
    );

    initial begin

        // 3 + 5
        a = 32'd3;
        b = 32'd5;
        ALUControl = 2'b00;
        #10;

        // 5 - 5
        a = 32'd5;
        b = 32'd5;
        ALUControl = 2'b01;
        #10;

        // 8 AND 1
        a = 32'd8;
        b = 32'd1;
        ALUControl = 2'b10;
        #10;

        // 5 OR 7
        a = 32'd5;
        b = 32'd7;
        ALUControl = 2'b11;
        #10;

        $finish;

    end

endmodule
