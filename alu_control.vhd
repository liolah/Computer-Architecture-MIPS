LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY ALU_control IS
  PORT (
    funct : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    ALUOp : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    ALUCtrl : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END ALU_control;

ARCHITECTURE rtl OF ALU_control IS
BEGIN
  ALUCtrl <= "0010" WHEN ALUOp = "00" OR (ALUOp = "10" AND funct = "100000") ELSE
    "0110" WHEN ALUOp = "01" OR (ALUOp = "10" AND funct = "100010") ELSE
    "0000" WHEN (ALUOp = "10" AND funct = "100100") ELSE
    "0001" WHEN (ALUOp = "10" AND funct = "100101") ELSE
    "0000";
END rtl;