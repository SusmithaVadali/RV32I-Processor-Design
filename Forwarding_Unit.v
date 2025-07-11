`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2024 03:05:44 PM
// Design Name: 
// Module Name: Forwarding_Unit
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


module Forwarding_Unit(ip_ID_EX_RegisterRS1,ip_ID_EX_RegisterRS2,ip_EX_MEM_RegisterRD,ip_MEM_WB_RegisterRD,
                        ip_MEM_WB_RegWrite,ip_EX_MEM_RegWrite,ip_Imm_signal,op_ForwardA,op_ForwardB,sel_ALUSrc,
                        op_ForwardC,op_ForwardD);
    //<-------------------------PORT DECLARATION------------------------------>
    input [4:0] ip_ID_EX_RegisterRS1;                // First Source Register, Ex.(rs1)
    input [4:0] ip_ID_EX_RegisterRS2;               // Second Source Register, Ex.(rs2)
    input [4:0] ip_EX_MEM_RegisterRD;               // Destination Register from EX-MEM Stage
    input [4:0] ip_MEM_WB_RegisterRD;              // Destination Register from MEM-EX Stage
    input ip_MEM_WB_RegWrite;                      // Control Signal of Register File in MEM-WB Stage
    input ip_EX_MEM_RegWrite;                     // Control Signal of Register File in EX-MEM Stage
    input  [1:0] sel_ALUSrc;
    input ip_Imm_signal;                          // input from EX_MEM pipelined register
    output reg [2:0] op_ForwardA;                 // Forwarded Signal Which Enable ALU unit
    output reg [2:0] op_ForwardB;                 // Forwarded Signal Which Enable Data Memory Unit
    output reg op_ForwardC;                      // Forwarding Signal for Branch Unit
    output reg op_ForwardD;                      // Forwarding Signal for Branch Unit
    //<-------------------------------------------------------------------------->
    //<----------------------------Logic for removing Hazard--------------------->
    always @ (*) begin
//          op_ForwardA <= 2'b00;
//        op_ForwardB <= 2'b00;
    // EX-Stage Hazard Control Logic
    //<------------------------------------------------------------------------------------------>
        if ((ip_EX_MEM_RegWrite) &&
        (ip_EX_MEM_RegisterRD != 0) &&
        (ip_EX_MEM_RegisterRD == ip_ID_EX_RegisterRS1)) 
            begin
                op_ForwardA <= 3'b110;
            end                      
    //<----------------------------------------------------------------------------------------->
//        if ((ip_EX_MEM_RegWrite) &&
//        (ip_EX_MEM_RegisterRD != 0) &&
//        (ip_EX_MEM_RegisterRD == ip_ID_EX_RegisterRS2)) 
//            begin
//                op_ForwardB <= 3'b110;
//            end   
//            else begin 
//                op_ForwardB <= {1'b0,sel_ALUSrc};
//            end    
    //<------------------------------------------------------------------------------------------>
    // MEM-Stage Hazrad Control Logic
    //<------------------------------------------------------------------------------------------>
       else if ((ip_MEM_WB_RegWrite) &&
        (ip_MEM_WB_RegisterRD != 0) &&
        (ip_MEM_WB_RegisterRD == ip_ID_EX_RegisterRS1)) 
            begin
                op_ForwardA <= 3'b101;
            end  
     //<------------------------------------------------------------------------------------------>
//        if ((ip_MEM_WB_RegWrite) &&
//       (ip_MEM_WB_RegisterRD != 0) &&
//       (ip_MEM_WB_RegisterRD == ip_ID_EX_RegisterRS2)) 
//            begin
//                op_ForwardB <= 3'b101;
//            end
//            else begin                          
//                op_ForwardB <= {1'b0,sel_ALUSrc};  
//            end                                 
    //<------------------------------------------------------------------------------------------>
    // WB-Stage Hazard Contol Logic
    //<------------------------------------------------------------------------------------------->
       else if ((ip_MEM_WB_RegWrite) &&
        (ip_MEM_WB_RegisterRD != 0) &&
        !(ip_EX_MEM_RegWrite && (ip_EX_MEM_RegisterRD != 0) && (ip_EX_MEM_RegisterRD == ip_ID_EX_RegisterRS1)) &&
        (ip_MEM_WB_RegisterRD == ip_ID_EX_RegisterRS1))
            begin
                op_ForwardA <= 3'b101;
            end 
      //<------------------------------------------------------------------------------------------->
//        if ((ip_MEM_WB_RegWrite) &&
//        (ip_MEM_WB_RegisterRD != 0) &&
//        !(ip_EX_MEM_RegWrite && (ip_EX_MEM_RegisterRD != 0) && (ip_EX_MEM_RegisterRD == ip_ID_EX_RegisterRS2)) &&
//        (ip_MEM_WB_RegisterRD == ip_ID_EX_RegisterRS2)) 
//            begin
//                op_ForwardB <= 3'b101;
//            end
//            else begin                          
//                op_ForwardB <= {1'b0,sel_ALUSrc};  
//            end                                 
      //<-------------------------------------------------------------------------------------------->  
            else begin 
                op_ForwardA <= 3'b000;
            end
    end
    
    always @ (*)begin 
        if ((ip_EX_MEM_RegWrite && !ip_Imm_signal) &&
            (ip_EX_MEM_RegisterRD != 0) &&
            (ip_EX_MEM_RegisterRD == ip_ID_EX_RegisterRS2)) 
                begin
                    op_ForwardB <= 3'b110;
                end   
         
//               else if ((ip_EX_MEM_RegWrite) &&
//                        (ip_EX_MEM_RegisterRD != 0) &&
//                        (ip_EX_MEM_RegisterRD == ip_ID_EX_RegisterRS2)) 
//                            begin
//                                op_ForwardB <= 3'b110;
//                            end   
             
              else if ((ip_MEM_WB_RegWrite) &&
                  (ip_MEM_WB_RegisterRD != 0) &&
                  !(ip_EX_MEM_RegWrite && (ip_EX_MEM_RegisterRD != 0) && (ip_EX_MEM_RegisterRD == ip_ID_EX_RegisterRS2)) &&
                  (ip_MEM_WB_RegisterRD == ip_ID_EX_RegisterRS2)) 
                      begin
                          op_ForwardB <= 3'b101;
                      end

              else begin                          
                  op_ForwardB <= {1'b0,sel_ALUSrc};  
              end   

    end
    //<-----------------------------------------Forwarding for Fourth to Second Stage-------------------------------->
    always @ (*) begin
        if((ip_EX_MEM_RegWrite) &&
        (ip_EX_MEM_RegisterRD != 0) &&
        (ip_EX_MEM_RegisterRD == ip_ID_EX_RegisterRS1))
        begin
            op_ForwardC <= 1'b1;
        end
        else if ((ip_EX_MEM_RegWrite) &&
                (ip_EX_MEM_RegisterRD != 0) &&
                (ip_EX_MEM_RegisterRD == ip_ID_EX_RegisterRS2))
        begin
            op_ForwardD <= 1'b1;
        end
        else begin
            op_ForwardC <= 1'b0;
            op_ForwardD <= 1'b0;
        end
    end
    
    
    
endmodule
