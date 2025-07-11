`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2024 03:48:19 PM
// Design Name: 
// Module Name: Branch_Unit
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


module Branch_Unit(Instruction,ip_read_data1,ip_read_data2,Branch_En,op_Branch_Unit);
    //<------------------PORT DECLARATION--------------------->
    input [31:0] Instruction;                 // Complete Instruction
    input Branch_En;                         // Enable Signal
    input [31:0] ip_read_data1;              // Output of first port of Register file
    input [31:0] ip_read_data2;              // Output of second port of Register file
    output reg  op_Branch_Unit;             // Output of Branching Unit
    reg [2:0] funct3;

    always @ (*)
        begin
            funct3 = Instruction[14:12];
            op_Branch_Unit = 1'b0;
            if(Branch_En) begin
                    case(funct3)
                        3'b000 : begin                            // Branch-Equal Instruction (ex. beq)
                            op_Branch_Unit = (ip_read_data1 == ip_read_data2) ? 1'b1 : 1'b0;
                        end
                        3'b001 : begin                           // Branch-NOT-Equal Instruction (ex. bne)
                           op_Branch_Unit = (ip_read_data1 != ip_read_data2) ? 1'b1 : 1'b0;
                        end
                        3'b100 : begin                             // Branch if Less Than (ex. blt)
                            op_Branch_Unit = ($signed(ip_read_data1) < $signed(ip_read_data2)) ? 1'b1 : 1'b0;         
                        end
                        3'b101 : begin                           // Branch if Greater Than or Equal (ex. bge)
                            op_Branch_Unit = ($signed(ip_read_data1) >= $signed(ip_read_data2)) ? 1'b1 : 1'b0;      
                        end
                        3'b110 : begin                          // Branch if Less Than Unsigned (ex. bltu)
                            op_Branch_Unit = ($unsigned(ip_read_data1) < $unsigned(ip_read_data2)) ? 1'b1 : 1'b0;
                        end 
                        3'b111 : begin                       // Branch if Greater Than or Equal Unsigned (ex. bgeu)
                            op_Branch_Unit = ($unsigned(ip_read_data1) >= $unsigned(ip_read_data2)) ? 1'b1 : 1'b0;
                        end
                        default : begin
                            op_Branch_Unit <= 1'b0;
                        end
                    endcase
                end
        end
    
endmodule
