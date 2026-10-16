`timescale 1ns/1ps
// 안정된 HIGH 활성 키 하나를 8개 음의 주파수로 변환한다.
module note_select(input wire [7:0] key, output reg [31:0] frequency_hz);
    always @* begin
        case(key)
            8'h80: frequency_hz=262;
            8'h40: frequency_hz=294;
            8'h20: frequency_hz=330;
            8'h10: frequency_hz=349;
            8'h08: frequency_hz=392;
            8'h04: frequency_hz=440;
            8'h02: frequency_hz=494;
            8'h01: frequency_hz=523;
            default: frequency_hz=0;
        endcase
    end
endmodule
