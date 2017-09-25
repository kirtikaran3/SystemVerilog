
class AssTest; 

logic [4:0] assArr[*];

  task automatic filling(logic [3:0] in); 
  
      logic [3:0] val,lVal; 
      val = in;
       
      #8 
      repeat(10) begin  
        
       assArr[in]=in;         
       in++; 
       $display($time , " : the asso Array values are %p",assArr);
        
     end  
     
     $display($time , " The number of elements in ass Arr are %0d",assArr.num());
     
     assArr.first(in);
     $display($time , " The first index of the array is %h",assArr[in]); 
     
     assArr.last(in); 
     $display( " The last index of the array is %h",assArr[in]);
  
  endtask  
  
  
endclass

module  assocArray1(in); 
  
  input [3:0] in; 
   
   AssTest at = new; 
   
   initial begin  
    #5 at.filling(in);  
    $display($time , " : the passed values are %b",in);
   end 
   
endmodule  


module assArrTb1; 

    reg [3:0] in; 
    
    assocArray1 ar(.in(in)); 
    
    initial begin  
      
      #2 in=1;
      
    end

endmodule
