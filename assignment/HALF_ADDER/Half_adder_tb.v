 module halfadder_tb;
   reg a,b;
  wire sum,carry;
  
  halfadder UUT(
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
  );
  
  
 initial begin
   $monitor("| %4t |  %1b  |  %1b  |   %1b   |   %1b  |",$time,a,b,sum,carry); 
   $display(" TIME  |   A   |  B  |  SUM  |  CARRY  |");
   $display("---------------------------------------");
   a=0;b=0;#10;
   a=0;b=1;#10;
   a=1;b=0;#10;
   a=1;b=1;#10;
   $display("successfully completed!");
    $finish;
 end
 initial begin
   $dumpfile("start.vcd");
   $dumpvars(0,halfadder_tb);
 end
endmodule
   
