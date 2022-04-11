LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY register_file IS
  PORT (
    wr : IN STD_LOGIC;
    read_reg1, read_reg2, write_reg : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    write_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    data_one, data_two : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END register_file;

ARCHITECTURE rtl OF register_file IS
  TYPE ram_type IS ARRAY (0 TO 15) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL reg_bank : ram_type;

BEGIN
  PROCESS (wr)
  BEGIN
      IF (wr = '1') THEN
        reg_bank(conv_integer(unsigned(write_reg))) <= write_data;
      END IF;
  END PROCESS;
  data_one <= reg_bank(conv_integer(unsigned(read_reg1)));
  data_two <= reg_bank(conv_integer(unsigned(read_reg2)));
END rtl;