LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY sign_extend IS
  PORT (
    a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END sign_extend;
ARCHITECTURE rtl OF sign_extend IS
BEGIN
  y <= x"0000" & a WHEN a(15) = '0'
    ELSE
    x"FFFF" & a;
END rtl;