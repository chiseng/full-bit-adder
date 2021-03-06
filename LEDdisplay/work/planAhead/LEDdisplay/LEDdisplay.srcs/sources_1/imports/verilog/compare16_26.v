/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module compare16_26 (
    input [5:0] alufn,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] cmp
  );
  
  
  
  always @* begin
    
    case (alufn[1+1-:2])
      2'h1: begin
        cmp = a == b;
      end
      2'h2: begin
        cmp = a < b;
      end
      2'h3: begin
        cmp = a <= b;
      end
      default: begin
        cmp = 1'h0;
      end
    endcase
  end
endmodule
