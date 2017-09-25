class fork_class; 

int i=0;
      task automatic task_thread(logic [3:0] clk); 
         
         $display("This is task_thread");  
     
      fork begin 
        
        if(clk==0)begin 
      
             #3 $display($time," This is task in posedge of clk");     
                $display($time," The value of i is %b",i++);                                
        end   
      
      end
            
      join 
         
      endtask 
    
      
      function function_thread;  
           
        fork begin
                      
            $display($time," This is function with negedge");
            $display($time," The value of i is %b",i--);
      
        end 
          
        join                       
      
      endfunction
      
  
endclass 


module fork_joinClass(in); 
  
  input [3:0] in; 
  
  fork_class fc = new(); 
  
  always @(negedge in) begin 
    
    fc.task_thread(in);  
    $display(" The value is : %b",in);
    
  end 
  
    always @(posedge in) begin 
    
 
    fc.function_thread();
    
  end
  
endmodule 


module fork_joinClassTB; 
  
    reg [3:0] in; 
    
    fork_joinClass fjc(.in(in)); 
    
    always begin 
      
      #5 in = ~in;
    end 

    initial begin 
      
      in=0; 
      #50 $stop;
    
    end    
    
endmodule 




