module taskTest(a,b,out); 
  
  input [3:0] a,b; 
  output [3:0] out; 
  reg [3:0] out; 
  int r; 
  
  task addTest(input [3:0] x,y,output [3:0] z); 
    
    $display($time," the value of a and b is %b and %b",a,b);     
      x=a; 
      y=b; 
      z=x+y; 
      out=z;
      $display($time," The value is %b",out);
  endtask 
  
  initial begin 
    
    #5 addTest(5,6,r); 
    $display($time," The value is %b",r);
    
  end
 
endmodule 

module tastTestTB; 
  
  reg [3:0] a,b; 
  wire [3:0] out;
  
  taskTest tt(.a(a),.b(b),.out(out)); 
    
    initial begin 
      
      a=2; 
      b=3;
      
    end
  
endmodule
