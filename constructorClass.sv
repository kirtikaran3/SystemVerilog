class construct;  
    logic [3:0] a,b;
    
  function [3:0] ret; 
    /*logic [3:0] a,b,f;
    a=this.a; 
    b=this.b; 
    f=a+b;
    */
    
    $display($time," The output is %b",f);
     
  endfunction
  
endclass


module constClass(in1,in2,out); 
  
  input [3:0] in1,in2; 
  output [3:0] out; 
  reg [3:0] out; 

     construct cc = new(1,2); 
     
     /*initial begin  
       
       out=cc.ret();
       
     end*/
      
  
endmodule 

module constClassTB; 
  
  reg [3:0] in1,in2; 
  wire [3:0] out;

  constClass cc(.in1(in1),.in2(in2),.out(out)); 
  
  initial begin 
    
    in1=2; 
    in2=9;
    
  end
  
endmodule




