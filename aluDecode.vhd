library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aluDecode is
	port(
		clk       : in  std_logic;
		en        : in  std_logic;
		opcode    : in  std_logic_vector(6 downto 0);
		funct3    : in  std_logic_vector(2 downto 0);
		funct7    : in  std_logic_vector(6 downto 0);
		aluOpcode : out std_logic_vector(4 downto 0)
	);
end entity aluDecode;

architecture RTL of aluDecode is

begin
	process(clk)
	begin
		if rising_edge(clk) and en = '1' then
			case opcode is
				when "0110011" =>
					case funct7 is
						when "0000000" =>
							case funct3 is
								when "000" =>
									aluOpcode <= "00000";
								when "111" =>
									aluOpcode <= "00010";
								when "110" =>
									aluOpcode <= "00011";
								when "100" =>
									aluOpcode <= "00100";
								when "010" =>
									aluOpcode <= "00101";
								when "011" =>
									aluOpcode <= "00110";
								when "101" =>
									aluOpcode <= "01001";
								when "001" =>
									aluOpcode <= "01011";
								when others => aluOpcode <= "11111";
							end case;
						when "0100000" =>
							case funct3 is
								when "000" =>
									aluOpcode <= "00001";
								when "101" =>
									aluOpcode <= "00111";
								when others => aluOpcode <= "11111";
							end case;
						when "0000001" =>
							aluOpcode <= "01101";
						when others => aluOpcode <= "11111";
					end case;
				when "0010011" =>
					case funct3 is
						when "000" =>
							aluOpcode <= "00000";
						when "111" =>
							aluOpcode <= "00010";
						when "110" =>
							aluOpcode <= "00011";
						when "100" =>
							aluOpcode <= "00100";
						when "010" =>
							aluOpcode <= "00101";
						when "011" =>
							aluOpcode <= "00110";
						when "001" =>
							aluOpcode <= "01100";
						when "101" =>
							case funct7 is
								when "0100000" =>
									aluOpcode <= "01000";
								when "0000000" =>
									aluOpcode <= "01010";
								when others => aluOpcode <= "11111";
							end case;
						when others => aluOpcode <= "11111";
					end case;
				when "0110111" =>
					aluOpcode <= "01110";
				when "0010111" =>
					aluOpcode <= "01111";
				when "0000011" =>
					aluOpcode <= "10000";
				when "0100011" =>
					aluOpcode <= "10001";
				when "1101111" =>
					aluOpcode <= "10010";
				when "1100111" =>
					aluOpcode <= "10011";
				when "1100011" =>
					case funct3 is
						when "000" =>
							aluOpcode <= "10100";
						when "001" =>
							aluOpcode <= "10101";
						when "100" =>
							aluOpcode <= "10111";
						when "101" =>
							aluOpcode <= "11000";
						when "110" =>
							aluOpcode <= "11001";
						when "111" =>
							aluOpcode <= "11010";
						when others => aluOpcode <= "11111";
					end case;
				when others => aluOpcode <= "11111";
			end case;
		end if;
	end process;
end architecture RTL;
