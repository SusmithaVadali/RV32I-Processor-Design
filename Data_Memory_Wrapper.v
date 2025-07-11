`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2024 03:37:51 PM
// Design Name: 
// Module Name: Data_Memory_Wrapper
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


module Data_Memory_Wrapper(
    BRAM_PORTA_0_addr,
    i_clk, 
    BRAM_PORTA_0_din,
    BRAM_PORTB_0_addr,
    MemWrite,
    MemRead,
    funct3,
    BRAM_PORTB_Wr_out
    );
    //<--------------------------PORT DECLARATION------------------------>
    input [9:0]BRAM_PORTA_0_addr;
    input i_clk; 
    input [31:0]BRAM_PORTA_0_din;
    input [9:0]BRAM_PORTB_0_addr;
    input MemWrite;
    input MemRead;
    input [2:0] funct3;
    output reg [31:0]BRAM_PORTB_Wr_out;
    reg [3:0]BRAM_PORTA_0_we;
    //<--------------------------net-port----------------------------------->
    wire [31:0]BRAM_PORTB_0_dout;
    // Instantiate The Module
    d_m_wrapper DM(
    .BRAM_PORTA_0_addr(BRAM_PORTA_0_addr),
    .BRAM_PORTA_0_clk(i_clk),
    .BRAM_PORTA_0_din(BRAM_PORTA_0_din),
    .BRAM_PORTA_0_we(BRAM_PORTA_0_we),
    .BRAM_PORTB_0_addr(BRAM_PORTB_0_addr),
    .BRAM_PORTB_0_clk(i_clk),
    .BRAM_PORTB_0_dout(BRAM_PORTB_0_dout)
    );
    //<------------LOAD-STORE Operation--------------------->
    always @ (*)
        begin
        BRAM_PORTA_0_we = 4'b0000;  // Default to 0 to avoid latches
        BRAM_PORTB_Wr_out = 32'b0;  // Default to 0 to avoid latches 
        //<--------------------STORE Operation--------------->
            if(MemWrite == 1'b1) begin
                case(funct3)
                    3'b000 : begin                                 // Store-Byte Operation
                        BRAM_PORTA_0_we <= 4'b0001;
                    end
                    3'b001 : begin                                // Store-Half Word Operation
                        BRAM_PORTA_0_we <= 4'b0011;
                    end
                    3'b010 : begin                               // Store-Word Operation
                         BRAM_PORTA_0_we <= 4'b1111;
                    end
                    default : begin
                         BRAM_PORTA_0_we <= 4'b0000;
                            
                    end
                endcase  
            end
        //<-------------------LOAD Operation------------------------------->
            else if (MemRead == 1'b1) begin
                BRAM_PORTA_0_we   <= 4'b0000;
                case(funct3)
                    3'b000 : begin                                  // Load-Byte Operation   
                        BRAM_PORTB_Wr_out <= $signed(BRAM_PORTB_0_dout[7:0]);
                    end
                    3'b001 : begin                                  // Load-Half Operation
                        BRAM_PORTB_Wr_out <= $signed(BRAM_PORTB_0_dout[15:0]);
                    end
                    3'b010 : begin                                   // Load-World Operation
                       BRAM_PORTB_Wr_out <= $signed(BRAM_PORTB_0_dout[31:0]);
                    end
                    3'b100 : begin                                    // Load-Byte Unsigned Operation                         
                        BRAM_PORTB_Wr_out <= $unsigned(BRAM_PORTB_0_dout[7:0]);
                    end 
                    3'b101 : begin                                    // Load-Half Unsigned Operation                                                   
                        BRAM_PORTB_Wr_out <= $unsigned(BRAM_PORTB_0_dout[15:0]);
                    end
                    default : begin
                        BRAM_PORTB_Wr_out <= 32'b0;
                    end  
                endcase
            end
        end       
endmodule
