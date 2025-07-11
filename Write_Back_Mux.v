`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2024 04:49:57 PM
// Design Name: 
// Module Name: Write_Back_Mux
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


module Write_Back_Mux(ip_alu_result,ip_Read_Data,sel_MemtoReg,op_Writeback_mux,op_PC);
    //<-----------------------PORT DECLARATION--------------------------------->
    input [31:0] ip_alu_result;                 // Output of ALU
    input [31:0] ip_Read_Data;                  // Output of DATA MEMORY ACCESS
    input [1:0] sel_MemtoReg;                  // Select input Memory to Register
    input [31:0] op_PC;                        // Output of Actual PC
    output reg [31:0] op_Writeback_mux;        // Writeback Output
    //<-------------------------------------------------------------------------->
    always @(*)
        begin
            case(sel_MemtoReg)
                2'b00 : op_Writeback_mux <= ip_alu_result;
                2'b01 : op_Writeback_mux <= ip_Read_Data;
                2'b10 : op_Writeback_mux <= op_PC;
 
                default : op_Writeback_mux <= 32'b0; 
            endcase
        end
endmodule
