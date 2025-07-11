`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2024 09:17:42 PM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(Instruction,RegWrite,ALUSrc,ALUOp,MemtoReg,MemRead,MemWrite,Branch_En,Jump,Imm_signal);
//<----------------PORT DECLARATION------------------------------>
    input [31:0] Instruction;   
    output reg RegWrite;
    output reg [1:0] ALUSrc;
    output reg [1:0]ALUOp;
    output reg [1:0] MemtoReg;
    output reg MemRead;
    output reg MemWrite;
    output reg Jump;
    output reg Imm_signal;
  //  output reg PCSrc;
    output reg Branch_En;
    // Divide and Declare the Instruction Part......
    reg [6:0] opcode;                         // Opcode (7 bits)
  
    always @(*)
        begin
            opcode=Instruction[6:0];
        end
     //<------------------------------------------------------------>
     always @ (*)
        begin
            case(opcode)
                7'b0110011 :                        // R-Type Instruction Set
                    begin
                        RegWrite <= 1'b1;
                        ALUSrc <= 2'b00;
                        ALUOp <= 2'b10;
                        MemtoReg <= 2'b00;
                        MemRead <= 1'b0;
                        MemWrite <= 1'b0;
                      //  PCSrc <= 1'b0;
                        Branch_En <= 1'b0;
                        Jump <= 1'b0;
                        Imm_signal<=1'b0;
                    end
                7'b0010011 :                         // I-Type Instruction Set
                    begin
                        RegWrite <= 1'b1;
                        ALUSrc <= 2'b01;
                        ALUOp <= 2'b11;
                        MemtoReg <= 2'b00;
                        MemRead <= 1'b0; 
                        MemWrite <= 1'b0;
                    //    PCSrc <= 1'b0;
                        Branch_En <= 1'b0;
                        Jump <= 1'b0;
                        Imm_signal<=1'b1;
                    end
                7'b0000011 :                       // LOAD-STORE Instruction Set 
                    begin
                        RegWrite <= 1'b1;
                        ALUSrc <= 2'b01;
                        ALUOp <= 2'b00;
                        MemtoReg <= 2'b01;
                        MemRead <= 1'b1; 
                        MemWrite <= 1'b0;
                     //   PCSrc <= 1'b0;
                        Branch_En <= 1'b0;
                        Jump <= 1'b0;
                        Imm_signal<=1'b1;
                    end
                7'b1101111 :                      // J-Type Instruction Set
                    begin
                        RegWrite <= 1'b1;
                        ALUSrc <= 2'b01;
                        ALUOp <= 2'b00;
                        MemtoReg <= 2'b10;
                        MemRead <= 1'b0; 
                        MemWrite <= 1'b0;
                    //    PCSrc <= 1'b1;
                        Branch_En <= 1'b0;  
                        Jump <= 1'b1;
                        Imm_signal<=1'b0;
                    end
                7'b1100111 :                      // I-Type Jump Instruction Set
                    begin
                        RegWrite <= 1'b1;
                        ALUSrc <= 2'b01;
                        ALUOp <= 2'b00;
                        MemtoReg <= 2'b10;
                        MemRead <= 1'b0; 
                        MemWrite <= 1'b0;
                        //  PCSrc <= 1'b1;
                        Branch_En <= 1'b0;  
                        Jump <= 1'b1;
                        Imm_signal<=1'b1;
                         
                    end    
                7'b0100011 :                     // S-Type Instruction Set
                    begin
                        RegWrite <= 1'b0;
                        ALUSrc <= 2'b01;
                        ALUOp <= 2'b00;
                        MemtoReg <= 2'b01;
                        MemRead <= 1'b0; 
                        MemWrite <= 1'b1;
                    //    PCSrc <= 1'b0;
                        Branch_En <= 1'b0;
                        Jump <= 1'b0;
                        Imm_signal<=1'b1;
                    end 
                7'b1100011 :                      // B-Type Instruction Set
                    begin
                        RegWrite <= 1'b0;
                        ALUSrc <= 2'b00;
                        ALUOp <= 2'b01;
                        MemtoReg <= 2'b00;
                        MemRead <= 1'b0; 
                        MemWrite <= 1'b0; 
                      //  PCSrc <= 1'b1; 
                        Branch_En <= 1'b1;
                        Jump <= 1'b0; 
                        Imm_signal<=1'b1;
                    end
                7'b0110111 :                      // U-Type Instruction Set
                    begin
                        RegWrite <= 1'b0;
                        ALUSrc <= 2'b10;
                        ALUOp <= 2'b00;
                        MemtoReg <= 2'b00;
                        MemRead <= 1'b0; 
                        MemWrite <= 1'b0;
                    //    PCSrc <= 1'b1; 
                        Branch_En <= 1'b0;
                        Jump <= 1'b0;  
                        Imm_signal<=1'b1;
                    end
                 7'b0010111 :                      // U-Type Instruction Set
                    begin
                        RegWrite <= 1'b0;   
                        ALUSrc <= 2'b10;    
                        ALUOp <= 2'b00;    
                        MemtoReg <= 2'b00; 
                        MemRead <= 1'b0;   
                        MemWrite <= 1'b0;  
                     //     PCSrc <= 1'b1;   
                        Branch_En <= 1'b0; 
                        Jump <= 1'b0;
                        Imm_signal<=1'b1;
                        end      
                default : begin
                        RegWrite <= 1'b0;
                        ALUSrc <= 2'b00;
                        ALUOp <= 2'b00;
                        MemtoReg <= 2'b00;
                        MemRead <= 1'b0; 
                        MemWrite <= 1'b0;
                     //   PCSrc <= 1'b0;
                        Branch_En <= 1'b0;
                        Jump <= 1'b0;
                        Imm_signal<=1'b0;
                        
                end
            endcase
        end
        
endmodule
