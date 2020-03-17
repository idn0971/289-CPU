-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 16.1.0 Build 196 10/24/2016 SJ Lite Edition"

-- DATE "03/13/2020 20:51:22"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	CPU289 IS
    PORT (
	clk : IN std_logic;
	sel7seg : IN std_logic_vector(4 DOWNTO 0);
	displays_7seg : OUT std_logic_vector(55 DOWNTO 0);
	rst : IN std_logic
	);
END CPU289;

-- Design Ports Information
-- sel7seg[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel7seg[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel7seg[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel7seg[3]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel7seg[4]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[0]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[1]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[2]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[3]	=>  Location: PIN_L26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[4]	=>  Location: PIN_L25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[5]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[6]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[7]	=>  Location: PIN_M24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[8]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[9]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[10]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[11]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[12]	=>  Location: PIN_U23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[13]	=>  Location: PIN_U24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[14]	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[15]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[16]	=>  Location: PIN_Y25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[17]	=>  Location: PIN_W26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[18]	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[19]	=>  Location: PIN_W27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[20]	=>  Location: PIN_W28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[21]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[22]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[23]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[24]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[25]	=>  Location: PIN_AD24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[26]	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[27]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[28]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[29]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[30]	=>  Location: PIN_AG21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[31]	=>  Location: PIN_AH21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[32]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[33]	=>  Location: PIN_AF19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[34]	=>  Location: PIN_AE18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[35]	=>  Location: PIN_AD18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[36]	=>  Location: PIN_AC18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[37]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[38]	=>  Location: PIN_AH19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[39]	=>  Location: PIN_AG19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[40]	=>  Location: PIN_AF18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[41]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[42]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[43]	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[44]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[45]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[46]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[47]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[48]	=>  Location: PIN_AC17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[49]	=>  Location: PIN_AD17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[50]	=>  Location: PIN_AE17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[51]	=>  Location: PIN_AG17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[52]	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[53]	=>  Location: PIN_AF17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[54]	=>  Location: PIN_AG18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- displays_7seg[55]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF CPU289 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_sel7seg : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_displays_7seg : std_logic_vector(55 DOWNTO 0);
SIGNAL ww_rst : std_logic;
SIGNAL \sel7seg[0]~input_o\ : std_logic;
SIGNAL \sel7seg[1]~input_o\ : std_logic;
SIGNAL \sel7seg[2]~input_o\ : std_logic;
SIGNAL \sel7seg[3]~input_o\ : std_logic;
SIGNAL \sel7seg[4]~input_o\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \displays_7seg[0]~output_o\ : std_logic;
SIGNAL \displays_7seg[1]~output_o\ : std_logic;
SIGNAL \displays_7seg[2]~output_o\ : std_logic;
SIGNAL \displays_7seg[3]~output_o\ : std_logic;
SIGNAL \displays_7seg[4]~output_o\ : std_logic;
SIGNAL \displays_7seg[5]~output_o\ : std_logic;
SIGNAL \displays_7seg[6]~output_o\ : std_logic;
SIGNAL \displays_7seg[7]~output_o\ : std_logic;
SIGNAL \displays_7seg[8]~output_o\ : std_logic;
SIGNAL \displays_7seg[9]~output_o\ : std_logic;
SIGNAL \displays_7seg[10]~output_o\ : std_logic;
SIGNAL \displays_7seg[11]~output_o\ : std_logic;
SIGNAL \displays_7seg[12]~output_o\ : std_logic;
SIGNAL \displays_7seg[13]~output_o\ : std_logic;
SIGNAL \displays_7seg[14]~output_o\ : std_logic;
SIGNAL \displays_7seg[15]~output_o\ : std_logic;
SIGNAL \displays_7seg[16]~output_o\ : std_logic;
SIGNAL \displays_7seg[17]~output_o\ : std_logic;
SIGNAL \displays_7seg[18]~output_o\ : std_logic;
SIGNAL \displays_7seg[19]~output_o\ : std_logic;
SIGNAL \displays_7seg[20]~output_o\ : std_logic;
SIGNAL \displays_7seg[21]~output_o\ : std_logic;
SIGNAL \displays_7seg[22]~output_o\ : std_logic;
SIGNAL \displays_7seg[23]~output_o\ : std_logic;
SIGNAL \displays_7seg[24]~output_o\ : std_logic;
SIGNAL \displays_7seg[25]~output_o\ : std_logic;
SIGNAL \displays_7seg[26]~output_o\ : std_logic;
SIGNAL \displays_7seg[27]~output_o\ : std_logic;
SIGNAL \displays_7seg[28]~output_o\ : std_logic;
SIGNAL \displays_7seg[29]~output_o\ : std_logic;
SIGNAL \displays_7seg[30]~output_o\ : std_logic;
SIGNAL \displays_7seg[31]~output_o\ : std_logic;
SIGNAL \displays_7seg[32]~output_o\ : std_logic;
SIGNAL \displays_7seg[33]~output_o\ : std_logic;
SIGNAL \displays_7seg[34]~output_o\ : std_logic;
SIGNAL \displays_7seg[35]~output_o\ : std_logic;
SIGNAL \displays_7seg[36]~output_o\ : std_logic;
SIGNAL \displays_7seg[37]~output_o\ : std_logic;
SIGNAL \displays_7seg[38]~output_o\ : std_logic;
SIGNAL \displays_7seg[39]~output_o\ : std_logic;
SIGNAL \displays_7seg[40]~output_o\ : std_logic;
SIGNAL \displays_7seg[41]~output_o\ : std_logic;
SIGNAL \displays_7seg[42]~output_o\ : std_logic;
SIGNAL \displays_7seg[43]~output_o\ : std_logic;
SIGNAL \displays_7seg[44]~output_o\ : std_logic;
SIGNAL \displays_7seg[45]~output_o\ : std_logic;
SIGNAL \displays_7seg[46]~output_o\ : std_logic;
SIGNAL \displays_7seg[47]~output_o\ : std_logic;
SIGNAL \displays_7seg[48]~output_o\ : std_logic;
SIGNAL \displays_7seg[49]~output_o\ : std_logic;
SIGNAL \displays_7seg[50]~output_o\ : std_logic;
SIGNAL \displays_7seg[51]~output_o\ : std_logic;
SIGNAL \displays_7seg[52]~output_o\ : std_logic;
SIGNAL \displays_7seg[53]~output_o\ : std_logic;
SIGNAL \displays_7seg[54]~output_o\ : std_logic;
SIGNAL \displays_7seg[55]~output_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_sel7seg <= sel7seg;
displays_7seg <= ww_displays_7seg;
ww_rst <= rst;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X69_Y73_N23
\displays_7seg[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[0]~output_o\);

-- Location: IOOBUF_X107_Y73_N23
\displays_7seg[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[1]~output_o\);

-- Location: IOOBUF_X67_Y73_N23
\displays_7seg[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[2]~output_o\);

-- Location: IOOBUF_X115_Y50_N2
\displays_7seg[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[3]~output_o\);

-- Location: IOOBUF_X115_Y54_N16
\displays_7seg[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[4]~output_o\);

-- Location: IOOBUF_X115_Y67_N16
\displays_7seg[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[5]~output_o\);

-- Location: IOOBUF_X115_Y69_N2
\displays_7seg[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[6]~output_o\);

-- Location: IOOBUF_X115_Y41_N2
\displays_7seg[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[7]~output_o\);

-- Location: IOOBUF_X115_Y30_N9
\displays_7seg[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[8]~output_o\);

-- Location: IOOBUF_X115_Y25_N23
\displays_7seg[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[9]~output_o\);

-- Location: IOOBUF_X115_Y30_N2
\displays_7seg[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[10]~output_o\);

-- Location: IOOBUF_X115_Y20_N9
\displays_7seg[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[11]~output_o\);

-- Location: IOOBUF_X115_Y22_N2
\displays_7seg[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[12]~output_o\);

-- Location: IOOBUF_X115_Y28_N9
\displays_7seg[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[13]~output_o\);

-- Location: IOOBUF_X115_Y17_N9
\displays_7seg[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[14]~output_o\);

-- Location: IOOBUF_X115_Y16_N2
\displays_7seg[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[15]~output_o\);

-- Location: IOOBUF_X115_Y19_N9
\displays_7seg[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[16]~output_o\);

-- Location: IOOBUF_X115_Y19_N2
\displays_7seg[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[17]~output_o\);

-- Location: IOOBUF_X115_Y18_N2
\displays_7seg[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[18]~output_o\);

-- Location: IOOBUF_X115_Y20_N2
\displays_7seg[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[19]~output_o\);

-- Location: IOOBUF_X115_Y21_N16
\displays_7seg[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[20]~output_o\);

-- Location: IOOBUF_X115_Y25_N16
\displays_7seg[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[21]~output_o\);

-- Location: IOOBUF_X115_Y29_N2
\displays_7seg[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[22]~output_o\);

-- Location: IOOBUF_X100_Y0_N2
\displays_7seg[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[23]~output_o\);

-- Location: IOOBUF_X111_Y0_N2
\displays_7seg[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[24]~output_o\);

-- Location: IOOBUF_X105_Y0_N23
\displays_7seg[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[25]~output_o\);

-- Location: IOOBUF_X105_Y0_N9
\displays_7seg[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[26]~output_o\);

-- Location: IOOBUF_X105_Y0_N2
\displays_7seg[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[27]~output_o\);

-- Location: IOOBUF_X98_Y0_N23
\displays_7seg[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[28]~output_o\);

-- Location: IOOBUF_X107_Y0_N9
\displays_7seg[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[29]~output_o\);

-- Location: IOOBUF_X74_Y0_N9
\displays_7seg[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[30]~output_o\);

-- Location: IOOBUF_X74_Y0_N2
\displays_7seg[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[31]~output_o\);

-- Location: IOOBUF_X83_Y0_N23
\displays_7seg[32]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[32]~output_o\);

-- Location: IOOBUF_X83_Y0_N16
\displays_7seg[33]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[33]~output_o\);

-- Location: IOOBUF_X79_Y0_N23
\displays_7seg[34]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[34]~output_o\);

-- Location: IOOBUF_X85_Y0_N9
\displays_7seg[35]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[35]~output_o\);

-- Location: IOOBUF_X87_Y0_N16
\displays_7seg[36]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[36]~output_o\);

-- Location: IOOBUF_X98_Y0_N16
\displays_7seg[37]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[37]~output_o\);

-- Location: IOOBUF_X72_Y0_N2
\displays_7seg[38]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[38]~output_o\);

-- Location: IOOBUF_X72_Y0_N9
\displays_7seg[39]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[39]~output_o\);

-- Location: IOOBUF_X79_Y0_N16
\displays_7seg[40]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[40]~output_o\);

-- Location: IOOBUF_X69_Y0_N2
\displays_7seg[41]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[41]~output_o\);

-- Location: IOOBUF_X89_Y0_N23
\displays_7seg[42]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[42]~output_o\);

-- Location: IOOBUF_X65_Y0_N2
\displays_7seg[43]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[43]~output_o\);

-- Location: IOOBUF_X65_Y0_N9
\displays_7seg[44]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[44]~output_o\);

-- Location: IOOBUF_X89_Y0_N16
\displays_7seg[45]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[45]~output_o\);

-- Location: IOOBUF_X67_Y0_N16
\displays_7seg[46]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[46]~output_o\);

-- Location: IOOBUF_X67_Y0_N23
\displays_7seg[47]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[47]~output_o\);

-- Location: IOOBUF_X74_Y0_N23
\displays_7seg[48]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[48]~output_o\);

-- Location: IOOBUF_X74_Y0_N16
\displays_7seg[49]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[49]~output_o\);

-- Location: IOOBUF_X67_Y0_N9
\displays_7seg[50]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[50]~output_o\);

-- Location: IOOBUF_X62_Y0_N23
\displays_7seg[51]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[51]~output_o\);

-- Location: IOOBUF_X62_Y0_N16
\displays_7seg[52]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[52]~output_o\);

-- Location: IOOBUF_X67_Y0_N2
\displays_7seg[53]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[53]~output_o\);

-- Location: IOOBUF_X69_Y0_N9
\displays_7seg[54]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[54]~output_o\);

-- Location: IOOBUF_X54_Y0_N23
\displays_7seg[55]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \displays_7seg[55]~output_o\);

-- Location: IOIBUF_X115_Y17_N1
\sel7seg[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel7seg(0),
	o => \sel7seg[0]~input_o\);

-- Location: IOIBUF_X115_Y14_N1
\sel7seg[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel7seg(1),
	o => \sel7seg[1]~input_o\);

-- Location: IOIBUF_X115_Y15_N8
\sel7seg[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel7seg(2),
	o => \sel7seg[2]~input_o\);

-- Location: IOIBUF_X115_Y13_N8
\sel7seg[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel7seg(3),
	o => \sel7seg[3]~input_o\);

-- Location: IOIBUF_X115_Y18_N8
\sel7seg[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel7seg(4),
	o => \sel7seg[4]~input_o\);

-- Location: IOIBUF_X115_Y40_N8
\rst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: IOIBUF_X0_Y36_N15
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

ww_displays_7seg(0) <= \displays_7seg[0]~output_o\;

ww_displays_7seg(1) <= \displays_7seg[1]~output_o\;

ww_displays_7seg(2) <= \displays_7seg[2]~output_o\;

ww_displays_7seg(3) <= \displays_7seg[3]~output_o\;

ww_displays_7seg(4) <= \displays_7seg[4]~output_o\;

ww_displays_7seg(5) <= \displays_7seg[5]~output_o\;

ww_displays_7seg(6) <= \displays_7seg[6]~output_o\;

ww_displays_7seg(7) <= \displays_7seg[7]~output_o\;

ww_displays_7seg(8) <= \displays_7seg[8]~output_o\;

ww_displays_7seg(9) <= \displays_7seg[9]~output_o\;

ww_displays_7seg(10) <= \displays_7seg[10]~output_o\;

ww_displays_7seg(11) <= \displays_7seg[11]~output_o\;

ww_displays_7seg(12) <= \displays_7seg[12]~output_o\;

ww_displays_7seg(13) <= \displays_7seg[13]~output_o\;

ww_displays_7seg(14) <= \displays_7seg[14]~output_o\;

ww_displays_7seg(15) <= \displays_7seg[15]~output_o\;

ww_displays_7seg(16) <= \displays_7seg[16]~output_o\;

ww_displays_7seg(17) <= \displays_7seg[17]~output_o\;

ww_displays_7seg(18) <= \displays_7seg[18]~output_o\;

ww_displays_7seg(19) <= \displays_7seg[19]~output_o\;

ww_displays_7seg(20) <= \displays_7seg[20]~output_o\;

ww_displays_7seg(21) <= \displays_7seg[21]~output_o\;

ww_displays_7seg(22) <= \displays_7seg[22]~output_o\;

ww_displays_7seg(23) <= \displays_7seg[23]~output_o\;

ww_displays_7seg(24) <= \displays_7seg[24]~output_o\;

ww_displays_7seg(25) <= \displays_7seg[25]~output_o\;

ww_displays_7seg(26) <= \displays_7seg[26]~output_o\;

ww_displays_7seg(27) <= \displays_7seg[27]~output_o\;

ww_displays_7seg(28) <= \displays_7seg[28]~output_o\;

ww_displays_7seg(29) <= \displays_7seg[29]~output_o\;

ww_displays_7seg(30) <= \displays_7seg[30]~output_o\;

ww_displays_7seg(31) <= \displays_7seg[31]~output_o\;

ww_displays_7seg(32) <= \displays_7seg[32]~output_o\;

ww_displays_7seg(33) <= \displays_7seg[33]~output_o\;

ww_displays_7seg(34) <= \displays_7seg[34]~output_o\;

ww_displays_7seg(35) <= \displays_7seg[35]~output_o\;

ww_displays_7seg(36) <= \displays_7seg[36]~output_o\;

ww_displays_7seg(37) <= \displays_7seg[37]~output_o\;

ww_displays_7seg(38) <= \displays_7seg[38]~output_o\;

ww_displays_7seg(39) <= \displays_7seg[39]~output_o\;

ww_displays_7seg(40) <= \displays_7seg[40]~output_o\;

ww_displays_7seg(41) <= \displays_7seg[41]~output_o\;

ww_displays_7seg(42) <= \displays_7seg[42]~output_o\;

ww_displays_7seg(43) <= \displays_7seg[43]~output_o\;

ww_displays_7seg(44) <= \displays_7seg[44]~output_o\;

ww_displays_7seg(45) <= \displays_7seg[45]~output_o\;

ww_displays_7seg(46) <= \displays_7seg[46]~output_o\;

ww_displays_7seg(47) <= \displays_7seg[47]~output_o\;

ww_displays_7seg(48) <= \displays_7seg[48]~output_o\;

ww_displays_7seg(49) <= \displays_7seg[49]~output_o\;

ww_displays_7seg(50) <= \displays_7seg[50]~output_o\;

ww_displays_7seg(51) <= \displays_7seg[51]~output_o\;

ww_displays_7seg(52) <= \displays_7seg[52]~output_o\;

ww_displays_7seg(53) <= \displays_7seg[53]~output_o\;

ww_displays_7seg(54) <= \displays_7seg[54]~output_o\;

ww_displays_7seg(55) <= \displays_7seg[55]~output_o\;
END structure;


