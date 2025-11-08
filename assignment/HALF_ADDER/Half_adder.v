----------------------------------//1.dataflow modeling//---------------------------------------------
module half_adder(
                 input a,b,
		 output sum,carry
		);
   assign sum=a ^ b;
   assign carry=a & b;
endmodule

---------------------------//2.gate-level_modeling//---------------------------------------------------
module half_adder(input a,b,
                  output sum,carry);
  
  xor w1(sum,a,b);
  and x1(carry,a,b);
endmodule
------------------------------------//3.behavioural modeling//----------------------------------------
module half_adder(input a, b,
                  output reg sum,carry);
  
  always@(*) begin
    sum=a^b;
    carry=a&b;
  end
endmodule
  
