// Declaration of Parameters file
`ifndef _parameter_vh_
`define _parameter_vh_
    // Defined Parameters here.......
   //<------------R-Type Instructions---------------->
   parameter add_ctrl=6'd1;         // rd=rs1+rs2
   parameter sub_ctrl=6'd2;         // rd=rs1-rs2
   parameter and_ctrl=6'd3;        // rd=rs1&rs2
   parameter or_ctrl=6'd4;         // rd=rs1|rs2
   parameter xor_ctrl=6'd5;        // rd=rs1^rs2
   parameter sll_ctrl=6'd6;        // Shift rs1 left by number of bits in LSB of rs2 and store in rd
   parameter slt_ctrl=6'd7;        // Signed integer value of rs1 < signed integer value of rs2 then, rd=1 otherwise rd=0
   parameter sltu_ctrl=6'd8;       // Unsigned integer value of rs1 < unsigned integer value of rs2 then, rd=1 otherwise rd=0
   parameter srl_ctrl=6'd9;       // Shift rs1 right by the number of bits in LSB of rs2 and store in rd
   parameter sra_ctrl=6'd10;     // Arithmetic Shift right of rs1 by bits given in LSB of rs2 and store in rd
   //<----------------I-Type Instructions----------------->
   /*
   parameter addi_ctrl=6'd11;      //rd=rs1+imm_i
   parameter andi_ctrl=6'd12;      // rd=rs1&imm_i
   parameter ori_ctrl=6'd13;       // rd=rs1|imm_i
   parameter xori_ctrl=6'd14;       // rd=rs1^imm_i
   parameter slli_ctrl=6'd15;      // Shift rs1 left by number of bits specified in shamt_i then, store in rd
   parameter slti_ctrl=6'd16;      // Signed integer value of rs1 < signed integer value of imm_i then, rd=1 otherwise rd=0
   parameter sltiu_ctrl=6'd17;     // Unsigned integer value of rs1 < unsigned integer value of imm_i then, rd=1 otherwise rd=0
   parameter srli_ctrl=6'd18;     // Logic-shift rs1 right by the number of bits specied in shamt_i and store in rd
   parameter srai_ctrl=6'd19;     // Arithmetic-shift rs1 right by the number of bits specied in shamt_i
   parameter jalr_ctrl=6'd20;    /* Set register rd to the address of the next instruction that would otherwise be executed
                                    and then jump to an address given by the sum of the rs1  register and the imm_i value as 
                                    decoded from the instruction. */
  
   parameter lb_ctrl=6'd21;     /* Set register rd to the value of the sign-extended byte fetched from the memory address given
                                   by the sum of rs1 and imm_i. */
   parameter lbu_ctrl=6'd22;    /*Set register rd to the value of the zero-extended byte fetched from the memory address given
                                  by the sum of rs1 and imm_i.*/   
   parameter lh_ctrl=6'd23;     /* Set register rd to the value of the sign-extended 16-bit little-endian half-word value fetched from
                                   the memory address given by the sum of rs1 and imm_i. */
   parameter lhu_ctrl=6'd24;    /* Set register rd to the value of the zero-extended 16-bit little-endian half-word value fetched from
                                    the memory address given by the sum of rs1 and imm_i. */    
   parameter lw_ctrl=6'd25;     /* Set register rd to the value of the sign-extended 32-bit little-endian word value fetched from the
                                   memory address given by the sum of rs1 and imm_i. */   
   //<-------------------------J-Type Instructions------------------------------------->
   parameter jal_ctrl=6'd26;   /* Set register rd to the address of the next instruction that would otherwise be executed and 
                                  then jump to the address given by the sum of the pc register and the imm_j value as 
                                  decoded from the instruction. */   
   //<---------------------------S-Type Instructions------------------------------------>
   parameter sb_ctrl=6'd27;    //  Set the byte of memory at the address given by the sum of rs1 and imm_s to the 8 LSBs of rs2. 
   parameter sh_ctrl=6'd28;    // Set the 16-bit half-word of memory at the address given by the sum of rs1 and imm_s to the 16 LSBs of rs2.
   parameter sw_ctrl=6'd29;   //  Store the 32-bit value in rs2 into the memory at the address given by the sum of rs1 and imm_s. 
   //<---------------------------B-Type Instructions------------------------------------->
   parameter beq_ctrl=6'd30;  // If rs1 is equal to rs2 then add imm_b to the pc register. 
   parameter bge_ctrl=6'd31;  // If the signed value in rs1 is greater than or equal to the signed value in rs2 then add imm_b to the pc register                   
   parameter bgeu_ctrl=6'd32;  //  If the unsigned value in rs1 is greater than or equal to the unsigned value in rs2 then add imm_b to the pc register.
   parameter blt_ctrl=6'd33;   //  If the signed value in rs1 is less than the signed value in rs2 then add imm_b to the pc register.
   parameter bltu_ctrl=6'd34;  //  If the unsigned value in rs1 is less than the unsigned value in rs2 then add imm_b to the pc register.
   parameter bne_ctrl=6'd35;  //  If rs1 is not equal to rs2 then add imm_b to the pc register.
   //<------------------------------U-Type Instructions------------------------------------>
   parameter lui_ctrl=6'd36;  // Set register rd to the imm_u value.
   parameter auipe_ctrl=6'd37;  //  Add the address of the instruction to the imm_u value as and store the result in register rd.
   //<----------------------------------------------------------------------------------------->
`endif
