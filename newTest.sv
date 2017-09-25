class sv_class;
  //class properties
  int x;
 
  //method-1
  task set(int i);
    x = i;
  endtask
 
  //method-2
  function int get();
    return x;
  endfunction
endclass
 
module sv_class_ex;
 sv_class class_1 = new(); //Creating Handle
  sv_class class_2 = new(); //Creating handle and Object
     //Creating Object for the Handle
  initial begin
   
 
    //Accessing Class methods
    class_1.set(10);
    class_2.set(20);
    $display("\tclass_1 :: Value of x = %0d",class_1.get());
    $display("\tclass_2 :: Value of x = %0d",class_2.get());
  end
endmodule