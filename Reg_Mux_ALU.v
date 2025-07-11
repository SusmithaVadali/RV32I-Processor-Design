`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2024 03:54:22 PM
// Design Name: 
// Module Name: Reg_Mux_ALU
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


module Reg_Mux_ALU(ip_Data_out2,ip_Imm_Gen,Data_out,
                    //sel_ALUSrc,
                    op_PC,ip_EX_MEM_ALU_Result,sel_ForwardB,ip_MEM_WB_WriteBack);
    //<--------------------PORT DECLARAION------------->
    input [31:0] ip_Data_out2;       // Second output port of Register file.
    input [31:0] ip_Imm_Gen;         // Output of immediate generator
   // input [1:0] sel_ALUSrc;               // Select input of Mux
    input [31:0] op_PC;
    input [31:0] ip_EX_MEM_ALU_Result;    // Output of ALU from EX-MEM Stage
    input [31:0] ip_MEM_WB_WriteBack;     // Output of WriteBack MUX from MEM-WB Stage
    input [2:0] sel_ForwardB;           // Output from Forwarding Unit
    output reg [31:0] Data_out;     // Output of MUX
    //<------------------------------------------------->
    always @ (*)
        begin                                
       // ALUSrc MUX logic  
            case(sel_ForwardB)
                3'b000 : begin
                     Data_out <= ip_Data_out2;
                end     
                3'b001 : begin
                    Data_out <= ip_Imm_Gen;
                end
                3'b010 : begin
                    Data_out <= op_PC;
                end 
                3'b110 : begin
                    Data_out <= ip_EX_MEM_ALU_Result;
                end
                3'b101 : begin
                    Data_out <= ip_MEM_WB_WriteBack;
                end
                default :
                    Data_out <= 32'b0;  
            endcase      
        end   
endmodule
