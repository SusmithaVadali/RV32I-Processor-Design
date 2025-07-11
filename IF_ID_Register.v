`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2024 11:29:13 PM
// Design Name: 
// Module Name: IF_ID_Register
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


module IF_ID_Register(clk,reset,ip_instruction,ip_pc,op_pc,op_instruction
//ip_pc_temp,op_pc_temp
);
    //<--------------------PORT DECLARATION----------------------->
    input clk;
    input reset;
    input [31:0] ip_instruction;
    input [31:0] ip_pc;
//    input [31:0] ip_pc_temp;
 //   output reg [31:0] op_pc_temp;
    output reg [31:0] op_instruction;
    output reg [31:0] op_pc;
    //<-------------------------------------->
//    always @(posedge clk) begin
    always @(negedge clk) begin
        if(reset) begin
            op_instruction <= 32'b0;
            op_pc <= 32'b0;  
   //         op_pc_temp <= 32'b0;   
        end
        else begin
            op_instruction <= ip_instruction;
            op_pc <= ip_pc;
  //          op_pc_temp <= ip_pc_temp;
        end
    end
endmodule                         
