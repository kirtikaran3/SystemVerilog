module fork_join_disable(in,clk,out); 
  
  input [3:0] in; 
  input clk; 
  output [3:0] out; 
  logic [3:0] out;
  
  always @(posedge clk) begin 
    
    fork begin 
      
          $display($time," This is first thread"); 
          out = in;
    
      end  
    
    join_any 
    
    fork begin 
    
        #5 $display($time," This is 2nd thread"); 
            out = in+10;
    end  
    begin 
      
      #5 $display($time," This is 2nd thread after initial delay"); 
            out = in+13;
      
    end
    
    join_any 
    
    disable fork; 
    
    fork begin 
    
          $display($time," This is 3rd thread");
    
            out = in-5;
    end 
    
    join_none  
      
    disable fork; 
    
    $display($time," This is outside the threads ");
          out = in+5;
    
  end
  always  
   
      #50 $stop;
  
endmodule 


module fork_join_disableTB; 
  
  reg [3:0] in; 
  reg clk; 
  wire [3:0] out; 
  
  fork_join_disable fjd(.in(in),.out(out),.clk(clk)); 
  
  initial begin 
  
    in = 3; 
    clk = 0;  
    
  end 
  
  always begin 
    
    #2 clk = ~clk;
    
  end
  
endmodule 



