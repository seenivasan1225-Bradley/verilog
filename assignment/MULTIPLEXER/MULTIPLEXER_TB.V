<--------------------------------------------------mux_2to1------------------------------------------------------->
module mux_2to1_tb;
  reg a,b,sel;
  wire y;
  
  mux_2to1 UUT(
    .a(a),
    .b(b),
    .sel(sel),
    .y(y)
  );
  
  
  initial begin
    $display("| TIME |  A   |  B   |  SEL  |  Y   |");
    $display("|------|------|------|-------|------|");
    $monitor("| %3t  |  %b   |  %b   |  %b    |  %b   |",$time , a , b , sel, y);

    a = 1; b = 0; sel = 0; #5;
    $display("|------|------|------|-------|------|");
    a = 1; b = 0; sel = 1; #5;
    $display("-------------------------------------");
    $finish;
   
  end
endmodule
