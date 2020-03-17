library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity signal_generator is
	port(
		clk, reset : in  std_logic;
		clk_out    : out std_logic);
end signal_generator;

architecture behaviour of signal_generator is

	signal count_prsnt, count_nxt : std_logic_vector(24 downto 0);

begin
	process(clk, reset)
	begin
		if reset = '1' then
			count_prsnt <= "0000000000000000000000000";     --initialize the counter
		elsif rising_edge(clk) then
			count_prsnt <= count_nxt;   --fliflop for good timming
		end if;
	end process;
	count_nxt <= count_prsnt + "00001"; --the counter nxt value
	clk_out   <= '1' when count_prsnt = "1011111010111100001000000" else '0';
end behaviour;
