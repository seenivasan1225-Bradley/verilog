-----------------------------------------//dataflow_modeling//----------------------------------------------------------
module half_subtractor(input a,b,
                       output diff,borrow);
  assign diff=a^b;
  assign borrow=~a&b;
endmodule

------------------------------------------//gate-level_modeling//---------------------------------------------------------
module half_subtractor(
  input a,b,
  output diff,borrow);
  
  xor x1(diff,a,b);
  not n1(not_a,a);
  and a1(borrow,not_a,b);
endmodule

-----------------------------------------//behavioural modeling//-----------------------------------------------------------
module  half_subtractor(
  		input a,b,
		  output reg diff,borrow
);
  
  always@(*) begin
     diff=a^b;
     borrow = ~a&b;
  end
    endmodule
------------------------------------//behavioural modeling case_statement//-------------------------------------------------
module  half_subtractor(
  		input a,b,
		  output reg diff,borrow
);
  
  always@(*) begin
    case({a,b})
      2'b00:
      		begin
              diff=0;borrow=0;
            end
      2'b01:
      		begin
              diff=1;borrow=1;
            end
     2'b10:
      		begin
              diff=1;borrow=0;
            end
      2'b11:
       		begin
              diff=0;borrow=0;
            end
    endcase
  end
   endmodule
  
