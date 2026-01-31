

 module full_subtractor_tb;
   reg a,b,c;
  wire borrow,difference;
  
  full_subtractor UUT(
    .a(a),
    .b(b),
    .c(c),
    .borrow(borrow),
    .difference(difference)
  );
  
  
 initial begin
   $display("|---------------|-----|-----|--------|------------|");
   $monitor("| %4t --->| %b  | %b   |   %b |   %b    |     %b      |",$time,a  ,b  ,c  ,borrow  ,difference );
   $display("|TIME --->| A  | B   |  C  | BORROW | DIFFERENCE |");
   $display("|---------------|-----|-----|--------|------------|");
   a=0;b=0;c=0;#10;
   $display("|---------------|-----|-----|--------|------------|");
   a=0;b=0;c=1;#10;
   $display("|---------------|-----|-----|--------|------------|");
   a=0;b=1;c=1;#10;
   $display("|---------------|-----|-----|--------|------------|");
   a=1;b=0;c=0;#10;
   $display("|---------------|-----|-----|--------|------------|");
   a=1;b=0;c=1;#10;
   $display("|---------------|-----|-----|--------|------------|");
   a=1;b=1;c=0;#10;
   $display("|---------------|-----|-----|--------|------------|");
   a=1;b=1;c=1;#10;
   $display("|---------------|-----|-----|--------|------------|");
   
   $display("successfully completed!");
    $finish;
 end
 initial begin
   $dumpfile("start.vcd");
   $dumpvars();
 end
endmodule
   
