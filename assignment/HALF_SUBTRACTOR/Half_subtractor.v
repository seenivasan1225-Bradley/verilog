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

--------------------------------------//functional level-coding//-------------------------------------------------------
module half_subtractor(
  			input a,b,
  			output diff,borrow
);
  
  function[1:0]half_sub;
    input a,b;
    begin
    
    half_sub[0]=a^b;
    half_sub[1]=~a&b;
    end
    endfunction
  assign{borrow,diff}=half_sub(a,b);
endmodule

-----------------------------------------//structural level moding//-----------------------------------------------------
module half_subtractor(
  			input a,b,
  			output diff,borrow
);
  wire term1,term2,term3;
  not a1(not_a,a);
  not a2(not_b,b);
  and b1(term1,not_a,b);
  and b2(term2,a,not_b);
  or x1(diff,term1,term2);
  and x2(borrow,not_a,b);
endmodule
  
