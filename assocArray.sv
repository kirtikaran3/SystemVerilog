class AssTest; 

logic [4:0] assArr[*];

  task automatic filling(logic [3:0] in); 
  
      logic [3:0] val; 
      val = in;
       
      #8 
      repeat(in) begin  
        
       assArr[in]=val;         
       val++; 
       $display($time , " : the asso Array values are %p",assArr);
     
     end
  
  endtask  
  
  
endclass

module  assocArray(in); 
  
  input [3:0] in; 
   
   AssTest at = new; 
   
   initial begin  
    #5 at.filling(in);  
    $display($time , " : the passed values are %b",in);
   end 
   
endmodule  


module assArrTb; 

    reg [3:0] in; 
    
    assocArray ar(.in(in)); 
    
    initial begin  
      
      #2 in=5;
      
    end

endmodule