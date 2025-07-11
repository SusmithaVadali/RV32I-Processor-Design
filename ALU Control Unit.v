`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/03/2024 01:54:04 PM
// Design Name: 
// Module Name: ALU_CTRL_UNIT
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

include "Parameters.vh";
module ALU_CTRL_UNIT(Instruction,ALUOp,ALUCtrl);
    //<------------------------PORT DECLARATION-------------------->
    input [31:0] Instruction;                     // Complete Intruction as an input
    input [1:0] ALUOp;                            // ALU Opcode from Control Unit
    output reg [5:0] ALUCtrl;                     // Output of ALU Control Unit
    reg Inst;                                // 31th bit of Instruction
    reg [2:0] funct3;                            // function 3 of Instruction
    //<------------------------------------------------------------->
    always @(*)
        begin
            Inst=Instruction[30];
            funct3=Instruction[14:12];
         if(Instruction==32'b0) begin 
            ALUCtrl = 0;
         end
         else begin 
            case(ALUOp)
            //<------------------------R-Type Instruction------------------------>
              2'b10 : begin 
                    case(funct3)
                        3'b000: begin 
                            if(Inst==1'b0)
                                ALUCtrl <= add_ctrl;              // Addition Operation
                            else
                                ALUCtrl <= sub_ctrl;             // Subtraction Operation
                        end
                        3'b111: begin
                                ALUCtrl <= and_ctrl;             // And Operation
                        end
                        3'b110: begin
                                ALUCtrl <= or_ctrl;               // OR Operation
                        end
                        3'b100: begin
                                ALUCtrl <= xor_ctrl;               // Xor Operation
                        end
                        3'b001: begin
                                ALUCtrl <= sll_ctrl;               // Shift Left Logic Operation
                        end
                        3'b010: begin
                                ALUCtrl <= slt_ctrl;               // Set Less Than Operation
                        end
                        3'b011: begin
                                ALUCtrl <= sltu_ctrl;            // Set Less Than Unsigned Operation
                        end
                        3'b101: begin
                            if(Inst==1'b0)
                                ALUCtrl <= srl_ctrl;             // Shift Right Logic Operation
                            else
                                ALUCtrl <= sra_ctrl;    
                        end
                        default: ALUCtrl <= 6'b0;  // Default case
                    endcase
                end
          //<-------------------------------------I-Type Instructions----------------------------->
              2'b11: begin
                case(funct3)
                    3'b000: begin
                        ALUCtrl <= add_ctrl;                    // Addition Immediate Operation
                    end
                    3'b111: begin
                        ALUCtrl <= and_ctrl;                   // AND  Immediate Operation
                    end
                    3'b110: begin
                        ALUCtrl <= or_ctrl;                    // OR Immediate Operation
                    end
                    3'b100: begin
                        ALUCtrl <= xor_ctrl;                    // XOR Immediate Operation
                    end
                    3'b001: begin
//                        if(Inst[30]==1'b0)
                            ALUCtrl <= sll_ctrl;                  // Shift Left Logic Immediate Operation
                    end
                    3'b010: begin
                        ALUCtrl <= slt_ctrl;                      // Set Less Than Immediate Operation
                    end
                    3'b011: begin
                        ALUCtrl <= sltu_ctrl;                    // Set Less Than Immediate Unsigned Operation
                    end
                    3'b101: begin
                        if(Inst==1'b0)
                            ALUCtrl <= srl_ctrl;                  // Shift Right Logic Immediate Operation
                        else
                            ALUCtrl <= sra_ctrl;                // Shift Airthmetic Immediate Operation
                    end
                    default: ALUCtrl <= 6'b0; 
                endcase
              end
              //<--------------------------LOAD-STORE Instructions------------------------------->
              2'b00 : begin
                case(funct3)
                    3'b000: begin
                        ALUCtrl <= add_ctrl;
                    end
                    3'b001: begin
                        ALUCtrl <= add_ctrl;
                    end
                    3'b010: begin
                        ALUCtrl <= add_ctrl;
                    end
                    3'b100: begin
                        ALUCtrl <= add_ctrl;
                    end    
                    3'b101: begin
                        ALUCtrl <= add_ctrl;
                    end
                    default : ALUCtrl <= 6'b0;
                endcase
              end
              default: ALUCtrl <= 6'b0; // Default case for ALUOp    
            endcase
           end      
        end
endmodule
