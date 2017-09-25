module structTest(in,out); 
  
  input [3:0] in;
  output int out;
  
  struct {
  
      int x;
      bit y;  
      logic [3:0] z;
  
  }ins; 
  
  
  always @(in) begin 
    
        if(in==0) begin  
          
          ins.x=23;  
          out=ins.x; 
          $display($time , "The value to structre is %h",out); 
          //out = ins.x; 
        end 
        
        if(in==1) begin            
          
          ins.y=1;  
          $display($time , "The value to structre is %h",ins.y); 
          //out = ins.y;          
        end 
        
        if(in==2) begin   
          
          ins.z=5; 
          $display($time , "The value to structre is %h",ins.z); 
          //out = ins.z;
        end 
            
  end 
 
  
endmodule 


module tb; 
  
  reg [3:0] in; 
  
  structTest st(.in(in)); 
  
  initial begin  
    
       in = 0; 
      #5 in = 1; 
      #5 in = 2; 
      
    
  end
  
endmodule 