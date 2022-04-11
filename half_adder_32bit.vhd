LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY half_adder_32bit IS
  PORT (
    a, b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    sum : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END half_adder_32bit;

ARCHITECTURE rtl OF half_adder_32bit IS
BEGIN
  PROCESS (a, b)
  BEGIN
    sum <= a + b;
  END PROCESS;
END rtl;