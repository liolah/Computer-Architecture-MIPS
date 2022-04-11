LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux_2 IS
	PORT (
		a, b, sel : IN STD_LOGIC;
		y : OUT STD_LOGIC);
END mux_2;

ARCHITECTURE rtl OF mux_2 IS
BEGIN
	PROCESS (a, b, sel)
	BEGIN
		CASE sel IS
			WHEN '0' => y <= a;
			WHEN OTHERS => y <= b;
		END CASE;
	END PROCESS;
END rtl;