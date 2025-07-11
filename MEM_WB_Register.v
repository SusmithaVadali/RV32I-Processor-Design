`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2024 01:39:12 AM
// Design Name: 
// Module Name: MEM_WB_Register
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


module MEM_WB_Register(clk,reset,ip_Read_Data,ip_alu_Result,ip_PC,ip_MemtoReg,op_Read_Data,op_alu_Result,op_PC,op_MemtoReg,
                       ip_Instruction,op_Instruction,ip_RegWrite,op_RegWrite);
    input clk;                               
    input reset;                             
    input [31:0] ip_Read_Data;               
    input [31:0] ip_alu_Result;              
    input [31:0] ip_PC;                      
    input [1:0] ip_MemtoReg;  
    input [31:0] ip_Instruction;
    input ip_RegWrite;
    output reg op_RegWrite;
    output reg [31:0] op_Instruction;               
    output reg [31:0] op_Read_Data;          
    output reg [31:0] op_alu_Result;         
    output reg [31:0] op_PC;                 
    output reg [1:0] op_MemtoReg;            
                                         
    always @ (negedge clk) begin             
        if(reset) begin                      
             op_Read_Data <= 32'b0;           
             op_alu_Result <= 32'b0;          
             op_PC  <=  32'b0;                
             op_MemtoReg <= 2'b0;
             op_Instruction <= 32'b0;
             op_RegWrite <= 1'b0;             
    end                                  
    else begin                           
             op_Read_Data <= ip_Read_Data;   
             op_alu_Result <= ip_alu_Result; 
             op_PC <= ip_PC;                 
             op_MemtoReg <= ip_MemtoReg;  
             op_Instruction <= ip_Instruction;  
             op_RegWrite <= ip_RegWrite;  
    end                                  
                                         
end                                      
                                         
endmodule
