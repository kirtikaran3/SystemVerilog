module forloop(in,out); 
    
  input [3:0] in; 
  output [3:0] out; 
  reg [3:0] out; 
  
  initial begin 
    
    #5
        for(int i=0,y=8;i<in;i++)begin 
        
        
            if(i==y) 
              break;
        
            out = i;
            $display($time, " the output is %h",out);
             
                  
        end
            
  end
    
endmodule 

module forTB; 
  
      reg [3:0] in; 
      wire [3:0] out; 
      
      forloop fl(.in(in),.out(out)); 
      
      initial begin 
      
          in = 15; 
    end
  
endmodule









