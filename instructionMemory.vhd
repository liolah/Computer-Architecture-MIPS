LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY instructionMemory IS
	PORT (
		readAddress : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		instruction : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END instructionMemory;
ARCHITECTURE rtl OF instructionMemory IS
	TYPE RAM_16_x_32 IS ARRAY(0 TO 15) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL IM : RAM_16_x_32 := (
		x"00",
		x"00",
		x"00",
		x"00",
		x"00",
		x"00",
		x"00",
		x"00",
		x"00",
		x"00",
		x"00",
		x"00",
		x"00",
		x"00",
		x"00",
		x"00"
	);
BEGIN
	instruction <= IM(conv_integer(unsigned(readAddress))) & IM(conv_integer(unsigned(readAddress)) + 1) & IM(conv_integer(unsigned(readAddress)) + 2) & IM(conv_integer(unsigned(readAddress)) + 3);
END rtl;
