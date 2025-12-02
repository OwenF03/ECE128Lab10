`timescale 1ns / 1ps

// Top level module for multiplier
// clear_mem seperates system reset from memory reset 
module Multiplier(input wire clk, input wire rst, input wire clear_mem, input wire [2:0] ra1, input wire [2:0] ra2, input wire [2:0] dest_adr, output reg [7:0] result);
    
    wire [7:0] ram_out; 
    wire [3:0] rom_data; 
    wire [2:0] state_out; //st_out from cu, used to latch ram value
    wire [2:0] adr_out; 
    wire [7:0] product; //multiplier out
    wire [3:0] A; wire [3:0] B; //Reg file output
    wire SA, SB, DA, w_rf, w_ram; //Control signals
    
    //Define modules (control, register file, rom, ram and multiplier)
    cu control_unit(.clk(clk), .reset(rst), .adr1(ra1), .adr2(ra2), .dest_adr(dest_adr), .w_rf(w_rf), .adr(adr_out),
                .DA(DA), .SA(SA), .SB(SB), .st_out(state_out), .w_ram(w_ram)); 
    RF reg_file(.A(A), .B(B), .SA(SA), .SB(SB), .D(rom_data), .DA(DA), .W(w_rf), .rst(rst), .clk(clk)); 
    ROM rom(.address(adr_out), .read_data(rom_data)); 
    //Destination address in this design is independent from control unit (static) 
    RAM ram(.clk(clk), .rst(clear_mem), .write_en(w_ram), .address(adr_out), .write_data(product), .read_data(ram_out)); 
    FOUR_BIT_MULT mult(.A(A), .B(B), .res(product)); 
    
    //Assign output
    always @(posedge clk) begin
        if(clear_mem || rst) begin
            result <= 0; // Set output to zero on reset (or memory cleared)
        end
        else begin
            if(state_out == 3'b101) result <= ram_out; //Read ram state (valid ram output value)
            else result <= result; 
        end
        
    end
endmodule

//combinational multiplier module
// Would have reused module from lab 9, however it was an 8 bit multiplier, so we decided
// to use the inbuilt multiplication operation (no testing required). 
module FOUR_BIT_MULT(input wire [3:0] A, input wire [3:0] B, output wire [7:0] res);
    assign res = A * B;
endmodule

//Combinational multiplier from the last lab that could have been changed to be four bits 
/*
module combo_mult(input wire [7:0] a, input wire [7:0] b, output wire [15:0] res);

    
    
    wire [15:0] m [7:0];
    wire [15:0] sums [7:0];
     
    genvar i; 
    generate 
        for(i = 0; i < 8; i = i + 1) begin
            assign m[i] = (a[i] != 0) ? ({{8'b0}, b} << i) : 16'b0;
        end
    endgenerate
    
    assign res = m[0] + m[1] + m[2] + m[3] + m[4] + m[5] + m[6] + m[7];
    
endmodule

*/
