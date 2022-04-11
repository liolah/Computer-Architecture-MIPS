LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY or_2 IS
	PORT (
		a, b : IN STD_LOGIC;
		y : OUT STD_LOGIC);
END or_2;

ARCHITECTURE rtl OF or_2 IS
BEGIN
	PROCESS (a, b)
	BEGIN
		y <= a OR b;
	END PROCESS;
END rtl;