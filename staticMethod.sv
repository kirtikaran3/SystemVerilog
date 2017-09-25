class packet; 

logic [3:0] a,b,x;

    function new(logic [3:0] a,b); 
         
      this.a = a; 
      this.b = b; 
      $display($time," The initialised values are %b and %b",a,b);         
    
    endfunction 
    
    task automatic add(); 
      
      x = a + b;
      $display($time," The x is %b",x);
    
    endtask 
    
    function automatic logic [3:0] ret(); 
    
      
      $display($time," The x in ret function %b",x); 
      return x;
    
    endfunction  
  
endclass 

module modPacket(in1,in2,out);
  
  input [3:0] in1,in2; 
  output [3:0] out; 
  logic [3:0] out;
  
  packet p1,p2; 
  
  initial begin 

    $display($time," The out before class is %b",out);  
    
    #5  p1=new(in1,in2); //Paramterised constructor
      p2=p1; 
      p1.add(); 
      out=p2.ret(); 
      $display($time," The out is %b",out);
        
  end 
   
  
endmodule 

module modPacketTB; 
  
  reg [3:0] in1,in2; 
  wire [3:0] out; 
  
  modPacket mp(.in1(in1),.in2(in2),.out(out)) ; 
  
  initial begin 
  
    in1=2;in2=3;  
    
  end
  
endmodule