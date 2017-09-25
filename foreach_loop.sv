module foreachTest(in); 
  
  input [3:0] in; 
  
  byte l[7] = '{1,2,3,4,5,6,7}; 
  
  initial begin 
     #5    
    foreach(l[i]) begin 
      
        if(in==l[i])begin  
          
          $display($time," if within for");
          break; 
       
       end
        
       $display($time," The o/p are %d",l[i]);   
      
    end
        
  end
  
endmodule 


module  foreachtb;
  
  reg [3:0] in; 
  
  foreachTest fet(.in(in)); 
  
  initial begin 
    
        in = 2;
    
  end
  
endmodule



