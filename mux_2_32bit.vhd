LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mux_2_32bit IS
  PORT (
    a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    sel : IN STD_LOGIC;
    y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END mux_2_32bit;

ARCHITECTURE rtl OF mux_2_32bit IS
BEGIN
  y <= a WHEN sel = '0' ELSE
    b;
END rtl;