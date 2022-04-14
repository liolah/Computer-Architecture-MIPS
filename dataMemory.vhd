LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY dataMemory IS
	PORT (
		clk : IN STD_LOGIC;
		memWrite, memRead : IN STD_LOGIC;
		address : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		writeData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		readData : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END dataMemory;

ARCHITECTURE rtl OF dataMemory IS
	SIGNAL addr : STD_LOGIC_VECTOR(3 DOWNTO 0);
	TYPE RAM_16_x_32 IS ARRAY(0 TO 15) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL DM : RAM_16_x_32 := (
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000"
	);
BEGIN
	addr <= address(3 DOWNTO 0);
	PROCESS (clk) BEGIN
		IF (rising_edge(clk)) THEN
			IF (memWrite = '1') THEN
				DM((conv_integer(unsigned(addr)))) <= writeData;
			END IF;
		END IF;
	END PROCESS;
	readData <= DM((conv_integer(unsigned(addr)))) WHEN (memRead = '1');
END rtl;