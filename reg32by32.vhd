library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity reg32by32 is
        Port( clk : in std_logic;
		        en : in std_logic;
				  dataD : in std_logic_vector(31 downto 0);
				  selA: in STD_LOGIC_VECTOR (4 downto 0);
				  selB : in STD_LOGIC_VECTOR (4 downto 0);
				  selD : in STD_LOGIC_VECTOR (4 downto 0);
				  we : in std_logic;
				  dataA : out std_logic_vector(31 downto 0);
				  dataB : out std_logic_vector(31 downto 0));
				  end reg32by32;

architecture behavior of reg32by32 is
            type regFile is array (31 downto 0) of std_logic_vector(31 downto 0);
				signal registers : regFile;
				begin
				
				process(clk, en)
				begin
				
				       if rising_edge(clk) and en = '1' then
						 
						          dataA <= registers(to_integer(unsigned(selA)));
									 dataB <= registers(to_integer(unsigned(selB)));
									 if (we = '1') then
									          registers(to_integer(unsigned(selD))) <= dataD;
									 end if;
						 end if;
			   end process;
				end behavior;