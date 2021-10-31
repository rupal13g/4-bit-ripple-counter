module test;
  reg clk, rst;
  wire [3:0] q;
  
  //instantiating the design
  ripple rcc(q, clk, rst);
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
      
      clk = 1'b0;
      rst = 1'b1;
      
      #10;
      rst = 1'b0;
      
      #200;
      rst = 1'b1;
      #10;
      rst = 1'b0;
      #50;
      $finish;
      
    end
  always #5 clk = ~clk;
endmodule
