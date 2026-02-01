<------------------------------------------ mux_2to1_dataflow_modeling---------------------------------------------->
module mux_2to1(
  		input a,b,sel,
  		output y
);
  
  assign y=(sel)?a:b;
endmodule
