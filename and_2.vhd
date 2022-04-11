library ieee;
use ieee.std_logic_1164.all;

entity and_2 is 
	port(
 	a, b: in std_logic;
	y: out std_logic );
end and_2;

architecture rtl of and_2 is
begin process(a, b)
begin
 y <= a and b;
end process;
end rtl;