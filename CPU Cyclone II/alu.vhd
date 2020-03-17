library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity alu is
	port(                               -- the alu connections to external circuitry:
		A      : in  std_logic_vector(31 downto 0); -- operand A
		B      : in  std_logic_vector(31 downto 0); -- operand B
		en     : in  std_logic;         -- enable
		--in_we   : in  std_logic;        -- Input Write Enable
		OP     : in  std_logic_vector(4 downto 0); -- opcode
		Y      : out std_logic_vector(31 downto 0); -- operation result
		imm    : in  std_logic_vector(4 downto 0); -- immediate data
		pc     : in  std_logic_vector(31 downto 0);
		branch : out std_logic;         -- Branch flag
		--out_we  : out std_logic;        -- out write enable
		clk    : IN  STD_LOGIC);
	--display : out std_logic);       -- display flag);
end alu;

architecture behavioral of alu is
	signal output       : std_logic_vector(31 downto 0);
	signal shouldBranch : std_logic;
	constant zero         : std_logic_vector(30 downto 0) := "0000000000000000000000000000000";
	function To_Std_Logic(L : BOOLEAN) return std_ulogic is
	begin
		if L then
			return ('1');
		else
			return ('0');
		end if;
	end function To_Std_Logic;
	signal mult : std_logic_vector(63 downto 0);
begin
	process(clk)
	begin
		if rising_edge(clk) and en = '1' then
			--out_we <= in_we;
			case OP is                  -- decode the opcode and perform the operation:
				when "00000" =>
					output <= std_logic_vector(signed(A) + signed(B));
				when "00001" =>
					output <= std_logic_vector(signed(A) - signed(B));
				when "00010" =>
					output <= A and B;
				when "00011" =>
					output <= A or B;
				when "00100" =>
					output <= A xor B;
				when "00101" =>
					output <= zero & To_Std_Logic(signed(A) < signed(B));
				when "00110" =>
					output <= zero & To_Std_Logic(unsigned(A) < unsigned(B));
				when "00111" =>
					output <= std_logic_vector(shift_right(signed(A), to_integer(unsigned(B(4 downto 0)))));
				when "01000" =>
					output <= std_logic_vector(shift_right(signed(A), to_integer(unsigned(imm))));
				when "01001" =>
					output <= std_logic_vector(shift_right(unsigned(A), to_integer(unsigned(B(4 downto 0)))));
				when "01010" =>
					output <= std_logic_vector(shift_right(unsigned(A), to_integer(unsigned(imm))));
				when "01011" =>
					output <= std_logic_vector(shift_left(unsigned(A), to_integer(unsigned(B(4 downto 0)))));
				when "01100" =>
					output <= std_logic_vector(shift_left(unsigned(A), to_integer(unsigned(imm))));
				when "01101" =>
					mult <= std_logic_vector(signed(A) * signed(B));
					output <= mult(31 downto 0);
				when "01110" => 
					output <= B;
				when "01111" =>
					output <= std_logic_vector(signed(pc) + signed(B));
				when "10000"|"10001" =>
					output <= std_logic_vector(signed(A) + signed(B));
				when "10010"|"10011" =>
					output       <= std_logic_vector(signed(pc) + 4);
					shouldBranch <= '1';
				when "10100" =>
					if A = B then
						shouldBranch <= '1';
					else
						shouldBranch <= '0';
					end if;
				when "10101" =>
					if A /= B then
						shouldBranch <= '1';
					else
						shouldBranch <= '0';
					end if;
				when "10111" =>
					if signed(A) < signed(B) then
						shouldBranch <= '1';
					else
						shouldBranch <= '0';
					end if;
				when "11000" =>
					if signed(A) >= signed(B) then
						shouldBranch <= '1';
					else
						shouldBranch <= '0';
					end if;
				when "11001" =>
					if unsigned(A) < unsigned(B) then
						shouldBranch <= '1';
					else
						shouldBranch <= '0';
					end if;
				when "11010" =>
					if unsigned(A) >= unsigned(B) then
						shouldBranch <= '1';
					else
						shouldBranch <= '0';
					end if;
				when others => output <= X"00000000";
			end case;
		end if;
	end process;
	Y      <= output;
	branch <= shouldBranch;
end behavioral;
