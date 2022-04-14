LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY and_2 IS
	PORT (
		a, b : IN STD_LOGIC;
		y : OUT STD_LOGIC);
END and_2;

ARCHITECTURE rtl OF and_2 IS
BEGIN
	PROCESS (a, b)
	BEGIN
		y <= a AND b;
	END PROCESS;
END rtl;