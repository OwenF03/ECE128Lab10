`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2025 06:50:46 PM
// Design Name: 
// Module Name: ROM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ROM(
  input wire [2:0] address,
  output wire [3:0] read_data
);
  
  reg [3:0] mem [0:7];
 
  assign read_data = mem[address];
  
  initial begin
    $readmemh("mem.h", mem);
  end
  
endmodule
