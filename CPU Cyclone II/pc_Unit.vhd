library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity pc_unit is
	Port(I_clk   : in  STD_LOGIC;
	     I_nPC   : in  STD_LOGIC_VECTOR(31 downto 0);
	     reset   : in  std_LOGIC;
	     --shouldBranch : in  std_LOGIC;
	     fetchEn  : in  std_LOGIC;
	     O_PC    : out STD_LOGIC_VECTOR(31 downto 0)
	    );
end pc_unit;

architecture Behavioral of pc_unit is
	signal current_pc : std_logic_vector(31 downto 0) := X"00000000";
begin

	process(I_clk, current_pc)
	begin
		if rising_edge(I_clk) and (fetchEn = '1' or reset = '0') then

			if reset = '0' then
				current_pc <= X"00000000";
			else
				current_pc <= I_nPC;
			end if;
		else
			current_pc <= current_pc;
		end if;
	end process;

	O_PC <= current_pc;

end Behavioral;
