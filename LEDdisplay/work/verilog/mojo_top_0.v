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
    input button_onoff,
    input button_l,
    input button_r,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [7:0] io_seg,
    input [4:0] io_button,
    output reg [15:0] a,
    output reg [15:0] c,
    input button2
  );
  
  
  
  reg rst;
  
  reg [31:0] gen_botrows;
  
  reg [223:0] gen_topcols;
  
  integer i;
  
  
  localparam IDLE_gamefsm = 2'd0;
  localparam STAGE1_START_gamefsm = 2'd1;
  localparam STAGE1_gamefsm = 2'd2;
  
  reg [1:0] M_gamefsm_d, M_gamefsm_q = STAGE1_START_gamefsm;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_button_start_out;
  reg [1-1:0] M_button_start_in;
  button_conditioner_2 button_start (
    .clk(clk),
    .in(M_button_start_in),
    .out(M_button_start_out)
  );
  wire [32-1:0] M_generator_bottom_rowsout;
  wire [8-1:0] M_generator_bottom_led;
  reg [1-1:0] M_generator_bottom_button_l;
  reg [1-1:0] M_generator_bottom_button_r;
  reg [32-1:0] M_generator_bottom_rows;
  generator_bottom_3 generator_bottom (
    .clk(clk),
    .rst(rst),
    .button_l(M_generator_bottom_button_l),
    .button_r(M_generator_bottom_button_r),
    .rows(M_generator_bottom_rows),
    .rowsout(M_generator_bottom_rowsout),
    .led(M_generator_bottom_led)
  );
  wire [224-1:0] M_generator_top_colsout;
  reg [224-1:0] M_generator_top_cols;
  generator_top_4 generator_top (
    .clk(clk),
    .rst(rst),
    .cols(M_generator_top_cols),
    .colsout(M_generator_top_colsout)
  );
  wire [1-1:0] M_check_outscore;
  reg [224-1:0] M_check_cols;
  reg [32-1:0] M_check_rows;
  reg [1-1:0] M_check_score;
  check_5 check (
    .clk(clk),
    .rst(rst),
    .cols(M_check_cols),
    .rows(M_check_rows),
    .score(M_check_score),
    .outscore(M_check_outscore)
  );
  reg M_score_d, M_score_q = 1'h0;
  reg [31:0] M_currentrows_d, M_currentrows_q = 1'h0;
  reg [223:0] M_currentcols_d, M_currentcols_q = 1'h0;
  wire [1-1:0] M_slowclock_value;
  counter_6 slowclock (
    .clk(clk),
    .rst(rst),
    .value(M_slowclock_value)
  );
  wire [16-1:0] M_ld_a;
  wire [16-1:0] M_ld_c;
  reg [256-1:0] M_ld_pattern;
  led_matrix_7 ld (
    .clk(clk),
    .rst(rst),
    .pattern(M_ld_pattern),
    .a(M_ld_a),
    .c(M_ld_c)
  );
  wire [256-1:0] M_led_converter_out;
  reg [224-1:0] M_led_converter_cols;
  reg [32-1:0] M_led_converter_rows;
  leddisplay_8 led_converter (
    .clk(clk),
    .rst(rst),
    .cols(M_led_converter_cols),
    .rows(M_led_converter_rows),
    .out(M_led_converter_out)
  );
  
  localparam ONE_state = 2'd0;
  localparam TWO_state = 2'd1;
  localparam THREE_state = 2'd2;
  
  reg [1:0] M_state_d, M_state_q = ONE_state;
  reg [15:0] M_cSignal_d, M_cSignal_q = 1'h0;
  reg [15:0] M_aSignal_d, M_aSignal_q = 1'h0;
  
  always @* begin
    io_seg = 8'hff;
    a = 16'h0000;
    c = 16'h0000;
    M_button_start_in = io_button[3+0-:1];
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    M_generator_bottom_button_l = button_l;
    M_generator_bottom_button_r = button_r;
    gen_botrows[0+15-:16] = 16'h0700;
    gen_botrows[16+15-:16] = 16'h0700;
    M_generator_bottom_rows = gen_botrows;
    M_led_converter_rows = ~M_generator_bottom_rowsout;
    for (i = 1'h0; i < 5'h10; i = i + 1) begin
      gen_topcols[(i)*14+13-:14] = 14'h0000;
    end
    M_generator_top_cols = gen_topcols;
    M_led_converter_cols = ~M_generator_top_colsout;
    M_ld_pattern = M_led_converter_out;
    M_check_cols = gen_topcols;
    M_check_rows = gen_botrows;
    M_check_score = M_score_q;
    a = M_ld_a;
    c = M_ld_c;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_gamefsm_q <= 1'h1;
    end else begin
      M_gamefsm_q <= M_gamefsm_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_score_q <= 1'h0;
      M_currentrows_q <= 1'h0;
      M_currentcols_q <= 1'h0;
    end else begin
      M_score_q <= M_score_d;
      M_currentrows_q <= M_currentrows_d;
      M_currentcols_q <= M_currentcols_d;
    end
  end
  
  
  always @(posedge M_slowclock_value) begin
    M_state_q <= M_state_d;
    
    if (rst == 1'b1) begin
      M_cSignal_q <= 1'h0;
    end else begin
      M_cSignal_q <= M_cSignal_d;
    end
    
    if (rst == 1'b1) begin
      M_aSignal_q <= 1'h0;
    end else begin
      M_aSignal_q <= M_aSignal_d;
    end
  end
  
endmodule
