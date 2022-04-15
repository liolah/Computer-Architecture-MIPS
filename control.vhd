LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY control IS
  PORT (
    opcode : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    reset : IN STD_LOGIC;
    regDst : OUT STD_LOGIC;
    branch : OUT STD_LOGIC;
    memRead : OUT STD_LOGIC;
    memToRegister : OUT STD_LOGIC;
    ALUop : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    memWrite : OUT STD_LOGIC;
    ALUsrc : OUT STD_LOGIC;
    regWrite : OUT STD_LOGIC
  );
END control;

ARCHITECTURE rtl OF control IS

BEGIN
  PROCESS (reset, opcode)
  BEGIN
    IF (reset = '1') THEN
      regDst <= '0';
      memToRegister <= '0';
      ALUop <= "00";
      branch <= '0';
      memRead <= '0';
      memWrite <= '0';
      ALUsrc <= '0';
      regWrite <= '0';
    ELSE
      CASE opcode IS
        WHEN "000011" => -- load
          regDst <= '1';
          memToRegister <= '1';
          ALUop <= "00";
          branch <= '0';
          memRead <= '1';
          memWrite <= '0';
          ALUsrc <= '1';
          regWrite <= '1';
        WHEN "000001" => -- store
          regDst <= '0';
          memToRegister <= '0';
          ALUop <= "00";
          branch <= '0';
          memRead <= '0';
          memWrite <= '1';
          ALUsrc <= '1';
          regWrite <= '0';
        WHEN OTHERS => -- r type instruction determined by function field
          regDst <= '1';
          memToRegister <= '0';
          ALUop <= "10";
          branch <= '0';
          memRead <= '0';
          memWrite <= '0';
          ALUsrc <= '0';
          regWrite <= '0';
      END CASE;
    END IF;
  END PROCESS;
END rtl;