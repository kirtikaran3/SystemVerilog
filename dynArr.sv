//testing
module dynArr(in,out); 
  
  input [2:0] in; 
  logic [3:0] dyn[]; 
  logic [3:0] a[]; 
  logic [3:0] b[];
  logic [3:0] c[]; 
  logic [3:0] d[];
  
  output [3:0] out[3:0]; 
  reg  [3:0] out[3:0];
  
  initial begin 
    dyn = new[5]; 
    a = new[1]; 
    b = new[1]; 
    c = new[1]; 
    d = new[1]; 
    a={1}; 
    b={2}; 
    c={3}; 
    d={4};
  end 
  
  always @(in) begin 
    
    if(in==0)begin 
      
     dyn = {a,b,c,d};  
     $display("The dyn array is %p",dyn);
     out = dyn; 
   
   end 
    
    if(in==1) begin  
    
      dyn = {d}; 
      $display("The dyn array is %p",dyn);  
      //out = dyn; we canot assign dyn to out as out has a size of 4  
      //where as dyn has just a size of 1
    end 
    
    if(in==2) begin 
      
      dyn = {a,d,b};  
      $display("The dyn array is %p",dyn);
      //out = dyn; same here as the output is of size 4 and dyn has size of 3
  end 
  
    if(in==3) begin  
     
      dyn = {a,b};  
      $display("The dyn array is %p",dyn);
      //out = dyn; same here as the output is of size 4 and dyn has size of 2
    
    end  
    
  end
  
endmodule 

module dynArrTB; 
  
  reg [2:0] in; 
  wire  [3:0] out[3:0];
  
  dynArr a(.in(in),.out(out)); 
  
  initial begin 
  
  $monitor($time, " : in %b : o/p are %p ",in,out);
  
    #5 in=3'b000; 
    #5 in=3'b001; 
    #5 in=3'b010; 
    #5 in=3'b011; 
        
  
end 

endmodule  
