LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder IS
  PORT (
    a, b, cin : IN STD_LOGIC;
    sum, cout : OUT STD_LOGIC);
END full_adder;

ARCHITECTURE rtl OF full_adder IS
BEGIN
  PROCESS (a, b, cin)
  BEGIN
    sum <= a XOR b XOR cin;
    cout <= (a AND cin) OR (b AND cin) OR(a AND b);
  END PROCESS;
END rtl;