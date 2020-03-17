library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity clockDivider is
   port (
      CLK_50MHz : in  std_logic;          -- clock signal
      clk       : out std_logic);         -- clk to blink
end clockDivider;

architecture Behavior of clockDivider is
   signal counter : integer;  -- signal that does the
                                                    -- counting
   signal CLK_1HZ : std_logic;           -- to drive the clk

begin  -- Behavior
   -- purpose: clk blinking
   -- type   : sequential
   -- inputs : CLK_50MHz, <reset>
   -- outputs:

   Prescaler: process (CLK_50MHz)
   begin  -- process Prescaler

      if CLK_50MHz'event and CLK_50MHz = '1' then  -- rising clock edge
         if counter < 10000000 then   -- Binary value is
                                                         -- 25e6
            counter <= counter + 1;
         else
            CLK_1HZ <= not CLK_1HZ;
            counter <= 0;
         end if;
      end if;
   end process Prescaler;

   clk <= CLK_1HZ;
end Behavior;
