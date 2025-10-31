module tb_half_adder;
  reg a,b;
  wire sum,carry;
  
  half_adder DUT(
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
  );
 
initial begin
  $monitor("time=%0t,a=%b,b=%b,sum=%b,carry=%b",$time,a,b,sum,carry);
    a=0;b=0;
    #10;a=0;b=1;
    #10;a=1;b=0;
    #10;a=1;b=1;
   #10;$display("successfully completed!");
  $finish;   
end
 initial begin
   $dumpfile("start.vcd");
   $dumpvars(0,tb_half_adder);
     
    end
  endmodule
