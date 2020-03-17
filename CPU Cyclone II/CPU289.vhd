library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CPU289 is
	port(
		clk           : in  std_logic;
		sel7seg       : in  std_logic_vector(4 downto 0);
		displays_7seg : OUT STD_LOGIC_VECTOR(27 DOWNTO 0);
		rst           : in  std_logic
	);
end  CPU289;

architecture RTL of CPU289 is
	component controlUnit is
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
	end component controlUnit;

	component alu is
		port(                           -- the alu connections to external circuitry:
			A      : in  std_logic_vector(31 downto 0); -- operand A
			B      : in  std_logic_vector(31 downto 0); -- operand B
			en     : in  std_logic;     -- enable
			OP     : in  std_logic_vector(4 downto 0); -- opcode
			Y      : out std_logic_vector(31 downto 0); -- operation result
			imm    : in  std_logic_vector(4 downto 0); -- immediate data
			pc     : in  std_logic_vector(31 downto 0);
			branch : out std_logic;     -- Branch flag
			clk    : IN  STD_LOGIC);
	end component alu;

	component reg32by32
		port(
			clk      : in  std_logic;
			dataD    : in  std_logic_vector(31 downto 0);
			selA     : in  STD_LOGIC_VECTOR(4 downto 0);
			selB     : in  STD_LOGIC_VECTOR(4 downto 0);
			sel7Seg  : in  std_logic_vector(4 downto 0);
			selD     : in  STD_LOGIC_VECTOR(4 downto 0);
			we       : in  std_logic;
			en       : in  std_logic;
			dataA    : out std_logic_vector(31 downto 0);
			data7seg : out std_logic_vector(31 downto 0);
			dataB    : out std_logic_vector(31 downto 0)
		);
	end component reg32by32;

	component memory
		PORT(
			clock     : IN  STD_LOGIC := '1';
			data      : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
			rdaddress : IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
			wraddress : IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
			wren      : IN  STD_LOGIC := '0';
			q         : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	end component;

	component instructionMemory
		PORT(
			address : IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
			clock   : IN  STD_LOGIC := '1';
			q       : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	end component;

	component pc_unit is
		Port(I_clk   : in  STD_LOGIC;
		     I_nPC   : in  STD_LOGIC_VECTOR(31 downto 0);
		     reset   : in  std_LOGIC;
		     fetchEn : in  std_LOGIC;
		     O_PC    : out STD_LOGIC_VECTOR(31 downto 0)
		    );
	end component pc_unit;

	component to_7seg is
		Port(A    : in  STD_LOGIC_VECTOR(3 downto 0);
		     rst  : in  std_logic;
		     clk  : in  std_logic;
		     seg7 : out STD_LOGIC_VECTOR(6 downto 0)
		    );
	end component to_7seg;

	component clockDivider is
		port(
			CLK_50MHz : in  std_logic;  -- clock signal
			clk       : out std_logic); -- clk to blink
	end component clockDivider;

	signal instruction   : STD_LOGIC_VECTOR(31 downto 0);
	signal selA          : STD_LOGIC_VECTOR(4 downto 0);
	signal selB          : STD_LOGIC_VECTOR(4 downto 0);
	signal selD          : STD_LOGIC_VECTOR(4 downto 0);
	signal dataImm       : STD_LOGIC_VECTOR(31 downto 0);
	signal regDwe        : STD_LOGIC;
	signal aluOp         : STD_LOGIC_VECTOR(4 downto 0);
	signal memWren       : std_logic;
	signal memToReg      : std_logic;
	signal branchControl : std_logic := '0';
	signal aluImm        : std_logic;
	signal jumpReg       : std_logic := '1';
	signal regREn        : std_logic;
	signal regWEn        : std_logic;
	signal aluEn         : std_logic;
	signal memoryEn      : std_logic;
	signal fetchEn       : std_logic;
	signal pc            : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal dataD         : std_logic_vector(31 downto 0);
	signal dataA         : std_logic_vector(31 downto 0);
	signal dataB         : std_logic_vector(31 downto 0);
	signal aluOut        : std_logic_vector(31 downto 0);
	signal branchAlu     : std_logic;
	signal aluB          : std_logic_vector(31 downto 0);
	signal dataMem       : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal newPC         : STD_LOGIC_VECTOR(31 downto 0);
	signal data7seg      : std_logic_vector(31 downto 0);
	signal regEn         : std_logic;
	--signal clk : std_logic := '1';

begin
	regEn <= std_logic(regREn) or std_logic(regWEn);
	aluB  <= dataImm when aluImm = '1' else dataB;
	dataD <= dataMem when memToReg = '1' else aluOut;
	newPC <= std_logic_vector(signed(pc) + signed(dataImm)) when branchAlu = '1' and branchControl = '1' 
	         else std_logic_vector(signed(dataA) + signed(dataImm)) and x"fffffffe" when jumpReg = '1' and branchAlu = '1'
	         else std_logic_vector(signed(pc) + 4);
	instROM : instructionMemory
		port map(
			address => pc(9 downto 0),
			clock   => clk,
			q       => instruction
		);

	--clockDivide : clockDivider 
	--	port map(
	--clk => clkIn,
	--	reset => rst,
	--clK_out => clk
	--	);

	control : controlUnit
		port map(
			clk        => clk,
			I_dataInst => instruction,
			O_selA     => selA,
			O_selB     => selB,
			O_selD     => selD,
			O_dataIMM  => dataImm,
			O_regDwe   => regDwe,
			O_aluop    => aluOp,
			memWren    => memWren,
			memToReg   => memToReg,
			branch     => branchControl,
			aluImm     => aluImm,
			jumpReg    => jumpReg,
			regREn     => regREn,
			regWEn     => regWEn,
			aluEn      => aluEn,
			memoryEn   => memoryEn,
			fetchEn    => fetchEn,
			rst        => rst
		);

	regFile : reg32by32
		port map(
			clk      => clk,
			dataD    => dataD,
			selA     => selA,
			selB     => selB,
			sel7Seg  => sel7seg,
			selD     => selD,
			we       => regDwe,
			en       => regEn,
			dataA    => dataA,
			data7seg => data7seg,
			dataB    => dataB
		);

	cpuAlu : alu
		port map(
			A      => dataA,
			B      => aluB,
			en     => aluEn,
			OP     => aluOp,
			Y      => aluOut,
			imm    => selB,
			pc     => pc,
			branch => branchAlu,
			clk    => clk
		);

	ram : memory
		port map(
			clock     => clk,
			data      => dataB,
			rdaddress => aluOut(11 downto 0),
			wraddress => aluOut(11 downto 0),
			wren      => memWren,
			q         => dataMem
		);

	programCounter : pc_unit
		port map(
			I_clk   => clk,
			I_nPC   => newPC,
			reset   => rst,
			fetchEn => fetchEn,
			O_PC    => pc
		);

	sevenSeg1 : to_7seg
		port map(
			A    => data7seg(3 downto 0),
			rst  => rst,
			clk  => clk,
			seg7 => displays_7seg(6 downto 0)
		);

	sevenSeg2 : to_7seg
		port map(
			A    => data7seg(7 downto 4),
			rst  => rst,
			clk  => clk,
			seg7 => displays_7seg(13 downto 7)
		);

	sevenSeg3 : to_7seg
		port map(
			A    => data7seg(11 downto 8),
			rst  => rst,
			clk  => clk,
			seg7 => displays_7seg(20 downto 14)
		);

	sevenSeg4 : to_7seg
		port map(
			A    => data7seg(15 downto 12),
			rst  => rst,
			clk  => clk,
			seg7 => displays_7seg(27 downto 21)
		);
end architecture RTL;
