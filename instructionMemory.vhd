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
		"00001100",
		"00000001",
		"00000000",
		"00000001", -- load from memory location 1 and store in r1
		"00001100",
		"00000010",
		"00000000",
		"00000111", -- load from memory location 7 and store in r2
		"00000000",
		"00100010",
		"00011000",
		"00100000", -- add r1 and r2 and store in r3
		"00000100",
		"00000011",
		"00000000",
		"00000101" -- store in memory location 5 the content of r3
	);
BEGIN
	instruction <= IM(conv_integer(unsigned(readAddress))) & IM(conv_integer(unsigned(readAddress)) + 1) & IM(conv_integer(unsigned(readAddress)) + 2) & IM(conv_integer(unsigned(readAddress)) + 3);
END rtl;