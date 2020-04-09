library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

ENTITY controlFSM IS
	PORT(
		clk      : in  std_logic;
		reset    : in  std_logic;
		inst     : in  std_logic_vector(6 downto 0);
		step     : in  std_logic;
		decodeEn : out std_logic;
		regREn   : out std_logic;
		regWEn   : out std_logic;
		aluEn    : out std_logic;
		memoryEn : out std_logic;
		fetchEn  : out std_logic);
end controlFSM;

architecture behavior of controlFSM is
	TYPE state IS (Fetch, Fetch2, Fetch3, Decode, Decode2, regRead, regRead2, ALU, ALU2, ALU3, memory, memory2, memory3, regWrite, regWrite2
	);
	signal currState : state := Fetch;
	signal nextState : state;
begin
	process(clk, currState, nextState, reset)
	begin
		if reset = '0' then
			currState <= Fetch;
		else
			currState <= nextState;
		end if;

		if rising_edge(clk) and step = '1' then
			case currState is
				when Fetch =>
					nextState <= Fetch2;
				when Fetch2 =>
					nextState <= Fetch3;
				when Fetch3 =>
					nextState <= Decode;
				when Decode =>
					nextState <= Decode2;
				when Decode2 =>
					nextState <= regRead;
				when regRead =>
					nextState <= regRead2;
				when regRead2 =>
					nextState <= ALU;
				when ALU =>
					nextState <= ALU2;
				when ALU2 =>
					nextState <= ALU3;
				when ALU3 =>
					if (inst = "0000011" or inst = "0100011") then
						nextState <= memory;
					else
						nextState <= regWrite;
					end if;
				when memory =>
					nextState <= memory2;
				when memory2 =>
					nextState <= memory3;
				when memory3 =>
					nextState <= regWrite;
				when regWrite =>
					nextState <= regWrite2;
				when regWrite2 =>
					nextState <= Fetch;
			end case;
		end if;
		case currState is
			when Fetch | Fetch2 | Fetch3 =>
				regWEn   <= '0';
				fetchEn  <= '1';
				decodeEn <= '0';
				regREn   <= '0';
				aluEn    <= '0';
				memoryEn <= '0';
			when Decode            |Decode2 =>
				regWEn   <= '0';
				fetchEn  <= '0';
				decodeEn <= '1';
				regREn   <= '0';
				aluEn    <= '0';
				memoryEn <= '0';
			when regRead          |regRead2 =>
				regWEn   <= '0';
				fetchEn  <= '0';
				decodeEn <= '0';
				regREn   <= '1';
				aluEn    <= '0';
				memoryEn <= '0';
			when ALU                    |ALU2|ALU3 =>
				regWEn   <= '0';
				fetchEn  <= '0';
				decodeEn <= '0';
				regREn   <= '0';
				aluEn    <= '1';
				memoryEn <= '0';
			when memory                 |memory2|memory3 =>
				regWEn   <= '0';
				fetchEn  <= '0';
				decodeEn <= '0';
				regREn   <= '0';
				aluEn    <= '0';
				memoryEn <= '1';
			when regWrite               |regWrite2 =>
				regWEn   <= '1';
				fetchEn  <= '0';
				decodeEn <= '0';
				regREn   <= '0';
				aluEn    <= '0';
				memoryEn <= '0';
		end case;
	end process;
end behavior;
