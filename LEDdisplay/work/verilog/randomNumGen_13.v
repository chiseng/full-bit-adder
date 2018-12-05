/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module randomNumGen_13 (
    input clk,
    input rst,
    output reg [3:0] out
  );
  
  
  
  reg sclk;
  
  wire [1-1:0] M_slowclk_value;
  counter_22 slowclk (
    .clk(clk),
    .rst(rst),
    .value(M_slowclk_value)
  );
  reg [3:0] M_temp_d, M_temp_q = 1'h0;
  
  wire [32-1:0] M_rng_num;
  reg [1-1:0] M_rng_next;
  reg [32-1:0] M_rng_seed;
  pn_gen_23 rng (
    .clk(clk),
    .rst(rst),
    .next(M_rng_next),
    .seed(M_rng_seed),
    .num(M_rng_num)
  );
  
  always @* begin
    M_temp_d = M_temp_q;
    
    sclk = M_slowclk_value;
    M_rng_seed = 5'h14;
    M_rng_next = 1'h1;
    if (M_slowclk_value == 1'h1) begin
      M_temp_d = M_rng_num[0+3-:4];
    end else begin
      M_temp_d = M_temp_q;
    end
    out = M_temp_q;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_temp_q <= 1'h0;
    end else begin
      M_temp_q <= M_temp_d;
    end
  end
  
endmodule
