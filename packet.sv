class packet #(parameter type i=logic[3:0]); 
  
  i a,b,x;
  
  function val(i a,b); 
    
    this.a = a; 
    this.b = b; 
        
  endfunction
 
 task automatic ops; 
   
   x = a+b;
   
 endtask 
 
  function logic [3:0] ret; 
  
      return x; 

  endfunction
  
endclass 

module paramTypemod(in1,in2,out,clk); 
  
  input [3:0] in1,in2; 
  output [3:0] out;  
  input clk;
  reg [3:0] out; 
  
  packet p1;
  
  always @(posedge clk) begin 
    
    $monitor($time," The output is %b",out);
    p1=new(); 
    #3 p1.val(in1,in2); 
    p1.ops(); 
    out=p1.ret(); 
    
     
  end
  
endmodule

module paramTypeTB;

    reg [3:0] in1,in2; 
    wire [3:0] out;  
    reg clk;

    paramTypemod ptm(.in1(in1),.in2(in2),.clk(clk),.out(out)); 
    
    
    always begin 
      
      #1 clk = ~clk;
   
    end

    initial begin 
      
      clk = 0; 
      
        {in1,in2}={4'h3,4'h4}; 
     #4 {in1,in2}={4'h4,4'h4}; 
     #4 {in1,in2}={4'h8,4'h4}; 
     #4 {in1,in2}={4'h7,4'h5};
    
    end


endmodule