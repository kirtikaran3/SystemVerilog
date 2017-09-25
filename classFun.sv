class classFun; 
  
   int q[$]={1,2};
   
   //if we use funtion instead of task it will give a warning as the  
   //output is not used anywhere 
   
  task automatic pass(logic [3:0] in); 
          
        q.insert(1,in); 
        $display($time, "  The q is %p ",q);
        
  endtask
 
endclass

module classFunPass(in); 
  
    input [3:0] in; 
    
    classFun cFun = new; 
    
    initial begin  
        cFun.pass(9);  
        #3 cFun.pass(in); 
        #10 cFun.pass(in); 
            
    end

endmodule 

module classTb; 
  
  reg [3:0] in; 
  
  classFunPass cfp(.in(in)); 
    
    initial begin 
      
        #2 in=5; 
        #1 in = 6;
      
    end
  
endmodule 