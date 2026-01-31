----------------------------------------1.data_flow_modeling---------------------------------------------
module full_subtractor(
  input a,b,c,
  output borrow,difference
);
  
  assign borrow=(~a&b)|(b&c)|(~a&c);
  assign difference=a^b^c;
endmodule
  
-------------------------------------2.gate_level_modeling-----------------------------------------------


module full_subtractor(
  	input a,b,c,
  	output borrow,difference
);
  
  wire w1,w2,w3,w4;
  
  xor g1(w1,a,b);
  xor g2(difference,w1,c);
  and g3(w2,~a,b);
  and g4(w3,b,c);
  and g5(w4,~a,c);
  or  g6(borrow,w2,w3,w4);
endmodule

-----------------------------------------3.behavioural_modeling------------------------------------------

module full_subtractor(
  	input a,b,c,
  	output reg borrow,difference
);
  

  always@(*) begin
    
    difference= a^b^c;
    borrow=(~a&b)|(b&c)|(~a&c);
  end
endmodule
  
