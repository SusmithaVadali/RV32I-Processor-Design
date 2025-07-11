`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2024 07:18:01 PM
// Design Name: 
// Module Name: EX_MEM_Register
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


module EX_MEM_Register(clk,reset,
//ip_Add_J,
ip_ALU,ip_Data_out2,
//ip_Branch_Unit,ip_OR_Branch_en,
ip_PC,op_EX_MEM_PC,ip_MemWrite,ip_MemRead,
                       ip_MemtoReg,op_MemWrite,op_MemRead,op_MemtoReg,ip_Imm_signal,ip_Data_out1,op_Data_out1,
                     //  op_EX_MEM_ADD_J,
                       op_EX_MEM_ALU,op_EX_MEM_Data_out2,
                       //op_Branch_Unit,op_OR_Branch_en,
                       op_Imm_signal,
                       ip_Instruction,op_Instruction,ip_RegWrite,op_RegWrite);
         input clk;
         input reset;
         input [31:0] ip_PC;
   //      input [31:0] ip_Add_J;
         input [31:0] ip_ALU;
         input [31:0] ip_Data_out2;
   //      input ip_Branch_Unit;
 //        input ip_OR_Branch_en;
         input ip_MemWrite;
         input ip_MemRead;
         input [1:0] ip_MemtoReg;
         input [31:0] ip_Instruction;
         input ip_RegWrite;     
         input ip_Imm_signal;
         input [31:0] ip_Data_out1;
         output reg [31:0] op_Data_out1;
         output reg op_Imm_signal;
         output reg op_RegWrite;
         output reg [31:0] op_Instruction; 
         output reg op_MemWrite;
         output reg op_MemRead;
         output reg [1:0] op_MemtoReg;
//         output reg [31:0] op_EX_MEM_ADD_J;
         output reg [31:0] op_EX_MEM_Data_out2;
  //       output reg op_Branch_Unit;
  //       output reg op_OR_Branch_en;
         output reg [31:0] op_EX_MEM_ALU;
         output reg [31:0] op_EX_MEM_PC;
         
         always @ (negedge clk) begin
            if(reset) begin
           //     op_EX_MEM_ADD_J <= 32'b0;   
                op_EX_MEM_ALU <= 32'b0;     
                op_EX_MEM_Data_out2 <= 32'b0;
      //          op_Branch_Unit <= 1'b0;  
    //            op_OR_Branch_en <= 1'b0;
                op_EX_MEM_PC <= 32'b0;
                op_MemWrite <= 1'b0;
                op_MemRead <= 1'b0;
                op_MemtoReg <= 2'b0;
                op_Instruction <= 32'b0;
                op_RegWrite <= 1'b0;
                op_Imm_signal <= 1'b0;
                op_Data_out1 <= 32'b0;
            end 
            else begin
         //       op_EX_MEM_ADD_J <= ip_Add_J;
                op_EX_MEM_ALU <= ip_ALU;
                op_EX_MEM_Data_out2 <= ip_Data_out2;
       //         op_Branch_Unit <= ip_Branch_Unit;
     //           op_OR_Branch_en <= ip_OR_Branch_en;
                op_EX_MEM_PC <= ip_PC;
                op_MemWrite <= ip_MemWrite; 
                op_MemRead  <= ip_MemRead;  
                op_MemtoReg <= ip_MemtoReg;
                op_Instruction <= ip_Instruction;
                op_RegWrite <= ip_RegWrite;
                op_Imm_signal <= ip_Imm_signal;
                op_Data_out1 <= ip_Data_out1;
            end
         end
endmodule
