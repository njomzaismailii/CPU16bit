 `timescale 1ns / 1ps
 
 module CPU_TB(

    );
    
    reg clk;
    
    initial
    begin 
    
    #0 clk =0;
    #5 clk =1;
    #5 clk =0;
    #5 clk =1;
    #5 clk =0;
    #5 clk =1;
    #5 clk =1;
    #5 clk =0;
    #5 clk =1;
    
    end
   
   CPU CPU_testbench(clk);
    
    
endmodule
