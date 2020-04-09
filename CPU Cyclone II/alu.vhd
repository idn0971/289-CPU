library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity alu is
	port(                               -- the alu connections to external circuitry:
		A        : in  std_logic_vector(31 downto 0); -- operand A
		B        : in  std_logic_vector(31 downto 0); -- operand B
		en       : in  std_logic;       -- enable
		--in_we   : in  std_logic;        -- Input Write Enable
		OP       : in  std_logic_vector(4 downto 0); -- opcode
		Y        : out std_logic_vector(31 downto 0); -- operation result
		imm      : in  std_logic_vector(4 downto 0); -- immediate data
		pc       : in  std_logic_vector(31 downto 0);
		memWrite : out std_logic;
		branch   : out std_logic;       -- Branch flag
		--out_we  : out std_logic;        -- out write enable
		clk      : IN  STD_LOGIC);
	--display : out std_logic);       -- display flag);
end alu;

architecture behavioral of alu is
	signal output       : std_logic_vector(31 downto 0);
	signal shouldBranch : std_logic;
	--constant zero         : std_logic_vector(30 downto 0) := "0000000000000000000000000000000";

	signal mult : std_logic_vector(63 downto 0);
	--signal memWrite : std_logic;
begin
	process(clk)
	begin
		if rising_edge(clk) and en = '1' then
			--out_we <= in_we;
			case OP is                  -- decode the opcode and perform the operation:
				when "00000" =>
					output       <= std_logic_vector(signed(A) + signed(B));
					shouldBranch <= '0';
					memWrite     <= '0';
				when "00001" =>
					output       <= std_logic_vector(signed(A) - signed(B));
					shouldBranch <= '0';
					memWrite     <= '0';
				when "00010" =>
					output       <= A and B;
					shouldBranch <= '0';
					memWrite     <= '0';
				when "00011" =>
					output       <= A or B;
					shouldBranch <= '0';
					memWrite     <= '0';
				when "00100" =>
					output       <= A xor B;
					shouldBranch <= '0';
					memWrite     <= '0';
				when "00101" =>
					shouldBranch <= '0';
					memWrite     <= '0';
					if signed(A) < signed(B) then
						output <= x"00000001";
					else
						output <= x"00000000";
					end if;
				when "00110" =>
					shouldBranch <= '0';
					memWrite     <= '0';
					if unsigned(A) < unsigned(B) then
						output <= x"00000001";
					else
						output <= x"00000000";
					end if;
				when "00111" =>
					memWrite     <= '0';
					output       <= std_logic_vector(shift_right(signed(A), to_integer(unsigned(B(4 downto 0)))));
					shouldBranch <= '0';
				when "01000" =>
					output       <= std_logic_vector(shift_right(signed(A), to_integer(unsigned(imm))));
					shouldBranch <= '0';
					memWrite     <= '0';
				when "01001" =>
					output       <= std_logic_vector(shift_right(unsigned(A), to_integer(unsigned(B(4 downto 0)))));
					shouldBranch <= '0';
					memWrite     <= '0';
				when "01010" =>
					output       <= std_logic_vector(shift_right(unsigned(A), to_integer(unsigned(imm))));
					shouldBranch <= '0';
					memWrite     <= '0';
				when "01011" =>
					output       <= std_logic_vector(shift_left(unsigned(A), to_integer(unsigned(B(4 downto 0)))));
					shouldBranch <= '0';
					memWrite     <= '0';
				when "01100" =>
					output       <= std_logic_vector(shift_left(unsigned(A), to_integer(unsigned(imm))));
					shouldBranch <= '0';
					memWrite     <= '0';
				when "01101" =>
					mult         <= std_logic_vector(signed(A) * signed(B));
					output       <= mult(31 downto 0);
					shouldBranch <= '0';
					memWrite     <= '0';
				when "01110" =>
					output       <= B;
					shouldBranch <= '0';
					memWrite     <= '0';
				when "01111" =>
					output       <= std_logic_vector(signed(pc) + signed(B));
					shouldBranch <= '0';
					memWrite     <= '0';
				when "10000"|"10001" =>
					output       <= std_logic_vector(signed(A) + signed(B));
					memWrite     <= '1';
					shouldBranch <= '0';
				when "10010"|"10011" =>
					output       <= std_logic_vector(signed(pc) + 4);
					shouldBranch <= '1';
					memWrite     <= '0';
				when "10100" =>
					memWrite <= '0';
					if A = B then
						shouldBranch <= '1';
						output       <= X"00000000";
					else
						shouldBranch <= '0';
						output       <= X"00000000";
					end if;
				when "10101" =>
					memWrite <= '0';
					if A /= B then
						shouldBranch <= '1';
						output       <= X"00000000";
					else
						shouldBranch <= '0';
						output       <= X"00000000";
					end if;
				when "10111" =>
					memWrite <= '0';
					if signed(A) < signed(B) then
						shouldBranch <= '1';
						output       <= X"00000000";
					else
						shouldBranch <= '0';
						output       <= X"00000000";
					end if;
				when "11000" =>
					memWrite <= '0';
					if signed(A) >= signed(B) then
						shouldBranch <= '1';
						output       <= X"00000000";
					else
						shouldBranch <= '0';
						output       <= X"00000000";
					end if;
				when "11001" =>
					memWrite <= '0';
					if unsigned(A) < unsigned(B) then
						shouldBranch <= '1';
						output       <= X"00000000";
					else
						shouldBranch <= '0';
						output       <= X"00000000";
					end if;
				when "11010" =>
					memWrite <= '0';
					if unsigned(A) >= unsigned(B) then
						shouldBranch <= '1';
						output       <= X"00000000";
					else
						shouldBranch <= '0';
						output       <= X"00000000";
					end if;
				when others =>
					memWrite     <= '0';
					output       <= X"00000000";
					shouldBranch <= '0';
			end case;
		end if;
	end process;
	Y      <= output;
	branch <= shouldBranch;
end behavioral;
