`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2024 07:11:50 PM
// Design Name: 
// Module Name: NOP_MUX
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


module NOP_MUX(ip_NOP_Instruction,sel_Hazard_Unit, ALUSrc,ALUOp,MemtoReg,MemRead,MemWrite,ip_OR_Branch_en,ip_RegWrite,op_NOP_MUX);
    //<-----------------PORT DECLARATION---------------------->                      
//    input [9:0] ip_Control_Unit;                    // output of Control Unit
    input [9:0] ip_NOP_Instruction;               // NOP Instuction 0x00000013
    input sel_Hazard_Unit;                         // Select input from Hazard Control Unit
    input [1:0] ALUSrc;  
    input [1:0] ALUOp;    
    input [1:0] MemtoReg;
    input MemRead;       
    input MemWrite; 
    input ip_OR_Branch_en;
    input ip_RegWrite;     
    output reg [9:0] op_NOP_MUX;                   // Output of NOP MUX
    // Assiging value to ip_Nop_Instruction
   // assign  ip_NOP_Instruction = 9'h0;
    // Assiging value to ip_Control_Unit
//    assign {ALUSrc,ALUOp,MemtoReg,MemRead,MemWrite,ip_OR_Branch_en} = ip_Control_Unit;
    always @ (*) begin
        case(sel_Hazard_Unit)
            1'b1 : begin
                op_NOP_MUX <= ip_NOP_Instruction;
            end
            1'b0 : begin
//                op_NOP_MUX <= ip_Control_Unit;
                op_NOP_MUX <= {ip_RegWrite,ip_OR_Branch_en,MemWrite,MemRead,MemtoReg,ALUOp,ALUSrc};
            end    
        endcase
    end
endmodule
