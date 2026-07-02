`timescale 1ns / 1ps

module tb_top_mod();
    reg clk;
    reg rstn;
    reg mode;
    wire [3:0] digit;
    wire [7:0] sseg;

    
    reg [31:0] mode_str;
    always @(*) begin
        if (mode) mode_str = "UP  ";
        else      mode_str = "DOWN";
    end

    
    top_mod #(.DIV_LIMIT(5)) uut (
        .clk(clk), 
        .rstn(rstn), 
        .mode(mode), 
        .digit(digit), 
        .sseg(sseg)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        rstn = 0; mode = 1; 
        #20 rstn = 1;       
        
        #2000;                 
        
        mode = 0;            
        #1000;
        
        rstn = 0;           
        #20 rstn = 1;
        
        #500;
        $display("Simulation Finished.");
        $finish;
    end

   
    initial begin
       
        $monitor("Time= %7t |   Reset= %b   | Mode= %s |   count =%h   |    digit sel= %b   | segment display= %b",  $time,rstn,mode_str, uut.count_val,  digit, sseg );
    

end

endmodule