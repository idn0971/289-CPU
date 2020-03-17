--------------------------------------------------------------------------------
--
--   FileName:         seven_segments.vhd
--   Dependencies:     binary_to_bcd.vhd, binary_to_bcd_digit.vhd,
--                     bcd_to_7seg_display.vhd
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
--   Version 1.0 07/13/2017 Scott Larson
--     Initial Public Release
--   Version 1.1 02/05/2019 Scott Larson
--     Added generic parameter to configure 7-segment display polarity
--    
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY seven_segments IS
	GENERIC(
		bits        : INTEGER   := 32;  --allowable size of the input numbers in bits
		digits      : INTEGER   := 4;   --number of seven segment displays
		ss_polarity : STD_LOGIC := '0'); --7-seg display connection polarity, '0' = common anode, '1' = common cathode
	PORT(
		clk           : IN  STD_LOGIC;  --system clock
		reset_n       : IN  STD_LOGIC;  --active low asynchronus reset		
		number        : IN  std_logic_vector(bits-1 downto 0);    --number to display on the 7 segment displays
		displays_7seg : OUT STD_LOGIC_VECTOR(digits * 7 - 1 DOWNTO 0)); --outputs to 7 segment displays
END seven_segments;

ARCHITECTURE logic OF seven_segments IS
	SIGNAL binary     : STD_LOGIC_VECTOR(bits - 1 DOWNTO 0); --binary value of the input integer
	SIGNAL bcd        : STD_LOGIC_VECTOR(digits * 4 - 1 DOWNTO 0); --BCD value of the input integer
	SIGNAL digit_ena  : STD_LOGIC_VECTOR(digits + 1 DOWNTO 1); --enable for each digit (to disable leading zeros)
	SIGNAL bcd_output : STD_LOGIC_VECTOR(digits * 4 - 1 DOWNTO 0); --BCD value with leading zeros set to "1111"
	SIGNAL map_7seg   : STD_LOGIC_VECTOR(digits * 7 - 1 DOWNTO 0); --mapped display outputs in common anode polarity

	--binary to BCD converter component
	component binary_to_bcd
		generic(
			bits   : INTEGER;
			digits : INTEGER
		);
		port(
			clk     : IN  STD_LOGIC;
			reset_n : IN  STD_LOGIC;
			ena     : IN  STD_LOGIC;
			binary  : IN  STD_LOGIC_VECTOR(bits - 1 DOWNTO 0);
			busy    : OUT STD_LOGIC;
			bcd     : OUT STD_LOGIC_VECTOR(digits * 4 - 1 DOWNTO 0)
		);
	end component binary_to_bcd;

	--BCD number to 7 segment display mapping component
	COMPONENT bcd_to_7seg_display IS
		PORT(
			bcd          : IN  STD_LOGIC_VECTOR(3 DOWNTO 0); --number to display in BCD
			display_7seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)); --outputs to seven segment display
	END COMPONENT;

BEGIN

	--convert the integer input into a binary number
	binary <= number;

	--convert the binary number into BCD
	converter : binary_to_bcd
		GENERIC MAP(bits, digits)
		PORT MAP(clk, reset_n, '1', binary, OPEN, bcd);

	--set BCD digits that are leading zeros to "1111" so they will not display
	digit_ena(digits + 1) <= '0';
	bcd_no_leading_zeros : FOR i IN digits DOWNTO 1 GENERATE
		digit_ena(i) <= digit_ena(i + 1) OR bcd(i * 4 - 1) OR bcd(i * 4 - 2) OR bcd(i * 4 - 3) OR bcd(i * 4 - 4);
		WITH digit_ena(i) SELECT bcd_output(i * 4 - 1 DOWNTO i * 4 - 4) <=
			bcd(i * 4 - 1 DOWNTO i * 4 - 4) WHEN '1',
			"1111" WHEN OTHERS;
	END GENERATE;

	--map bcd digits to their corresponding seven segment displays
	seven_segment_displays : FOR i IN 1 to digits GENERATE
		display : bcd_to_7seg_display
			PORT MAP(bcd_output(i * 4 - 1 DOWNTO i * 4 - 4), map_7seg(i * 7 - 1 DOWNTO i * 7 - 7));
	END GENERATE;

	--set output to 7-segments to the proper polarity
	WITH ss_polarity SELECT displays_7seg <=
		map_7seg WHEN '0',              --common anode display connections
		NOT map_7seg WHEN OTHERS;       --common cathode display connections

END logic;
