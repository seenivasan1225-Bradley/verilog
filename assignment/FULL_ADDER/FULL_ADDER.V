----------------------------------------------------1.DATAFLOW MODELING--------------------------------------------
module full_adder(input a,b,c,
                        output sum,carry);

assign sum=a^b^c;
assign carry=(a&b)|(b&a)|(a&c);
endmodule

----------------------------------------------------2.GATE_LEVEL_MODELING------------------------------------------
module fulladder(input a,b,c,
                 output sum,carry);
  
 wire w1,w2,w3;
  
  xor q1(w1,a,b);
  xor q2(sum,w1,c);
  and q3(w2,a,b);
  and q4(w3,w1,c);
  or q5(carry,w2,w3);
endmodule
-------------------------------------------------3.BEHAVIOURAL_LEVELMODELING--------------------------------------
module fulladder(input a,b,c,
                 output reg sum,carry);
  
  always@(*)begin
  sum=a^b^c;
  carry=(a&b)|(b&c)|(a&c);
end
endmodule
