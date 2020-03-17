--------------------------------------------------------------------------------
--
--   FileName:         bcd_to_7seg_display.vhd
--   Dependencies:     none
--   Design Software:  Quartus II 64-bit Version 13.1.0 Build 162 SJ Web Edition
--
--   HDL CODE IS PROVIDED "AS IS."  DIGI-KEY EXPRESSLY DISCLAIMS ANY
--   WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
--   PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
--   BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
--   DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
--   PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
--   BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
--   ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
--
--   Version History
--   Version 1.0 7/13/2017 Scott Larson
--     Initial Public Release
--    
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY bcd_to_7seg_display IS
	PORT(
		bcd				:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);		--number to display in BCD
		display_7seg	:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0));	--outputs to seven segment display
END bcd_to_7seg_display;

ARCHITECTURE logic OF bcd_to_7seg_display IS
BEGIN

	--map bcd input to desired output segments
	WITH bcd SELECT
		display_7seg <= 	"0000001" WHEN "0000",	--0
								"1001111" WHEN "0001",	--1
								"0010010" WHEN "0010",	--2
								"0000110" WHEN "0011",	--3
								"1001100" WHEN "0100",	--4
								"0100100" WHEN "0101",	--5
								"0100000" WHEN "0110",	--6
								"0001111" WHEN "0111",	--7
								"0000000" WHEN "1000",	--8
								"0000100" WHEN "1001",	--9
								"1111111" WHEN OTHERS;	--blank when not a digit
	
END logic;