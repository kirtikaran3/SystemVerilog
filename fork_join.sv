module fork_join(in,out,clk); 
  
  input [3:0] in; 
  input clk; 
  output [3:0] out; 
  logic [3:0] out; 
  
  
  always begin  
    
        fork begin 
        
                @(negedge clk)begin 
                  
                  #2 out = in; 
                  $display($time," This is 1st thread and control block");
                  
                end 
                
                @(negedge clk) begin 
                  
                  #5 out = in; 
                  $display($time," This is 2nd control block");
                  
                end        
            end                 
        join 

$display($time," Outside the thread, Thread one complete");
        
        fork begin 
          
                @(posedge clk) begin 
                  
                  #1 out = 1; 
                  $display($time," This is 2nd thread control block");
                  
                end 
                
                @(posedge clk) begin 
                  
                  #4 out = 4;
                  $display($time," This is 3rd control block");
                  
                end
          
          
            end
        join 

$display($time," Outside the thread, Thread two complete");
    
  end
    
endmodule 


module fork_joinTB; 
  
  reg [3:0] in;
  wire [3:0 ]out; 
  reg clk;  
  
  fork_join fj(.in(in),.clk(clk),.out(out));
  
  always begin 
    
    #1 clk = ~clk;
    
  end 
  
  initial begin 
    
    clk = 0;
    in = 12; 
    #5 in = 13;
    
  end
  
endmodule 



