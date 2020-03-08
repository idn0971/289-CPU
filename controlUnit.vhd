library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controlUnit is
	port(
		clk        : in  std_logic;
		I_dataInst : in  STD_LOGIC_VECTOR(31 downto 0);
		O_selA     : out STD_LOGIC_VECTOR(4 downto 0);
		O_selB     : out STD_LOGIC_VECTOR(4 downto 0);
		O_selD     : out STD_LOGIC_VECTOR(4 downto 0);
		O_dataIMM  : out STD_LOGIC_VECTOR(31 downto 0);
		O_regDwe   : out STD_LOGIC;
		O_aluop    : out STD_LOGIC_VECTOR(4 downto 0);
		memWren    : out std_logic;
		memToReg   : out std_logic;
		branch     : out std_logic;
		aluImm     : out std_logic;
		jumpReg    : out std_logic;
		regREn     : out std_logic;
		regWEn     : out std_logic;
		aluEn      : out std_logic;
		memoryEn   : out std_logic;
		fetchEn    : out std_logic;
		rst        : in  std_logic
	);
end entity controlUnit;

architecture RTL of controlUnit is

	component controlFSM IS
		PORT(
			clk      : in  std_logic;
			reset    : in  std_logic;
			inst     : in  std_logic_vector(6 downto 0);
			decodeEn : out std_logic;
			regREn   : out std_logic;
			regWEn   : out std_logic;
			aluEn    : out std_logic;
			memoryEn : out std_logic;
			fetchEn  : out std_logic
		);
	end component controlFSM;

	component decode is
		Port(clk        : in  STD_LOGIC;
		     I_dataInst : in  STD_LOGIC_VECTOR(31 downto 0);
		     I_en       : in  STD_LOGIC;
		     O_selA     : out STD_LOGIC_VECTOR(4 downto 0);
		     O_selB     : out STD_LOGIC_VECTOR(4 downto 0);
		     O_selD     : out STD_LOGIC_VECTOR(4 downto 0);
		     O_dataIMM  : out STD_LOGIC_VECTOR(31 downto 0);
		     O_regDwe   : out STD_LOGIC;
		     memWren    : out std_logic;
		     memToReg   : out std_logic;
		     branch     : out std_logic;
		     aluImm     : out std_logic;
		     jumpReg    : out std_logic;
		     funct7     : out std_logic_vector(6 downto 0);
		     funct3     : out std_logic_vector(2 downto 0);
		     O_aluop    : out STD_LOGIC_VECTOR(6 downto 0));
	end component decode;

	component aluDecode is
		port(
			clk       : in  std_logic;
			en        : in  std_logic;
			opcode    : in  std_logic_vector(6 downto 0);
			funct3    : in  std_logic_vector(2 downto 0);
			funct7    : in  std_logic_vector(6 downto 0);
			aluOpcode : out std_logic_vector(4 downto 0)
		);
	end component aluDecode;

	signal decodeEn : std_logic;
	signal opcode   : std_logic_vector(6 downto 0);
	signal funct7   : std_logic_vector(6 downto 0);
	signal funct3   : std_logic_vector(2 downto 0);
begin
	fsm : controlFSM
		port map(
			clk      => clk,
			reset    => rst,
			inst     => opcode,
			decodeEn => decodeEn,
			regREn   => regREn,
			regWEn   => regWEn,
			aluEn    => aluEn,
			memoryEn => memoryEn,
			fetchEn  => fetchEn
		);
	decoder : decode
		port map(
			clk        => clk,
			I_dataInst => I_dataInst,
			I_en       => decodeEn,
			O_selA     => O_selA,
			O_selB     => O_selB,
			O_selD     => O_selD,
			O_dataIMM  => O_dataIMM,
			O_regDwe   => O_regDwe,
			memWren    => memWren,
			memToReg   => memToReg,
			branch     => branch,
			aluImm     => aluImm,
			jumpReg    => jumpReg,
			funct7     => funct7,
			funct3     => funct3,
			O_aluop    => opcode
		);
	aluDecoder : aluDecode
		port map(
			clk       => clk,
			en        => decodeEn,
			opcode    => opcode,
			funct3    => funct3,
			funct7    => funct7,
			aluOpcode => O_aluop
		);
end architecture RTL;
