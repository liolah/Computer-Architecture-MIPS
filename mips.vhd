LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY mips IS
  PORT (
    clk : IN STD_LOGIC;
    reset : IN STD_LOGIC
  );
END mips;

ARCHITECTURE rtl OF mips IS

  COMPONENT alu_32bit IS
    PORT (
      a, b : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      alu_op : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      zero, cout : OUT STD_LOGIC
    );
  END COMPONENT;

  COMPONENT alu_control IS
    PORT (
      funct : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      aluOp : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      aluCtrl : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
  END COMPONENT;

  COMPONENT mux_2_5bit IS
    PORT (
      a : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      b : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      sel : IN STD_LOGIC;
      y : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT mux_2_32bit IS
    PORT (
      a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      sel : IN STD_LOGIC;
      y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT pc IS
    PORT (
      a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT pc_adder IS
    PORT (
      a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT register_file IS
    PORT (
      clk, wr : IN STD_LOGIC;
      read_reg1, read_reg2, write_reg : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      write_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      data_one, data_two : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
  END COMPONENT;

  COMPONENT shl_2 IS
    PORT (
      x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT sign_extend IS
    PORT (
      a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT instructionMemory IS
    PORT (
      readAddress : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      instruction : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT;
  COMPONENT half_adder_32bit IS
    PORT (
      a, b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      sum : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
  END COMPONENT;

  COMPONENT dataMemory IS
    PORT (
      clk : IN STD_LOGIC;
      memWrite, memRead : IN STD_LOGIC;
      address : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      writeData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      readData : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT control IS
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
  END COMPONENT;

  COMPONENT and_2 IS
    PORT (
      a, b : IN STD_LOGIC;
      y : OUT STD_LOGIC);
  END COMPONENT;

  SIGNAL pcOut, instruction, pcAdderOut, branchAdderMemIn, branchAdderOut, pcMuxOut, seOut, regData1, regData2, regDataWrite, aluSrcMuxOut, aluOut, dataMemDataRead : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL rMuxOut : STD_LOGIC_VECTOR(4 DOWNTO 0);
  SIGNAL aluControlSignal : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL aluOp : STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL aluCout, aluZero, pcMuxSel, regDst, branch, memRead, memToReg, memWrite, aluSrc, RegWrite : STD_LOGIC;

BEGIN
  c1 : pc PORT MAP(pcMuxOut, pcOut);
  c2 : pc_adder PORT MAP(pcOut, pcAdderOut);
  c3 : half_adder_32bit PORT MAP(pcAdderOut, branchAdderMemIn, branchAdderOut);
  c4 : shl_2 PORT MAP(seOut, branchAdderMemIn);
  c5 : and_2 PORT MAP(branch, aluZero, pcMuxSel);
  c6 : instructionMemory PORT MAP(pcOut, instruction);
  c7 : mux_2_5bit PORT MAP(instruction(20 DOWNTO 16), instruction(15 DOWNTO 11), regDst, rMuxOut);
  c8 : register_file PORT MAP(clk, regWrite, instruction(25 DOWNTO 21), instruction(20 DOWNTO 16), rMuxOut, regDataWrite, regData1, regData2);
  c9 : sign_extend PORT MAP(instruction(15 DOWNTO 0), seOut);
  c10 : mux_2_32bit PORT MAP(regData2, seOut, aluSrc, aluSrcMuxOut);
  c11 : alu_control PORT MAP(instruction(5 DOWNTO 0), aluOp, aluControlSignal);
  c12 : mux_2_32bit PORT MAP(pcAdderOut, branchAdderOut, pcMuxSel, pcMuxOut);
  c13 : mux_2_32bit PORT MAP(aluOut, dataMemDataRead, memToReg, regDataWrite);
  c14 : dataMemory PORT MAP(clk, memWrite, memRead, aluOut, regData2, dataMemDataRead);
  c15 : alu_32bit PORT MAP(regData1, aluSrcMuxOut, aluControlSignal, aluOut, aluZero, aluCout);
  c16 : control PORT MAP(instruction(31 DOWNTO 26), reset, regDst, branch, memRead, memToReg, aluOp, memWrite, aluSrc, regWrite);
END rtl;