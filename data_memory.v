`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:05:39 03/09/2020 
// Design Name: 
// Module Name:    data_memory 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
 module data_memory  
 (  
      input                         clk,  
      // address input, shared by read and write port  
      input     [15:0]               mem_access_addr,  
      // write port  
      input     [15:0]               mem_write_data,  
      input                         mem_write_en,  
      input mem_read,  
      // read port  
      output     [15:0]               mem_read_data  
 );  
      integer i;  
      reg [15:0] ram [255:0];  
      wire [7 : 0] ram_addr = mem_access_addr[8 : 1];  
      initial begin  
           for(i=0;i<256;i=i+1)  
                ram[i] <= 16'd0;  
      end  
      always @(posedge clk) begin  
           if (mem_write_en)  
                ram[ram_addr] <= mem_write_data;  
      end  
      assign mem_read_data = (mem_read==1'b1) ? ram[ram_addr]: 16'd0;   
 endmodule 
