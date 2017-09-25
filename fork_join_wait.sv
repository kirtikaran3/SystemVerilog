module fork_join_wait(in,out,clk); 
  
      input [3:0] in;  
      input clk;
      output [3:0] out; 
      logic [3:0] out; 
      
     always @(posedge clk)begin 
     
      fork begin 
    
          #5 $display($time," This is first thread"); 
          #5 $display($time," This is frst thread after delay initial delay"); 
          $display($time," This is first thread after no dealy");        
      end 
      
      begin 
      
            #3 $display($time," This is second thread"); 
            $display($time," This is second thread after no delay");  
        
      end 
      
      begin 
      
          $display($time," This is thread without any delay");  
        
      end
      
      join_any 
      wait fork;  //This statement will wait for all the to complete 
      
      //without this statement the program will stop at 2ns
            
      $display($time," This is outside the loop");
      #2 $stop;
      end

endmodule 


module fork_join_waitTB;  
  
  reg [3:0] in; 
  wire [3:0] out; 
  reg clk;
  
    fork_join_wait fjw(.in(in),.out(out),.clk(clk));
  
    initial begin 
      
      in=3; 
      clk = 0;
      
    end 
    
    always begin 
      
      #2 clk = ~clk;
      
    end
  
endmodule 





