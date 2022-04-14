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
      ainv, binv, cin : IN STD_LOGIC;
      op : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      cout : OUT STD_LOGIC);
  END COMPONENT;

  COMPONENT ALU_control IS
    PORT (
      funct : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      ALUOp : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      ALUCtrl : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
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

  SIGNAL pcIn, pcOut, pcAdderIn, pcAdderOut, branchAdderPCAdderIn, branchAdderMemIn, branchAdderOut, pcMuxIn0, pcMuxIn1, pcMuxOut, seOut, redData1, regData2, regDataWrite, aluSrcMuxOut, aluOu, dataMemDataRead, dataMemDataWrite : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL branchAndIn0, branchAndIn1, branchAndOut, aluCout, pcMuxSel, regDst, branch, memRead, memToReg, memWrite, aluSrc, RegWrite : STD_LOGIC;
  SIGNAL opCode : STD_LOGIC_VECTOR(5 DOWNTO 0);
  SIGNAL rs, rt, rd, rMuxOut : STD_LOGIC_VECTOR(4 DOWNTO 0);
  SIGNAL instructionAddress : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL func : STD_LOGIC_VECTOR(5 DOWNTO 0);
  SIGNAL aluOp : STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL aluControlSignal : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
pc: pc port map(pcIn, pcOut);
c2:  port map();
c3:  port map();
c4:  port map();
c5:  port map();
c6:  port map();
c1:  port map();
c1:  port map();
c1:  port map();
c1:  port map();
c1:  port map();
c1:  port map();
c1:  port map();
c1:  port map();
c1:  port map();
c1:  port map();
c1:  port map();
c1:  port map();
c1:  port map();
c1:  port map();
c1:  port map();
c1:  port map();
c1:  port map();
END rtl;