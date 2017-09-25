module fork_join_any(in,out,clk); 
  
  input [3:0] in; 
  input clk;  
  output [3:0] out; 
  logic [3:0] out; 
      
    task automatic task_thread; 
  
       @(posedge clk) begin  
        
        fork begin 
          
          
          #5 $display($time," This is first process thread %b",in);          
          #5 $display($time," Still inside first process and new value of in is %b",in); 
                    
        end 
        
        begin 
        
        #7 out=in+2; 
        $display($time," This is 2nd thread");
      
        end  
        
        join_any //join_none will run outside loop at 2ns
                  //join_any at 9ns
      end    
      
    endtask 
    
    initial begin 
      
      task_thread(); 
      $display($time," This is outside process");
      
    end
   
   
      
endmodule 


module fork_join_anyTB; 

    reg [3:0] in; 
    reg clk; 
    wire [3:0] out; 
    
    fork_join_any fja(.in(in),.out(out),.clk(clk)); 
    
    initial begin 
    
        in = 3; 
        clk = 0;
    
    end  
  
    always begin  
      
      #2 clk = ~clk;
      
    end
  
  
endmodule 





