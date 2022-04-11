LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY dataMemory IS
	PORT (
		memRead, memWrite   : IN STD_LOGIC;
		address   : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		writeData : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		readData  : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END dataMemory;
ARCHITECTURE rtl OF dataMemory IS
	TYPE RAM_16_x_32 IS ARRAY(0 TO 15) OF std_logic_vector(31 DOWNTO 0);
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
	PROCESS (memWrite, memRead)
	BEGIN
		IF (memWrite = '1') THEN
			DM((conv_integer(unsigned(address))) <= writeData;
		END IF;
		IF (memRead = '1') THEN
			readData <= DM((conv_integer(unsigned(address)));
		END IF;
	END PROCESS;
END rtl;