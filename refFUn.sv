module refFun(out); 
  
  int in1=20,in2=10; 
  output [3:0] out; 
  logic [3:0] out; 
  
  function automatic int refPass(ref int x,y); 

    refPass=x+y; 
    return refPass;
    
  endfunction 
  
  initial begin 
    
    out = refPass(in1,in2);
    $display($time," The output is : %b",out);

  end
  
endmodule 
