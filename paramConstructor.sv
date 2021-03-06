class param; 

  logic [3:0] a,b; 
  logic [3:0] x; 
  
  function new(a,b); 
    
    logic [3:0] a,b; 
    
    this.a = a; 
    this.b = b; 
    
  endfunction 
  
  task automatic ops(); 
    
    x=a+b;
    
  endtask 
  
  function automatic logic[3:0] ret(); 
    
    return x;
    
  endfunction
 
  
endclass 


module paramConst(in1,in2,out,clk); 
  
  input [3:0] in1,in2; 
  input clk; 
  output [3:0] out; 
  reg [3:0] out; 
  
  param p1,p2;
  
  always @(posedge clk) begin 
    
    #2 p1 = new(in1,in2); 
    p2=p1; //Two references for a single object
    $monitor($time," The op is %b",out);
    p1.ops(); 
    out=p2.ret();
    
    
  end
  
endmodule 

module paramConstTB; 
  

  reg [3:0] in1,in2; 
  reg clk; 
  wire [3:0] out; 
  
paramConst pmc(.in1(in1),.in2(in2),.out(out),.clk(clk));  
  
  initial begin 
    
    clk = 0; 
   
      {in1,in2}={4'h4,4'h5};
   #3 {in1,in2}={4'h1,4'h5}; 
   #3 {in1,in2}={4'h4,4'h0}; 
   #3 {in1,in2}={4'h3,4'h5}; 
    
   
  end 
  always 
    #1 clk = ~clk;
  
endmodule
