`timescale 1ns / 1ps

module Multiplier_tb();

reg clk; reg rst; reg clear_mem; 
reg [2:0] rom1; reg [2:0] rom2; 
reg [2:0] dest; 
wire [7:0] result; 

Multiplier DUT(.clk(clk), .rst(rst), .clear_mem(clear_mem), .ra1(rom1), .ra2(rom2), .dest_adr(dest), .result(result)); 

//Generate clock
always #0.5 clk = ~clk;

// Initial values
initial begin
    clk = 0; 
    rst = 1; 
    clear_mem = 1;
    rom1 = 0;
    rom2 = 0;
    dest = 0;
end

// Begin test cases 
/*
ROM contains [0, 1, 2, 3, 4, 5, A, F]

After test cases, RAM should contain 

[225, 150, 75, 60, 45, 30, 15, 0]

and then be reset 
*/

initial begin
    #2 rst = 0; clear_mem = 0;
       rom1 = 7; rom2 = 7; 
    #10 rst = 1; 
    #1 rst = 0; rom1 = 7; rom2 = 6; dest = 1; 
    #10 rst = 1;
    #1 rst = 0; rom1 = 5; rom2 = 7; dest = 2;
    #10 rst = 1;
    #1 rst = 0; rom1 = 7; rom2 = 4; dest = 3;
    #10 rst = 1; 
    #1 rst = 0; rom1 = 3; rom2 = 7; dest = 4;
    #10 rst = 1;
    #1 rst = 0; rom1 = 7; rom2 = 2; dest = 5;
    #10 rst = 1;
    #1 rst = 0; rom1 = 1; rom2 = 7; dest = 6;
    #10 rst = 1;
    #1 rst = 0; rom1 = 7; rom2 = 0; dest = 7;
    #5 clear_mem = 1; 
    #5 $finish;
end

endmodule
