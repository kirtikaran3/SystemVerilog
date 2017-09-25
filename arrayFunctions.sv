class arrFun; 
  
  logic [3:0] assArr[]={1,2,4,3,7,9,1,3,0}; 
  logic [3:0] q[$];
  
  task automatic option(logic [3:0] in); 
    
    if(in==1)begin 
      //$monitor($time," The min in array is %p",q);
      q=assArr.min();  
      $display($time," The min in array is %p",q);
      q=assArr.max(); 
      $display($time," The max in array is %p",q);
      
    end 
    
  else if (in==2)begin 
    
    q=assArr.unique(); 
    $display($time," The unique in array is %p",q);
    
  end
 
  endtask 
  
endclass 

module arrFunTest(in); 
  
  input [3:0] in; 
  
  arrFun ar=new;
  initial begin 
    
     
   #5 ar.option(in);
    
  end
  
endmodule 

module arrFunTb; 
  
  
  reg [3:0] in; 
  
  arrFunTest aft(.in(in)); 
  
  initial begin 
    
      //in=1; 
       in = 2; 
      #5 in = 3; 
      #5 in = 4;
    
  end
  
endmodule