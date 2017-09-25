
module unique_if(a,b,c); 
  
  input [3:0] a,b,c; 
  
  initial begin 
    #5 $display("Inside loop");
    
    unique if(a<b)  //There is also priority if which show no warning if more than 
    //one condtion is true,It just show result for first.
      
          $display($time, " A < B"); 
        
        else if (a<c) 
          
          $display($time, " A < C");   
      
       else 
          
          $display($time, " None of the condition matches");   
    
  end
  
endmodule 


module uniqueifTb; 
  
    reg [3:0] a,b,c; 
    
    unique_if unif(.a(a),.b(b),.c(c)); 
       
    initial begin 
    
        a=2; 
        b=3; 
        c=4;
    
    
  end     
  
endmodule




