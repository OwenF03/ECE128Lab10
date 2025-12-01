module RAM(
  input wire clk, input wire rst, input wire write_en, 
  input wire [2:0] address, input wire [7:0] write_data,
  output reg [7:0] read_data
);
  reg [7:0] mem [0:7];
  
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      mem[0] <= 8'b0;
      mem[1] <= 8'b0;
      mem[2] <= 8'b0;
      mem[3] <= 8'b0;
      mem[4] <= 8'b0;
      mem[5] <= 8'b0;
      mem[6] <= 8'b0;
      mem[7] <= 8'b0;
      read_data <= 0;
    end
    else begin
      if(write_en) 
        mem[address] <= write_data;
      else
        read_data <= mem[address];
    end
  end
endmodule