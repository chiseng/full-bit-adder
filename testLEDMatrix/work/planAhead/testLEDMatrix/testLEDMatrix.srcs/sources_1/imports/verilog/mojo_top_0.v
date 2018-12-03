/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [15:0] a,
    output reg [15:0] c
  );
  
  
  
  reg rst;
  
  reg [255:0] led_pattern;
  
  reg [15:0] tempRows;
  
  reg [15:0] tempColumns;
  
  integer i;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_slowclock_value;
  counter_2 slowclock (
    .clk(clk),
    .rst(rst),
    .value(M_slowclock_value)
  );
  wire [16-1:0] M_ld_a;
  wire [16-1:0] M_ld_c;
  reg [256-1:0] M_ld_pattern;
  led_matrix_3 ld (
    .clk(clk),
    .rst(rst),
    .pattern(M_ld_pattern),
    .a(M_ld_a),
    .c(M_ld_c)
  );
  
  localparam ONE_state = 2'd0;
  localparam TWO_state = 2'd1;
  localparam THREE_state = 2'd2;
  
  reg [1:0] M_state_d, M_state_q = ONE_state;
  reg [15:0] M_cSignal_d, M_cSignal_q = 1'h0;
  reg [15:0] M_aSignal_d, M_aSignal_q = 1'h0;
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    M_ld_pattern[240+15-:16] = 16'h9fff;
    M_ld_pattern[224+15-:16] = 16'h9fff;
    M_ld_pattern[208+15-:16] = 16'h9fff;
    M_ld_pattern[192+15-:16] = 16'h9fff;
    M_ld_pattern[176+15-:16] = 16'h9fff;
    M_ld_pattern[160+15-:16] = 16'h9fff;
    M_ld_pattern[144+15-:16] = 16'h9fff;
    M_ld_pattern[128+15-:16] = 16'h9fff;
    M_ld_pattern[112+15-:16] = 16'h6fff;
    M_ld_pattern[96+15-:16] = 16'h77ff;
    M_ld_pattern[80+15-:16] = 16'h7bff;
    M_ld_pattern[64+15-:16] = 16'h7dff;
    M_ld_pattern[48+15-:16] = 16'h7eff;
    M_ld_pattern[32+15-:16] = 16'h7f7f;
    M_ld_pattern[16+15-:16] = 16'h7fbf;
    M_ld_pattern[0+15-:16] = 16'h7fdf;
    a = M_ld_a;
    c = M_ld_c;
  end
  
  always @(posedge M_slowclock_value) begin
    if (rst == 1'b1) begin
      M_cSignal_q <= 1'h0;
    end else begin
      M_cSignal_q <= M_cSignal_d;
    end
    
    M_state_q <= M_state_d;
    
    if (rst == 1'b1) begin
      M_aSignal_q <= 1'h0;
    end else begin
      M_aSignal_q <= M_aSignal_d;
    end
  end
  
endmodule