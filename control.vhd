
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
        WHEN "000000" => -- add
          regDst <= '1';
          memToRegister <= '0';
          ALUop <= "00";
          branch <= '0';
          memRead <= '0';
          memWrite <= '0';
          ALUsrc <= '0';
          regWrite <= '1';
        WHEN "000001" => -- sliu
          regDst <= '0';
          memToRegister <= '0';
          ALUop <= "10";
          branch <= '0';
          memRead <= '0';
          memWrite <= '0';
          ALUsrc <= '1';
          regWrite <= '1';
        WHEN "000010" => -- j
          regDst <= '0';
          memToRegister <= '0';
          ALUop <= "00";
          branch <= '0';
          memRead <= '0';
          memWrite <= '0';
          ALUsrc <= '0';
          regWrite <= '0';
        WHEN "000011" => -- jal
          regDst <= '0';
          memToRegister <= '0';
          ALUop <= "00";
          branch <= '0';
          memRead <= '0';
          memWrite <= '0';
          ALUsrc <= '0';
          regWrite <= '1';
        WHEN "000100" => -- lw
          regDst <= '0';
          memToRegister <= '1';
          ALUop <= "11";
          branch <= '0';
          memRead <= '1';
          memWrite <= '0';
          ALUsrc <= '1';
          regWrite <= '1';
        WHEN "000101" => -- sw
          regDst <= '0';
          memToRegister <= '0';
          ALUop <= "11";
          branch <= '0';
          memRead <= '0';
          memWrite <= '1';
          ALUsrc <= '1';
          regWrite <= '0';
        WHEN "000110" => -- beq
          regDst <= '0';
          memToRegister <= '0';
          ALUop <= "01";
          branch <= '1';
          memRead <= '0';
          memWrite <= '0';
          ALUsrc <= '0';
          regWrite <= '0';
        WHEN "000111" => -- addi
          regDst <= '0';
          memToRegister <= '0';
          ALUop <= "11";
          branch <= '0';
          memRead <= '0';
          memWrite <= '0';
          ALUsrc <= '1';
          regWrite <= '1';
        WHEN OTHERS =>
          regDst <= '1';
          memToRegister <= '0';
          ALUop <= "00";
          branch <= '0';
          memRead <= '0';
          memWrite <= '0';
          ALUsrc <= '0';
          regWrite <= '1';
      END CASE;
    END IF;
  END PROCESS;
END rtl;