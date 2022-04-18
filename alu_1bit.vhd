LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY alu_1bit IS
	PORT (
		a, b, cin, ainv, binv : IN STD_LOGIC;
		op : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		result, cout : OUT STD_LOGIC
	);
END alu_1bit;

ARCHITECTURE rtl OF alu_1bit IS
	COMPONENT full_adder
		PORT (
			a, b, cin : IN STD_LOGIC;
			sum, cout : OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT mux_2
		PORT (
			a, b, sel : IN STD_LOGIC;
			y : OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT mux_4
		PORT (
			sel : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			a, b, c, d : IN STD_LOGIC;
			y : OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT and_2
		PORT (
			a, b : IN STD_LOGIC;
			y : OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT or_2
		PORT (
			a, b : IN STD_LOGIC;
			y : OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT not_1
		PORT (
			a : IN STD_LOGIC;
			y : OUT STD_LOGIC);
	END COMPONENT;

	SIGNAL w1, w2, w3, w4, w5, w6, w7 : STD_LOGIC;
BEGIN
	c1 : full_adder PORT MAP(w2, w5, cin, w7, cout);
	c2 : mux_2 PORT MAP(a, w1, ainv, w2);
	c3 : mux_2 PORT MAP(b, w4, binv, w5);
	c4 : and_2 PORT MAP(w2, w5, w3);
	c5 : not_1 PORT MAP(a, w1);
	c6 : not_1 PORT MAP(b, w4);
	c7 : mux_4 PORT MAP(op, w3, w6, w7, '0', result);
	c8 : or_2 PORT MAP(w2, w5, w6);
END rtl;