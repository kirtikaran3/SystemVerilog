module funTest(in,out); 
  
  input [3:0]  in; 
  output int out; 
  
  function int funRet(input [3:0] x); 
    
      if(in==1) 
        out=x;
    
    
  endfunction
  
  initial begin 
    
    funRet(10);
    
  end
  
endmodule ; 
 
module funTestTb; 
  
    reg [3:0] in; 
    wire int out; 
    
    funTest ft(.in(in),.out(out));
  
    
    
  
endmodule 

 
/*
module sv_function;
  int x;
  //function to add two integer numbers.
  function int sum(input int a,b);
    sum = a+b;  
  endfunction
 
  initial begin
    x=sum(10,5);
    $display("\tValue of x = %0d",x);
  end
endmodule
*/