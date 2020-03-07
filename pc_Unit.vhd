library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity pc_unit is
    Port ( I_clk : in  STD_LOGIC;
           I_nPC : in  STD_LOGIC_VECTOR (15 downto 0);
           reset : in std_LOGIC;
			  shouldBranch : in std_LOGIC;
			  regWEn : in std_LOGIC;
			  fetchEn : in std_LOGIC;
           O_PC : out  STD_LOGIC_VECTOR (15 downto 0)
           );
end pc_unit;

architecture Behavioral of pc_unit is
constant PCU_OP_NOP: std_logic_vector(1 downto 0):= "00";
constant PCU_OP_INC: std_logic_vector(1 downto 0):= "01";
constant PCU_OP_ASSIGN: std_logic_vector(1 downto 0):= "10";
constant PCU_OP_RESET: std_logic_vector(1 downto 0):= "11";
  signal current_pc: std_logic_vector( 15 downto 0) := X"0000";
begin
  
  process (I_clk, regWEn, reset)
  begin
  
    if rising_edge(I_clk) and (regWEn = '1' or reset = '1' ) then 
	 
      if reset = '1' then
		current_pc <= X"0000";
      elsif shouldBranch = '1' and regWEn = '1' then
	   current_pc <= I_nPC;
	   elsif shouldBranch = '0' and regWEn = '1' then
      current_pc <= std_logic_vector(signed(current_pc) + X"0001");
		--current_pc <= std_logic_vector(signed(current_pc) - X"0001");
      else
		current_pc <= current_pc;
      end if;
		else 
		current_pc <= current_pc;
    end if;
  end process;
 
  O_PC <= current_pc;
 
end Behavioral;