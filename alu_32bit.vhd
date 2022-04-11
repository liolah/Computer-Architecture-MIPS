LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY alu_32bit IS
	PORT (
		a, b : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		ainv, binv, cin : IN STD_LOGIC;
		op : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		cout : OUT STD_LOGIC);
END alu_32bit;

ARCHITECTURE rtl OF alu_32bit IS
	COMPONENT alu_1bit IS
		PORT (
			a, b, ainv, binv, cin : IN STD_LOGIC;
			op : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			result, cout : OUT STD_LOGIC);
	END COMPONENT;

	SIGNAL c : STD_LOGIC_VECTOR (30 DOWNTO 0);
BEGIN
	A1 : alu_1bit PORT MAP(a(0), b(0), ainv, binv, cin, op, result(0), c(0));
	G1 : FOR i IN 1 TO 30 GENERATE
		ALUs : alu_1bit PORT MAP(a(i), b(i), ainv, binv, c(i - 1), op, result(i), c(i));
	END GENERATE;
	A32 : alu_1bit PORT MAP(a(31), b(31), ainv, binv, c(30), op, result(31), cout);
END rtl;