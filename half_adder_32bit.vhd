LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY half_adder_32bit IS
  PORT (
    a, b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    sum : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END half_adder_32bit;

ARCHITECTURE rtl OF half_adder_32bit IS
  SIGNAL sumWithCarry : STD_LOGIC_VECTOR(32 DOWNTO 0);
BEGIN
  PROCESS (a, b)
  BEGIN
    sumWithCarry <= ('0' & a) + ('0' & b);
  END PROCESS;
  sum <= sumWithCarry(31 DOWNTO 0);
END rtl;