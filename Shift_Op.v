`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2024 06:42:11 PM
// Design Name: 
// Module Name: Shift_Op
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


module Shift_Op(Immediate,op_shift_left);
    //<----------------PORT DECLARATION-------------------->
    input [31:0] Immediate ;                       // Output of Immediate
    output  [31:0] op_shift_left;              // Output after left Shift by one.
    // Shifting Right Operation
    assign op_shift_left = Immediate << 1;
    
endmodule
