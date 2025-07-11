`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2024 06:42:38 PM
// Design Name: 
// Module Name: Hazard_Detection_Unit
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


module Hazard_Detection_Unit(ip_IF_ID_RegisterRS1,ip_IF_ID_RegisterRS2,ip_OR_Branch,
//op_OR_Branch,
ip_ID_EX_RegisterRD,ip_ID_EX_MemRead,ip_PCWrite,op_Hazard_Unit);
    //<----------------------PORT DECLARATION---------------------->
    input [4:0] ip_IF_ID_RegisterRS1;                // Source Register RS1
    input [4:0] ip_IF_ID_RegisterRS2;               //  Source Register RS2
    input [4:0] ip_ID_EX_RegisterRD;                // Destination Register RD
    input ip_ID_EX_MemRead;
    input ip_OR_Branch;
  //  output reg op_OR_Branch;
    output reg ip_PCWrite;
    output reg op_Hazard_Unit;
  //  output reg op_OR_Branch;
    //<---------------Combination Logic---------------------------->
    always @ (*) begin
        if ((ip_ID_EX_MemRead) &&
           ((ip_ID_EX_RegisterRD == ip_IF_ID_RegisterRS1) ||
           (ip_ID_EX_RegisterRD == ip_IF_ID_RegisterRS2)))
           begin
                op_Hazard_Unit <= 1'b1;
                ip_PCWrite <= 1'b1;
              //  op_OR_Branch <= 1'b0;
           end
        else if (ip_ID_EX_MemRead && (ip_OR_Branch) &&
                ((ip_ID_EX_RegisterRD == ip_IF_ID_RegisterRS1) ||
                   (ip_ID_EX_RegisterRD == ip_IF_ID_RegisterRS2)))
                   begin
                        op_Hazard_Unit <= 1'b1;
                        ip_PCWrite <= 1'b0;
                      //  op_OR_Branch <= 1'b1;
                   end                
        else begin
                op_Hazard_Unit <= 1'b0;
                ip_PCWrite <= 1'b0;  
             //   op_OR_Branch <= 1'b0;    
         end
    end   
endmodule
