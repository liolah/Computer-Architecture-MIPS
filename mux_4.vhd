LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux_4 IS
  PORT (
    sel : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    a, b, c, d : IN STD_LOGIC;
    y : OUT STD_LOGIC);
END mux_4;

ARCHITECTURE rtl OF mux_4 IS
BEGIN
  PROCESS (sel, a, b, c, d)
  BEGIN
    CASE sel IS
      WHEN "00" => y <= a;
      WHEN "01" => y <= b;
      WHEN "10" => y <= c;
      WHEN OTHERS => y <= d;
    END CASE;
  END PROCESS;
END rtl;