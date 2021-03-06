module andTest(in,out); 
  
  input [1:0] in; 
  output out; 
  
  assign out = in[0] & in[1];
  
endmodule  


module tb;  
  
  reg [1:0] in; 
  wire out; 
  
  andTest at(.in(in),.out(out)); 
  
  initial begin  
    
      #5 in=2'b00; 
      #5 in = 2'b01;
      #5 in=2'b10; 
      #5 in = 2'b11;
        
  end
  
 
endmodule 
