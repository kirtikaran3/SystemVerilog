class shallow; 
  
  logic [3:0] a,b,x; 
  
  task automatic add(input [3:0] a,b); 
    
    this.a=a; 
    this.b=b; 
    x=this.a+this.b;
    
  endtask 
  
  function automatic logic [3:0] ret(); 
    
    $display($time," The output from function is %b",x);
    return x;
    
  endfunction
  
endclass 


module shallow_module(in1,in2,out); 
  
  input [3:0] in1,in2; 
  output [3:0] out; 
  reg [3:0] out; 
  
  shallow s1=new(); 
  shallow s2=new s1; 
  
  initial begin 
    #3
    s1.add(in1,in2); 
    out = s1.ret(); 
    $display($time," The output using s1 %b ",out); 
    #3
    s2.add(in1,in2); 
    out= s2.ret(); 
    $display($time," The output using s2 is %b",out); 
    
    #3
    s2.add(9,2);  
    
    /*
      
      This is shallow copy as changes made by s2 will not be 
      reflected and thus s1.ret will give and 7(previous value) 
      and s2.ret will give value of 11 as both hv diff addrs.
      
    */
    out=s1.ret(); 
    $display($time," The output after var mani is %b",out);
    
  end
  
endmodule 

module shallow_moduleTB; 
  
  reg [3:0] in1,in2; 
  wire [3:0] out; 
  
  shallow_module shm(.in1(in1),.in2(in2),.out(out)); 
  
  initial begin 
    
    in1=5; 
    in2=2;
    
  end
  
endmodule