class paramClass #(parameter logic[3:0] a,b); 
  
  logic [3:0] x;
 
 /* 
  function val(logic [3:0]a,b);
  
      this.a = a; 
      this.b = b; 
       
  endfunction 
  */
  
  task automatic cal; 
  
    x = a+b;

  endtask  
  
  function logic [3:0] ret(); 
    
    return x;
    
  endfunction
  
endclass 

module paramClassMod(in1,in2,out); 
  
  input [3:0] in1,in2; 
  output [3:0] out; 
  reg [3:0] out;
  
  paramClass #(8,7) p1; 
  
  initial begin 
    
    p1=new();
    p1.cal(); 
    out =  p1.ret(); 
    $display($time," The o/p is %b ",out);
        
  end
  
endmodule

module paramClassModTB; 
  
  reg [3:0] in1,in2; 
  wire [3:0] out; 
  
  paramClassMod pcm(.in1(in1),.in2(in2),.out(out)); 
  
  initial begin 
  
    in1=2; 
    in2=4;  
    
  end  
  
endmodule