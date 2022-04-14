LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY alu32_Regfile IS
  PORT (
    a, b : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    ainv, binv, cin : IN STD_LOGIC;
    op : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    cout : OUT STD_LOGIC;
    clk, wr : IN STD_LOGIC;
    read_reg1, read_reg2, write_reg : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    write_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0));
END alu32_Regfile;

ARCHITECTURE rtl OF alu32_Regfile IS

  COMPONENT alu_32bit
    PORT (
      a, b : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      ainv, binv, cin : IN STD_LOGIC;
      op : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      cout : OUT STD_LOGIC);
  END COMPONENT;

  COMPONENT register_file
    PORT (
      clk, wr : IN STD_LOGIC;
      read_reg1, read_reg2, write_reg : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      write_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      data_one, data_two : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
  END COMPONENT;

  SIGNAL busA, busB, busRes : STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
  c1 : alu_32bit PORT MAP(busA, busB, ainv, binv, cin, op, result, cout);
  c2 : alu_32bit PORT MAP(busA, busB, ainv, binv, cin, op, busRes, cout);
  c3 : register_file PORT MAP(clk, wr, read_reg1, read_reg2, write_reg, busRes, busA, busB);
END rtl;