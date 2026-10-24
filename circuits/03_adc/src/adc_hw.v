`timescale 1ns/1ps
// Hardware top: hides simulation/debug-only sample and data_valid ports.
module adc_hw #(
    parameter HALF_CYCLES = 25
)(
    input  wire       clk_50mhz,
    input  wire       rst_p,
    input  wire [2:0] add_sel,
    output wire       adc_sclk,
    output wire       adc_ncs,
    output wire       adc_din,
    input  wire       adc_dout,
    output wire [7:0] led_out
);
    wire [11:0] sample_unused;
    wire data_valid_unused;

    adc #(.HALF_CYCLES(HALF_CYCLES)) u_adc (
        .clk_50mhz(clk_50mhz),
        .rst_p(rst_p),
        .add_sel(add_sel),
        .adc_sclk(adc_sclk),
        .adc_ncs(adc_ncs),
        .adc_din(adc_din),
        .adc_dout(adc_dout),
        .sample(sample_unused),
        .data_valid(data_valid_unused),
        .led_out(led_out)
    );
endmodule