module tff(q, clk, rst);
  output reg q;
  input clk, rst;
  always @(posedge rst or posedge clk)
    begin
      if (rst)
        begin
          q <= 1'b0;
        end
      else
        begin
          q <= ~q;
        end
    end
endmodule
// now for 4-bit ripple carry counter
module ripple(q, clk, rst);
  output [3:0] q;
  input clk, rst;
  tff tff0(q[0], clk, rst);
  tff tff1(q[1], q[0], rst);
  tff tff2(q[2], q[1], rst);
  tff tff3(q[3], q[2], rst);
endmodule
