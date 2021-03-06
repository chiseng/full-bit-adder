/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module led_matrix_9 (
    input clk,
    input rst,
    input [255:0] pattern,
    output reg [15:0] a,
    output reg [15:0] c
  );
  
  
  
  wire [4-1:0] M_slowclock_value;
  counter_22 slowclock (
    .clk(clk),
    .rst(rst),
    .value(M_slowclock_value)
  );
  reg [15:0] M_cSignal_d, M_cSignal_q = 1'h0;
  reg [15:0] M_aSignal_d, M_aSignal_q = 1'h0;
  
  always @* begin
    M_cSignal_d = M_cSignal_q;
    M_aSignal_d = M_aSignal_q;
    
    a = pattern[(M_slowclock_value)*16+15-:16];
    c = 16'hffff;
    M_aSignal_d = 16'h0000;
    M_cSignal_d = 16'hffff;
    
    case (M_slowclock_value)
      1'h0: begin
        M_aSignal_d = pattern[(M_slowclock_value)*16+15-:16];
        M_cSignal_d = 16'h0001;
      end
      1'h1: begin
        M_aSignal_d = pattern[(M_slowclock_value)*16+15-:16];
        M_cSignal_d = 16'h0002;
      end
      2'h2: begin
        M_aSignal_d = pattern[(M_slowclock_value)*16+15-:16];
        M_cSignal_d = 16'h0004;
      end
      2'h3: begin
        M_aSignal_d = pattern[(M_slowclock_value)*16+15-:16];
        M_cSignal_d = 16'h0008;
      end
      3'h4: begin
        M_aSignal_d = pattern[(M_slowclock_value)*16+15-:16];
        M_cSignal_d = 16'h0010;
      end
      3'h5: begin
        M_aSignal_d = pattern[(M_slowclock_value)*16+15-:16];
        M_cSignal_d = 16'h0020;
      end
      3'h6: begin
        M_aSignal_d = pattern[(M_slowclock_value)*16+15-:16];
        M_cSignal_d = 16'h0040;
      end
      3'h7: begin
        M_aSignal_d = pattern[(M_slowclock_value)*16+15-:16];
        M_cSignal_d = 16'h0080;
      end
      4'h8: begin
        M_aSignal_d = pattern[(M_slowclock_value)*16+15-:16];
        M_cSignal_d = 16'h0100;
      end
      4'h9: begin
        M_aSignal_d = pattern[(M_slowclock_value)*16+15-:16];
        M_cSignal_d = 16'h0200;
      end
      4'ha: begin
        M_aSignal_d = pattern[(M_slowclock_value)*16+15-:16];
        M_cSignal_d = 16'h0400;
      end
      4'hb: begin
        M_aSignal_d = pattern[(M_slowclock_value)*16+15-:16];
        M_cSignal_d = 16'h0800;
      end
      4'hc: begin
        M_aSignal_d = pattern[(M_slowclock_value)*16+15-:16];
        M_cSignal_d = 16'h1000;
      end
      4'hd: begin
        M_aSignal_d = pattern[(M_slowclock_value)*16+15-:16];
        M_cSignal_d = 16'h2000;
      end
      4'he: begin
        M_aSignal_d = pattern[(M_slowclock_value)*16+15-:16];
        M_cSignal_d = 16'h4000;
      end
      4'hf: begin
        M_aSignal_d = pattern[(M_slowclock_value)*16+15-:16];
        M_cSignal_d = 16'h8000;
      end
    endcase
    a = M_aSignal_q;
    c = M_cSignal_q;
  end
  
  always @(posedge clk) begin
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
