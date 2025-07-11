`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2024 08:46:17 PM
// Design Name: 
// Module Name: Add_J
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


module Add_J(ip_Add_PC,ip_Shift,op_Add);
//<-------------PORT DECLARATION--------------------->
    input [31:0] ip_Add_PC;
//    input ip_rst; 
    input [31:0] ip_Shift;
    output reg [31:0] op_Add;
 //<---------------------------------------------->
 always @ (*)
    begin
        op_Add <= ip_Add_PC + ip_Shift;   
    end   
endmodule
