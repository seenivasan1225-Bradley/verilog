-----------------------------------------//1.dataflow_modeling//----------------------------------------------------------
module half_subtractor(input a,b,
                       output diff,borrow);
  assign diff=a^b;
  assign borrow=~a&b;
endmodule

------------------------------------------//2.gate-level_modeling//---------------------------------------------------------
module half_subtractor(
  input a,b,
  output diff,borrow);
  
  xor x1(diff,a,b);
  not n1(not_a,a);
  and a1(borrow,not_a,b);
endmodule

-----------------------------------------//3.behavioural modeling//-----------------------------------------------------------
module  half_subtractor(
  		input a,b,
		  output reg diff,borrow
);
  
  always@(*) begin
     diff=a^b;
     borrow = ~a&b;
  end
    endmodule
------------------------------------//4.behavioural modeling case_statement//-------------------------------------------------
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

--------------------------------------//5.functional level-coding//-------------------------------------------------------
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

-----------------------------------------//6.structural level moding//-----------------------------------------------------
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
----------------------------------------//7.parameter_initailization//---------------------------------------------------------
module half_subtractor#(
    parameter WIDTH = 1
)(
    input [WIDTH-1:0] a, b,
    output [WIDTH-1:0] diff, borrow
);
    assign diff = a ^ b;
    assign borrow = ~a & b;
endmodule
-----------------------------------------------------//8.look-up_table//----------------------------------------------------------
module half_subtractor(input a,b,
                       output reg diff,borrow);
  always@(*) begin
    case({a,b})
      2'b00:{diff,borrow}=2'b00;
      2'b01:{diff,borrow}=2'b11;
      2'b10:{diff,borrow}=2'b10;
      2'b11:{diff,borrow}=2'b00;
    endcase
  end
    endmodule
--------------------------------------------//9.using half_adder --//to model//-- the half_subtractor//-------------------------------
module half_subtractor(input a,b,
                       output diff,borrow);
  assign diff= ~({~a^b});
    assign borrow=~a&b;
endmodule

--------------------------------------------//10.arithematic modelling//-----------------------------------------------------------------
module half_subtractor(
  input a,b,
  output diff,borrow);
  
  assign {borrow,diff}=a-b;
endmodule

-----------------------------------------//11.ternary operators//-----------------------------------------------------------------------
module half_subtractor(
  input a,b,
  output diff,borrow);
  
  assign diff=(a==b)?1'b0:1'b1;
  assign borrow=(a<b)?1'b1:1'b0;
endmodule

---------------------------------------//12.using generated block//----------------------------------------------------------------------

module half_subtractor(
  	input a,b,
  output diff,borrow
  );
 genvar i;
  generate
    for(i=0;i<1;i=i+1)begin: sub_gen
        assign diff=a^b;
        assign borrow=~a&b;
      end
  endgenerate
endmodule

------------------------------------------//13.Using SystemVerilog Features//-----------------------------------
module half_subtractor(
    input logic a, b,
    output logic diff, borrow
);
    
    
    always_comb begin
        {borrow, diff} = '{~a & b, a ^ b};
    end
endmodule



