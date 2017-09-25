module associative_array;
  //array declaration
  int a_array1[bit [7:0]]; //index type is bit [7:0] and entry type is int
  bit a_array2[string]   ; //index type is string and entry type is bit
   
  initial begin
    //allocating array and assigning value to it
    a_array1[5] = 10;
    a_array1[8] = 20;
         
    a_array2["GOOD_PKT"] = 1;
    a_array2["BAD_PKT"]  = 0;
        
    foreach(a_array1[index])
      $display("a_array1[%0d] = %0d",index,a_array1[index]);
    foreach(a_array2[index])
      $display("a_array2[%0s] = %0d",index,a_array2[index]);
  end
endmodule