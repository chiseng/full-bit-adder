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
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip,
    output reg a,
    output reg b,
    output reg cin,
    input s,
    input cout
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_start_stop_edge_out;
  reg [1-1:0] M_start_stop_edge_in;
  edge_detector_2 start_stop_edge (
    .clk(clk),
    .in(M_start_stop_edge_in),
    .out(M_start_stop_edge_out)
  );
  wire [1-1:0] M_start_stop_button_out;
  reg [1-1:0] M_start_stop_button_in;
  button_conditioner_3 start_stop_button (
    .clk(clk),
    .in(M_start_stop_button_in),
    .out(M_start_stop_button_out)
  );
  wire [1-1:0] M_reset_button_out;
  reg [1-1:0] M_reset_button_in;
  button_conditioner_3 reset_button (
    .clk(clk),
    .in(M_reset_button_in),
    .out(M_reset_button_out)
  );
  wire [1-1:0] M_manual_mode_out;
  reg [1-1:0] M_manual_mode_in;
  button_conditioner_3 manual_mode (
    .clk(clk),
    .in(M_manual_mode_in),
    .out(M_manual_mode_out)
  );
  wire [7-1:0] M_seg_segs;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_value;
  multi_seven_seg_6 seg (
    .clk(clk),
    .rst(rst),
    .value(M_seg_value),
    .segs(M_seg_segs),
    .sel(M_seg_sel)
  );
  wire [4-1:0] M_newfsm_seg_1;
  wire [4-1:0] M_newfsm_seg_2;
  wire [4-1:0] M_newfsm_seg_3;
  wire [4-1:0] M_newfsm_seg_4;
  wire [1-1:0] M_newfsm_a;
  wire [1-1:0] M_newfsm_b;
  wire [1-1:0] M_newfsm_cin;
  wire [8-1:0] M_newfsm_testcase;
  reg [1-1:0] M_newfsm_s;
  reg [1-1:0] M_newfsm_cout;
  reg [1-1:0] M_newfsm_start_stop;
  reg [1-1:0] M_newfsm_reset;
  reg [1-1:0] M_newfsm_manual;
  f_s_m_7 newfsm (
    .clk(clk),
    .rst(rst),
    .s(M_newfsm_s),
    .cout(M_newfsm_cout),
    .start_stop(M_newfsm_start_stop),
    .reset(M_newfsm_reset),
    .manual(M_newfsm_manual),
    .seg_1(M_newfsm_seg_1),
    .seg_2(M_newfsm_seg_2),
    .seg_3(M_newfsm_seg_3),
    .seg_4(M_newfsm_seg_4),
    .a(M_newfsm_a),
    .b(M_newfsm_b),
    .cin(M_newfsm_cin),
    .testcase(M_newfsm_testcase)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = ~M_seg_segs;
    io_sel = ~M_seg_sel;
    rst = M_reset_button_out;
    M_seg_value = {M_newfsm_seg_1, M_newfsm_seg_2, M_newfsm_seg_3, M_newfsm_seg_4};
    M_start_stop_button_in = io_button[1+0-:1];
    M_start_stop_edge_in = M_start_stop_button_out;
    M_newfsm_start_stop = M_start_stop_edge_out;
    M_manual_mode_in = io_button[4+0-:1];
    M_newfsm_manual = M_manual_mode_out;
    M_reset_button_in = io_button[3+0-:1];
    M_newfsm_reset = M_reset_button_out;
    M_newfsm_s = s;
    M_newfsm_cout = cout;
    a = M_newfsm_a;
    b = M_newfsm_b;
    cin = M_newfsm_cin;
    io_led[0+7-:8] = M_newfsm_testcase;
    if (io_dip[0+0+0-:1]) begin
      M_seg_value = 16'h4662;
      a = io_dip[8+0+0-:1];
      b = io_dip[8+1+0-:1];
      cin = io_dip[8+2+0-:1];
      io_led[8+0+0-:1] = s;
      io_led[8+1+0-:1] = cout;
    end
  end
endmodule
