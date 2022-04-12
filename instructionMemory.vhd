LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY instructionMemory IS
	PORT (
		readAddress : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		instruction : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END instructionMemory;
ARCHITECTURE rtl OF instructionMemory IS
	TYPE RAM_16_x_32 IS ARRAY(0 TO 15) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL IM : RAM_16_x_32 := (
		x"01285024",
		x"018b6825",
		x"01285020",
		x"01285022",
		x"0149402a",
		x"1211fffb",
		x"01285024",
		x"018b6825",
		x"01285020",
		x"01285022",
		x"0149402a",
		x"08100000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000"
	);
BEGIN
	instruction <= IM(to_integer(unsigned(readAddress)));
END rtl;