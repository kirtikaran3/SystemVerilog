module dynQue(in,out); 
  
  input [3:0] in; 
  output [3:0] out[3:0]; 
  reg  [3:0] out[3:0];
  
  logic [3:0] q[$]={2,3}; 
  
  initial begin 
    
    $monitor($time, "  : The modified q is %p",q);
    #5 q.insert(0,{in});  
    #5 q.insert(0,in);   
    #5 q.push_front({12}); 
    #5 q.pop_front();
    #5 q.insert(1,in);
    #5 q.insert(2,in); 
    #5 q.insert(3,in); 
    #5 q.pop_back();
            
  end
    
endmodule  

module dynQueTB; 
  
  reg [3:0] in; 
  wire[3:0] out [3:0]; 
  
  dynQue d(.in(in),.out(out)); 
  
  initial begin  
    
         in=6; 
      #5 in=9; 
      #5 in=8;
      #5 in=11; 
      #5 in=12;   
  end 
    
endmodule
  