library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity alu_1bit is 
port(a, b, ainv, binv, cin :in std_logic;
	op: in std_logic_vector(1 downto 0);
	result, cout : out std_logic);
end alu_1bit;

architecture rtl OF alu_1bit is
COMPONENT full_adder
 port(a, b, cin : in std_logic;
	sum, cout: out std_logic);
END COMPONENT;

COMPONENT mux_2
port (a, b, sel : in std_logic;
	y: out std_logic);
END COMPONENT;

COMPONENT mux_4
port (
	sel: in std_logic_vector (1 downto 0);
	a, b, c, d: in std_logic;
	y: out std_logic);
END COMPONENT;

COMPONENT and_2
port (a, b: in std_logic;
	y: out std_logic);
END COMPONENT;

COMPONENT or_2
port (a, b: in std_logic;
	y: out std_logic);
END COMPONENT;

COMPONENT not_1
port (a: in std_logic;
	y: out std_logic);
END COMPONENT;

signal w1, w2, w3, w4, w5, w6, w7: std_logic;
BEGIN
c1: full_adder port map (w2, w5, cin, w7, cout);
c2: mux_2 port map (a, w1, ainv, w2);
c3: mux_2 port map (b, w4, binv, w5);
c4: and_2 port map (w2, w5, w3);
c5: not_1 port map (a, w1);
c6: not_1 port map (b, w4);
c7: mux_4 port map (op, w3, w6, w7, '0', result);
c8: or_2 port map (w2, w5, w6);
END rtl;
