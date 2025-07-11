`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2024 06:27:15 PM
// Design Name: 
// Module Name: Reg_file
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


module Reg_file(Data_in,Read_Reg1,Read_Reg2,Write_Reg,RegWrite,clk,reset,Data_out1,Data_out2);
    //<---------------Port Declarations---------------------->
    //Data_in : Write Back Data
    //Read_Reg1, Read_Reg2 are Source Registers (Ex. rs1,rs2)
    //Write_Reg : Destination Register (Ex. rd)
    //RegWrite : Control Signal
    //Data_out1 : First Output Port
    //Data_out2 : Second Output Port
    //clk: Clock Signal , reset : Reset Signal
    //<------------------------------------------------------->
    input [31:0]Data_in;
    input [4:0] Read_Reg1,Read_Reg2,Write_Reg;
    input RegWrite;
    input clk,reset;
    output reg [31:0] Data_out1,Data_out2;
//    reg [31:0] Data_out1,Data_out2;
    //Declaration of Array
    reg [31:0] R_file [31:0];
    
    
    
    // 1.> LOAD dATA INSTRUCTIONS-------------------------------> 
    //<-----------------First OUTPUT PORT------------------------->
//    always @(negedge clk)
    always @(posedge clk)
        begin
            if(reset)                      // If Reset is High , No Data is Loaded
                    Data_out1<=32'b0;
            else  begin 
                if(Write_Reg==Read_Reg1 && RegWrite)        // If Control Siganl is High and input_Reg1==Write_Reg Data is Stored.
                    Data_out1<=Data_in;              
                else                               // Else Data will be Loaded.  
                    Data_out1<=R_file[Read_Reg1];
             end             
        end
    //<-----------------Second OUTPUT PORT--------------------------->
//    always @(negedge clk)
    always @(posedge clk)
        begin
            if(reset)                       // If Reset is High , No Data is Loaded
                Data_out2<=32'b0;
            else  begin 
                if(Write_Reg==Read_Reg2 && RegWrite)       // If Control Signal is High and input_Reg2=Write_Reg Data is Stored.
                    Data_out2<=Data_in;                
                    
                else                                  // Else Data will be Loaded.  
                    Data_out2<=R_file[Read_Reg2];         
            end
        end
    //2.> STORE DATA INSTRUCTIONS
    integer i=0;
//    always @(posedge clk)
    always @(negedge clk)
        begin
            if(reset)  begin
                // If reset is High Then Assign Values to register is 0 
                    for(i=0;i<32;i=i+1) begin
                          R_file[i]<=32'b0;
                     end
            end
            else   begin 
                    if(RegWrite && Write_Reg!=0)        //If Control Signal is High , Data is Written.
                        R_file[Write_Reg]=Data_in;
                    else 
                        R_file <= R_file;
            end
      end
endmodule
