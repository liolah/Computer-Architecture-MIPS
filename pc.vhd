LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY pc IS
	PORT (
		a   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		y  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END pc;
ARCHITECTURE rtl OF pc IS
BEGIN
	y <= a;
END rtl;