`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2024 04:14:22 PM
// Design Name: 
// Module Name: Immediate
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


module Immediate(instruction,immediate);
    //<---------------PORT DELCARATION-------------->
    input [31:0] instruction;
    output reg  [31:0] immediate;
    wire [6:0] opcode = instruction[6:0];
    wire [2:0] funct3 = instruction[14:12];
    
        always @(*) begin
            case (opcode)
                7'b0010011,  //I-type
                7'b0000011, 
                7'b1100111:  
                    immediate = {{20{instruction[31]}}, instruction[31:20]}; 
    
                7'b0100011:  // S-type
                    immediate = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]}; 
    
                7'b1100011:  // B-type 
                    immediate = {{19{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0}; 
    
                7'b0110111,  // U-type
                7'b0010111: 
                    immediate = {instruction[31:12], 12'b0}; 
    
                7'b1101111:  // J-type 
                    immediate = {{11{instruction[31]}}, instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0};
    
                default:
                    immediate = 32'b0; // Default case
            endcase
        end
endmodule
