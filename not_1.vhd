LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY not_1 IS
	PORT (
		a : IN STD_LOGIC;
		y : OUT STD_LOGIC);
END not_1;

ARCHITECTURE rtl OF not_1 IS
BEGIN 
PROCESS (a)
BEGIN
	y <= NOT a;
END PROCESS;
END rtl;