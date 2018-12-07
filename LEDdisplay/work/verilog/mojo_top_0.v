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
  
  localparam GEN_BOTROWS = 32'h0f800f80;
  
  reg [223:0] gen_topcols;
  
  integer i;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [32-1:0] M_generator_bottom_rowsout;
  reg [1-1:0] M_generator_bottom_button_l;
  reg [1-1:0] M_generator_bottom_button_r;
  reg [32-1:0] M_generator_bottom_rows;
  generator_bottom_2 generator_bottom (
    .clk(clk),
    .rst(rst),
    .button_l(M_generator_bottom_button_l),
    .button_r(M_generator_bottom_button_r),
    .rows(M_generator_bottom_rows),
    .rowsout(M_generator_bottom_rowsout)
  );
  wire [224-1:0] M_generator_top_colsout;
  reg [224-1:0] M_generator_top_cols;
  generator_top_3 generator_top (
    .clk(clk),
    .rst(rst),
    .cols(M_generator_top_cols),
    .colsout(M_generator_top_colsout)
  );
  wire [1-1:0] M_check_changescore;
  reg [224-1:0] M_check_cols;
  reg [32-1:0] M_check_rows;
  check_4 check (
    .clk(clk),
    .rst(rst),
    .cols(M_check_cols),
    .rows(M_check_rows),
    .changescore(M_check_changescore)
  );
  reg [29:0] M_normclock_d, M_normclock_q = 1'h0;
  wire [5-1:0] M_regscore_out;
  reg [1-1:0] M_regscore_en;
  reg [5-1:0] M_regscore_data;
  registerScore_5 regscore (
    .clk(clk),
    .rst(rst),
    .en(M_regscore_en),
    .data(M_regscore_data),
    .out(M_regscore_out)
  );
  wire [224-1:0] M_registerCols_out;
  reg [1-1:0] M_registerCols_en;
  reg [224-1:0] M_registerCols_data;
  registerCols_6 registerCols (
    .clk(clk),
    .rst(rst),
    .en(M_registerCols_en),
    .data(M_registerCols_data),
    .out(M_registerCols_out)
  );
  wire [6-1:0] M_check_for_cols_out;
  reg [1-1:0] M_check_for_cols_en;
  reg [6-1:0] M_check_for_cols_data;
  registerChecker_7 check_for_cols (
    .clk(clk),
    .rst(rst),
    .en(M_check_for_cols_en),
    .data(M_check_for_cols_data),
    .out(M_check_for_cols_out)
  );
  wire [1-1:0] M_slowclock_value;
  counter_8 slowclock (
    .clk(clk),
    .rst(rst),
    .value(M_slowclock_value)
  );
  wire [16-1:0] M_ld_a;
  wire [16-1:0] M_ld_c;
  reg [256-1:0] M_ld_pattern;
  led_matrix_9 ld (
    .clk(clk),
    .rst(rst),
    .pattern(M_ld_pattern),
    .a(M_ld_a),
    .c(M_ld_c)
  );
  localparam IDLE_gamefsm = 3'd0;
  localparam INIT_STAGE_gamefsm = 3'd1;
  localparam CHECK_MOVE_gamefsm = 3'd2;
  localparam CHECK_SCORE_gamefsm = 3'd3;
  localparam TEST_SCORE_gamefsm = 3'd4;
  localparam TEST_NEXT_gamefsm = 3'd5;
  
  reg [2:0] M_gamefsm_d, M_gamefsm_q = INIT_STAGE_gamefsm;
  wire [256-1:0] M_led_converter_out;
  reg [224-1:0] M_led_converter_cols;
  reg [32-1:0] M_led_converter_rows;
  leddisplay_10 led_converter (
    .clk(clk),
    .rst(rst),
    .cols(M_led_converter_cols),
    .rows(M_led_converter_rows),
    .out(M_led_converter_out)
  );
  wire [224-1:0] M_nextLevel_colsout;
  reg [6-1:0] M_nextLevel_level;
  levels_11 nextLevel (
    .clk(clk),
    .rst(rst),
    .level(M_nextLevel_level),
    .colsout(M_nextLevel_colsout)
  );
  
  wire [1-1:0] M_edge_start_out;
  reg [1-1:0] M_edge_start_in;
  edge_detector_12 edge_start (
    .clk(M_slowclock_value),
    .in(M_edge_start_in),
    .out(M_edge_start_out)
  );
  
  reg start;
  
  reg [5:0] z;
  
  always @* begin
    M_gamefsm_d = M_gamefsm_q;
    M_normclock_d = M_normclock_q;
    
    M_regscore_en = 1'h0;
    M_regscore_data = 1'h0;
    M_registerCols_en = 1'h0;
    M_check_for_cols_en = 1'h0;
    M_check_for_cols_data = 1'h0;
    M_nextLevel_level = 1'h0;
    M_registerCols_data = M_nextLevel_colsout;
    M_edge_start_in = M_slowclock_value;
    io_seg = 8'hff;
    a = 16'h0000;
    c = 16'h0000;
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    M_generator_bottom_button_l = button_l;
    M_generator_bottom_button_r = button_r;
    M_generator_bottom_rows = 32'h0f800f80;
    M_led_converter_rows = ~M_generator_bottom_rowsout;
    for (i = 1'h0; i < 5'h10; i = i + 1) begin
      gen_topcols[(i)*14+13-:14] = 14'h0000;
    end
    M_registerCols_data = gen_topcols;
    M_generator_top_cols = gen_topcols;
    M_led_converter_cols = ~M_generator_top_colsout;
    M_ld_pattern = M_led_converter_out;
    M_check_cols = M_nextLevel_colsout;
    M_check_rows = M_generator_bottom_rowsout;
    M_regscore_en = 1'h0;
    M_regscore_data = 1'h0;
    M_generator_bottom_button_l = button_l;
    M_generator_bottom_button_r = button_r;
    M_normclock_d = M_normclock_q + 1'h1;
    a = M_ld_a;
    c = M_ld_c;
    
    case (M_gamefsm_q)
      INIT_STAGE_gamefsm: begin
        led = 8'h02;
        M_generator_bottom_rows = 32'h0f800f80;
        M_led_converter_rows = M_generator_bottom_rowsout;
        led = 8'h04;
        for (i = 1'h0; i < 5'h10; i = i + 1) begin
          gen_topcols[(i)*14+13-:14] = 14'h3fff;
        end
        M_generator_top_cols = gen_topcols;
        M_led_converter_rows = M_generator_bottom_rowsout;
        M_registerCols_en = 1'h1;
        M_registerCols_data = M_generator_top_colsout;
        M_led_converter_cols = M_registerCols_out;
        M_ld_pattern = M_led_converter_out;
        a = M_ld_a;
        c = M_ld_c;
        M_generator_bottom_button_l = button_l;
        M_generator_bottom_button_r = button_r;
        M_gamefsm_d = CHECK_MOVE_gamefsm;
      end
      CHECK_MOVE_gamefsm: begin
        M_generator_top_cols = M_registerCols_out;
        M_registerCols_en = 1'h1;
        M_registerCols_data = M_generator_top_colsout;
        M_gamefsm_d = CHECK_MOVE_gamefsm;
      end
      CHECK_SCORE_gamefsm: begin
        M_check_cols = M_registerCols_out;
        M_check_rows = M_generator_bottom_rowsout;
        if (M_check_changescore == 1'h1) begin
          M_regscore_en = 1'h1;
          M_regscore_data = M_regscore_out + 1'h1;
        end
        M_gamefsm_d = CHECK_MOVE_gamefsm;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_normclock_q <= 1'h0;
      M_gamefsm_q <= 1'h1;
    end else begin
      M_normclock_q <= M_normclock_d;
      M_gamefsm_q <= M_gamefsm_d;
    end
  end
  
endmodule
