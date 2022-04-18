LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY alu_32bit IS
	PORT (
		a, b : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		alu_op : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		zero, cout : OUT STD_LOGIC
	);
END alu_32bit;

ARCHITECTURE rtl OF alu_32bit IS

	COMPONENT alu_1bit
		PORT (
			a, b, cin, ainv, binv : IN STD_LOGIC;
			op : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			result, cout : OUT STD_LOGIC
		);
	END COMPONENT;

	SIGNAL r_int : STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL c : STD_LOGIC_VECTOR (30 DOWNTO 0);

BEGIN
	inst_0 : alu_1bit PORT MAP(
		a(0), b(0), alu_op(2), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(0), c(0));
	inst_1 : alu_1bit PORT MAP(
		a(1), b(1), c(0), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0), r_int(1),
		c(1));
	inst_2 : alu_1bit PORT MAP(
		a(2), b(2), c(1), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0), r_int(2),
		c(2));
	inst_3 : alu_1bit PORT MAP(
		a(3), b(3), c(2), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0), r_int(3),
		c(3));
	inst_4 : alu_1bit PORT MAP(
		a(4), b(4), c(3), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0), r_int(4),
		c(4));
	inst_5 : alu_1bit PORT MAP(
		a(5), b(5), c(4), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0), r_int(5),
		c(5));
	inst_6 : alu_1bit PORT MAP(
		a(6), b(6), c(5), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0), r_int(6),
		c(6));
	inst_7 : alu_1bit PORT MAP(
		a(7), b(7), c(6), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0), r_int(7),
		c(7));
	inst_8 : alu_1bit PORT MAP(
		a(8), b(8), c(7), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0), r_int(8),
		c(8));
	inst_9 : alu_1bit PORT MAP(
		a(9), b(9), c(8), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0), r_int(9),
		c(9));
	inst_10 : alu_1bit PORT MAP(
		a(10), b(10), c(9), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(10), c(10));
	inst_11 : alu_1bit PORT MAP(
		a(11), b(11), c(10), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(11), c(11));
	inst_12 : alu_1bit PORT MAP(
		a(12), b(12), c(11), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(12), c(12));
	inst_13 : alu_1bit PORT MAP(
		a(13), b(13), c(12), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(13), c(13));
	inst_14 : alu_1bit PORT MAP(
		a(14), b(14), c(13), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(14), c(14));
	inst_15 : alu_1bit PORT MAP(
		a(15), b(15), c(14), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(15), c(15));
	inst_16 : alu_1bit PORT MAP(
		a(16), b(16), c(15), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(16), c(16));
	inst_17 : alu_1bit PORT MAP(
		a(17), b(17), c(16), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(17), c(17));
	inst_18 : alu_1bit PORT MAP(
		a(18), b(18), c(17), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(18), c(18));
	inst_19 : alu_1bit PORT MAP(
		a(19), b(19), c(18), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(19), c(19));
	inst_20 : alu_1bit PORT MAP(
		a(20), b(20), c(19), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(20), c(20));
	inst_21 : alu_1bit PORT MAP(
		a(21), b(21), c(20), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(21), c(21));
	inst_22 : alu_1bit PORT MAP(
		a(22), b(22), c(21), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(22), c(22));
	inst_23 : alu_1bit PORT MAP(
		a(23), b(23), c(22), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(23), c(23));
	inst_24 : alu_1bit PORT MAP(
		a(24), b(24), c(23), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(24), c(24));
	inst_25 : alu_1bit PORT MAP(
		a(25), b(25), c(24), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(25), c(25));
	inst_26 : alu_1bit PORT MAP(
		a(26), b(26), c(25), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(26), c(26));
	inst_27 : alu_1bit PORT MAP(
		a(27), b(27), c(26), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(27), c(27));
	inst_28 : alu_1bit PORT MAP(
		a(28), b(28), c(27), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(28), c(28));
	inst_29 : alu_1bit PORT MAP(
		a(29), b(29), c(28), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(29), c(29));
	inst_30 : alu_1bit PORT MAP(
		a(30), b(30), c(29), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(30), c(30));
	inst_31 : alu_1bit PORT MAP(
		a(31), b(31), c(30), alu_op(3), alu_op(2), alu_op (1 DOWNTO 0),
		r_int(31), cout);

	zero <= '1' WHEN r_int = x"00000000" ELSE
		'0';
	result <= r_int;

END rtl;