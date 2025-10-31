module tb_half_subtractor;
  reg a,b;
  wire diff,borrow;
  
  half_subtractor DUT(
    .a(a),
    .b(b),
    .diff(diff),
    .borrow(borrow)
  );
 
initial begin
  $monitor("time=%0t,a=%b,b=%b,diff=%b,borrow=%b",$time,a,b,diff,borrow);
    a=0;b=0;
    #10;a=0;b=1;
    #10;a=1;b=0;
    #10;a=1;b=1;
   #10;$display("successfully completed!");
  $finish;   
end
 initial begin
   $dumpfile("start.vcd");
   $dumpvars(0,tb_half_subtractor);
     
    end
  endmodule
