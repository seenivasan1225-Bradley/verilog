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

----------------------------------------------------//4.modeling using the switchcase//
module half_adder(input a,b,
                  output reg sum,carry);
  always@(*) begin
    case({a,b})
      2'b00:
      begin
        sum=0;carry=0;
      end
      2'b01:
      begin
        sum=1;carry=0;
      end
      2'b10:
        begin
          sum=1;carry=0;
        end
      2'b11:
        begin
          sum=0;carry=1;
        end
    endcase
  end
endmodule 
----------------------------------------------//5.functional level_modeling//--------------------------------------------------------------------------
module half_adder(input a,b,
                  output sum,carry);
  
  function[1:0]half_adder;
    input a,b;
    begin
      half_adder[0]=a^b;
      half_adder[1]=a&b;
    end
  endfunction
  assign {carry,sum}=half_adder(a,b);
endmodule
   
  
