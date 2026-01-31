----------------------------------------1.data_flow_modeling---------------------------------------------
module full_subtractor(
  input a,b,c,
  output borrow,difference
);
  
  assign borrow=(~a&b)|(b&c)|(~a&c);
  assign difference=a^b^c;
endmodule
  
