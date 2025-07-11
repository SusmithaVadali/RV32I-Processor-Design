`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2024 02:50:31 PM
// Design Name: 
// Module Name: ALU_Unit
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
module ALU_Unit(Read_data1,Mux_Data,ALU_Control,ALU_Result);
    //<-----------------PORT DECLARATION----------------------------->
    input [31:0] Read_data1;       // Output of first output port of Register file.
    input [31:0] Mux_Data;         // Output of Second output port of Register file and immidiate generator.
    input [5:0] ALU_Control;       // Output of ALU control Unit.
    output reg [31:0] ALU_Result;  //Output of ALU unit.
    //<-------------------ALU Operations------------------------------>
    always @(*)
        begin
            case(ALU_Control)
        //<-----------------Instructions------------------------->
                add_ctrl : begin 
                    ALU_Result <= Read_data1 + Mux_Data; 
                end
                sub_ctrl : begin
                    ALU_Result <= Read_data1-Mux_Data;
                end
                and_ctrl : begin
                    ALU_Result <= Read_data1 & Mux_Data;
                end
                or_ctrl : begin
                    ALU_Result <= Read_data1 | Mux_Data;
                end
                xor_ctrl : begin
                    ALU_Result <= Read_data1 ^ Mux_Data;
                end
                sll_ctrl : begin
                    ALU_Result <= Read_data1 << Mux_Data[4:0];
                end
                slt_ctrl : begin
                    ALU_Result <= (($signed(Read_data1) - $signed(Mux_Data))<0) ? 1:0;
                end
                sltu_ctrl : begin
                    ALU_Result <= ((Read_data1) < (Mux_Data)) ? 1:0;
                end 
                srl_ctrl : begin
                    ALU_Result <= Read_data1 >> Mux_Data[4:0];
                end 
                sra_ctrl : begin
                    ALU_Result <= Read_data1 >>> Mux_Data[4:0];
                end
                default : ALU_Result <= 32'b0;
            endcase
        end
    
endmodule
