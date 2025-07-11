`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2024 04:05:33 PM
// Design Name: 
// Module Name: ID_EX_Register
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


module ID_EX_Register(clk,reset,
//ip_IF_ID_PC_temp,
ip_IF_ID_PC,ip_Data_out1,ip_Data_out2,ip_immediate,ip_Instruction,ip_ALUSrc,ip_Imm_signal,
        ip_ALUOp,ip_MemRead,ip_MemWrite,ip_MemtoReg,op_ALUSrc,op_ALUOp,op_MemRead,op_MemWrite,op_MemtoReg,
      //  op_ID_EX_PC_temp, 
        op_ID_EX_PC,op_Imm_signal,
       op_ID_EX_Data_out1,op_ID_EX_Data_out2,op_immediate,op_Instruction,
       //ip_Branch_Unit,op_Branch_Unit,
      //  ip_OR_Branch_en,op_OR_Branch_en,
      ip_RegWrite,op_RegWrite);
        input clk;                                                                   
        input reset;
  //      input [31:0] ip_IF_ID_PC_temp;
        input [31:0] ip_IF_ID_PC;
        input [31:0] ip_Data_out1;
        input [31:0] ip_Data_out2;
        input [31:0] ip_immediate;
        input [31:0] ip_Instruction;
        input [1:0] ip_ALUSrc;
        input [1:0] ip_ALUOp;
        input ip_MemRead;
        input ip_MemWrite;
        input [1:0] ip_MemtoReg;
    //    input ip_Branch_Unit;
    //    input ip_OR_Branch_en;
        input ip_RegWrite;     
        input ip_Imm_signal;
        output reg op_RegWrite;
    //    output reg op_OR_Branch_en;
   //     output reg op_Branch_Unit;
        output reg [1:0] op_ALUSrc;
        output reg [1:0] op_ALUOp;
        output reg op_MemRead;
        output reg op_MemWrite;
        output reg [1:0] op_MemtoReg;
   //     output reg [31:0] op_ID_EX_PC_temp;
        output reg [31:0] op_ID_EX_PC;
        output reg [31:0] op_ID_EX_Data_out1;
        output reg [31:0] op_ID_EX_Data_out2;
        output reg [31:0] op_immediate;
        output reg [31:0] op_Instruction;
        output reg op_Imm_signal;
        
        always @ (negedge clk) begin
            if(reset) begin
          //     op_ID_EX_PC_temp <= 32'b0;
               op_ID_EX_PC <= 32'b0;     
               op_ID_EX_Data_out1 <= 32'b0;    
               op_ID_EX_Data_out2 <= 32'b0;   
               op_immediate <= 32'b0;
               op_Instruction <= 32'b0;
               op_ALUSrc <= 2'b0;  
               op_ALUOp <= 2'b0;   
               op_MemRead <= 1'b0;       
               op_MemWrite <= 1'b0;         
               op_MemtoReg <= 2'b0;
     //          op_OR_Branch_en <= 1'b0;
       //        op_Branch_Unit <= 1'b0;
               op_RegWrite <= 1'b0;
               op_Imm_signal<= 1'b0;
            end
            else begin
     //           op_ID_EX_PC_temp <= ip_IF_ID_PC_temp;
                op_ID_EX_PC <= ip_IF_ID_PC;     
                op_ID_EX_Data_out1 <= ip_Data_out1;    
                op_ID_EX_Data_out2 <= ip_Data_out2;    
                op_immediate <= ip_immediate;
                op_Instruction <= ip_Instruction;  
                op_ALUSrc <= ip_ALUSrc;   
                op_ALUOp  <= ip_ALUOp;  
                op_MemRead <= ip_MemRead; 
                op_MemWrite <= ip_MemWrite;
                op_MemtoReg <= ip_MemtoReg; 
       //         op_OR_Branch_en <= ip_OR_Branch_en;
        //        op_Branch_Unit <= ip_Branch_Unit;
                op_RegWrite <= ip_RegWrite;
                op_Imm_signal<= ip_Imm_signal;
            end
        end
        
endmodule
