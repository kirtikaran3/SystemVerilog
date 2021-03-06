class getset; 
  
  logic [3:0] out;
  
  task automatic classTask(input [3:0] a,b); 
          
    out = a+b; 
              
  endtask 
  
  function automatic [3:0] classFun; 
    
    return out;
    
  endfunction
      
  
endclass

module newClassTest(in1,in2,out,clk); 

  input [3:0] in1,in2; 
  output [3:0] out; 
  logic [3:0] out; 
  input clk;
  
  getset  gs = new();

  always @(posedge clk) begin 
    
    gs.classTask(in1,in2); 
    out = gs.classFun();
    $display($time," The input are %b and %b",in1,in2);
    $display($time," The out is %b",out);
     
  end
      
  
endmodule 


module newClassTB; 
  
  reg [3:0] in1,in2; 
  wire [3:0] out;  
  reg clk;
  
  newClassTest nct(.in1(in1),.in2(in2),.out(out),.clk(clk)); 
  
  always begin 
    
    #1 clk = ~clk;
    
  end
  
  initial begin 
    clk = 0;  
    #3 in1=2; 
    in2=5; 
    
    #3 in1=3; 
    in2=7; 
    
    #3 in1=12; 
    in2=2; 
    
   #50 $stop;
    
  end 
  
endmodule


  
