library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity to_7seg is
	Port(A    : in  STD_LOGIC_VECTOR(3 downto 0);
	     rst  : in  std_logic;
	     clk  : in  std_logic;
	     seg7 : out STD_LOGIC_VECTOR(6 downto 0)
	    );
end to_7seg;

architecture Behavioral of to_7seg is
	signal display7 : STD_LOGIC_VECTOR(6 downto 0) := "1111111";
begin

	--'a' corresponds to MSB of seg7 and 'g' corresponds to LSB of seg7.
	process(clk, rst)
	BEGIN
		if rst = '0' then
			display7 <= "0000001";
		elsif rising_edge(clk) then
			case A is
				when "0000" => display7 <= "1000000"; -- '0'
				when "0001" => display7 <= "1111001"; -- '1'
				when "0010" => display7 <= "0100100"; -- '2'
				when "0011" => display7 <= "0110000"; -- '3'
				when "0100" => display7 <= "0011001"; -- '4' 
				when "0101" => display7 <= "0010010"; -- '5'
				when "0110" => display7 <= "0000010"; -- '6'
				when "0111" => display7 <= "1111000"; -- '7'
				when "1000" => display7 <= "0000000"; -- '8'
				when "1001" => display7 <= "0010000"; -- '9'
				when "1010" => display7 <= "0001000"; -- 'A'
				when "1011" => display7 <= "0000011"; -- 'b'
				when "1100" => display7 <= "1000110"; -- 'C'
				when "1101" => display7 <= "0100001"; -- 'd'
				when "1110" => display7 <= "0000110"; -- 'E'
				when "1111" => display7 <= "0001110"; -- 'F'
				when others => NULL;
			end case;
		end if;
	end process;
	seg7 <= display7;
end Behavioral;
