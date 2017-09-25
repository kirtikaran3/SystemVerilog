module notReturnFunction(in1,in2,out); 
  
  input [3:0] in1,in2; 
  output [3:0] out; 
  logic [3:0] out; 
  
  function automatic notReturn; 
   
    input [3:0] a,b; 
    a=in1; 
    b=in2; 
    notReturn=a+b; 
    return notReturn;
    
  endfunction
  
  initial begin 
    
    $display($time," This is void");
    void'(notReturn(in1,in2)); 
    
    
  end
  
endmodule 

module notReturnFunctionTB; 
  
  reg [3:0] in1,in2; 
  wire [3:0] out; 
  
  notReturnFunction nrf(.in1(in1),.in2(in2),.out(out)); 
  
  initial begin 
    
    #2 in1=2; 
    in2=2;
    
  end
  
endmodule

