LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY pc IS
	PORT (
		clk : IN STD_LOGIC;
		rst : IN STD_LOGIC;
		a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END pc;

ARCHITECTURE rtl OF pc IS
BEGIN
	PROCESS (clk, rst, a)
	BEGIN
		IF (a = "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU" OR rst = '1') THEN
			y <= X"00000000";
		END IF;
		IF rising_edge(clk) THEN
			y <= a;
		END IF;
	END PROCESS;
END rtl;