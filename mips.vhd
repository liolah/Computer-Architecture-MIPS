LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY mips IS
	PORT (
		clk   : IN STD_LOGIC;
		reset : IN STD_LOGIC
	);
END mips;

ARCHITECTURE rtl OF mips IS

component alu_32bit IS
	PORT (
		a, b : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		ainv, binv, cin : IN STD_LOGIC;
		op : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		cout : OUT STD_LOGIC);
END component;




BEGIN

END rtl;