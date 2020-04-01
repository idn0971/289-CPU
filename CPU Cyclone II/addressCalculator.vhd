library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity addressCalculator is
	port(
		clk           : in  std_logic;
		--rst : in std_logic;
		newPc         : out std_logic_vector(31 downto 0);
		en            : in  std_logic;
		dataImm       : in  std_logic_vector(31 downto 0);
		branchAlu     : in  std_logic;
		branchControl : in  std_logic;
		jumpReg       : in  std_logic;
		dataA         : in  std_logic_vector(31 downto 0);
		pc            : in  std_logic_vector(31 downto 0)
	);
end entity addressCalculator;

architecture RTL of addressCalculator is

begin

	process(clk)
	begin
		if (rising_edge(clk) and en = '1') then
			case branchAlu is
				when '1' =>
					if (branchControl = '1') then
						newPc <= std_logic_vector(signed(pc) + signed(dataImm));
					elsif jumpReg = '1' then
						newPc <= std_logic_vector(signed(dataA) + signed(dataImm)) and x"fffffffe";
					else
						newPc <= std_logic_vector(signed(pc) + 4);
					end if;
				when '0' =>
					newPc <= std_logic_vector(signed(pc) + 4);
			end case;
		end if;
	end process;

end architecture RTL;
