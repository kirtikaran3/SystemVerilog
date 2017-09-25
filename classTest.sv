class allClass;

    function automatic int addFun(in); 
         
      logic [3:0] in; 
      $display($time," : The I/P is %b : ",in);      
      
    endfunction 
    
    task automatic displayTask; 
    
        $display($time," : This is task example: ");
  
    endtask 

endclass 

module classTest(in); 
  
  
  input [3:0] in; 
  
  allClass alc = new(); 
  initial begin 
  
  #5      
      alc.addFun(in); 
      alc.displayTask();

  end

endmodule 


module classTestTB; 

    reg[3:0] in; 
    
    classTest ct(.in(in));

    initial begin 

         in=2; 
      #5 in = 3;
      
    end
  
endmodule  



