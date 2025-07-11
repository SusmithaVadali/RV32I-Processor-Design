`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2024 08:37:22 PM
// Design Name: 
// Module Name: Add_PC
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


module Add_PC(ip_clk,ip_rst,ip_add,ip_PCWrite,op_add,
//pc_temp,
ip_delay_PC
//ip_delay_Branch
);
//<--------------PORT DECLARATION------------------------------->
    input [31:0] ip_add;  
    input ip_clk;                     // Output from PC 
    input ip_rst;                     // Output from PC 
//    input [3:0] ip_4bit;                      // 4-bit input of ADDER
    input ip_PCWrite;                  // PC Signal From Hazard Dection Unit
    input [31:0] ip_delay_PC;
//    input ip_delay_Branch;
    output reg [31:0] op_add;                // Output of ADDER
  //  output reg [31:0] pc_temp;                // point to current instruction
//    reg [31:0] prev_PC;
    //<-----------------------ADD----------------------------->
always @ (negedge ip_clk)begin 
    if(ip_rst)begin
        op_add<=32'd0; 
    end
    else begin
        if(!ip_PCWrite)begin 
            op_add<= ip_add + 32'd4;
        end
  /*      else if(ip_delay_Branch)begin
           op_add <= ip_delay_PC;
        end
  */      
        else begin 
            op_add <= ip_delay_PC;
        end
    end
end
/*
always @ (negedge ip_clk)begin 
    pc_temp <= op_add; 
end
*/
endmodule
