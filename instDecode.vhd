library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity decode is
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
end decode;

architecture Behavioral of decode is
begin

	process(clk)
	begin
		if rising_edge(clk) and I_en = '1' then
			O_selA  <= I_dataInst(19 downto 15);
			O_selB  <= I_dataInst(24 downto 20);
			O_selD  <= I_dataInst(11 downto 7);
			funct7  <= I_dataInst(31 downto 25);
			funct3  <= I_dataInst(14 downto 12);
			O_aluop <= I_dataInst(6 downto 0);
			case I_dataInst(6 downto 0) is
				when "1100011" =>       -- S-type B-imm
					O_dataIMM <= std_logic_vector(resize(signed(std_logic_vector'(I_dataInst(31) & I_dataInst(31))), 20)) & I_dataInst(7) & I_dataInst(30 downto 25) & I_dataInst(11 downto 8) & '0';
				when "1101111" =>
					O_dataIMM <= std_logic_vector(resize(signed(std_logic_vector'(I_dataInst(31) & I_dataInst(31))), 12)) & I_dataInst(19 downto 12) & I_dataInst(20) & I_dataInst(30 downto 25) & I_dataInst(24 downto 21) & '0';
				when "0100011" =>
					O_dataIMM <= std_logic_vector(resize(signed(I_dataInst(31 downto 25)), 27)) & I_dataInst(11 downto 8) & I_dataInst(7);
				when "0110111"|"0010111" =>
					O_dataIMM <= I_dataInst(31 downto 12) & "000000000000";
				when others =>
					O_dataIMM <= std_logic_vector(resize(unsigned(I_dataInst(31 downto 20)), 32));
			end case;
			case I_dataInst(6 downto 0) is
				when "1100011" | "1101111" =>
					branch  <= '1';
					jumpReg <= '0';
				when "1100111" =>
					jumpReg <= '1';
					branch  <= '0';
				when others =>
					branch  <= '0';
					jumpReg <= '0';
			end case;
			case I_dataInst(6 downto 0) is
				when "0010011" | "0110111" | "0010111" | "0000011" | "0100011" =>
					aluImm <= '1';
				when others =>
					aluImm <= '0';
			end case;
			case I_dataInst(6 downto 0) is
				when "0100011" =>
					memWren  <= '1';
					memToReg <= '0';
				when "0000011" =>
					memWren  <= '0';
					memToReg <= '1';
				when others =>
					memWren  <= '0';
					memToReg <= '0';
			end case;
			case I_dataInst(6 downto 0) is
				when "1100011" | "0100011" =>
					O_regDwe <= '0';
				when others => O_regDwe <= '1';
			end case;
		end if;
	end process;

end Behavioral;
