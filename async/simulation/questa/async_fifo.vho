-- Copyright (C) 2024  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 23.1std.1 Build 993 05/14/2024 SC Lite Edition"

-- DATE "03/09/2025 22:03:51"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	async_fifo IS
    PORT (
	reset : IN std_logic;
	wclk : IN std_logic;
	rclk : IN std_logic;
	fifo_occu_in : OUT std_logic_vector(4 DOWNTO 0);
	fifo_occu_out : OUT std_logic_vector(4 DOWNTO 0);
	write_enable : IN std_logic;
	write_data_in : IN std_logic_vector(7 DOWNTO 0);
	read_enable : IN std_logic;
	read_data_out : OUT std_logic_vector(7 DOWNTO 0)
	);
END async_fifo;

-- Design Ports Information
-- fifo_occu_in[0]	=>  Location: PIN_V14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_occu_in[1]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_occu_in[2]	=>  Location: PIN_Y14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_occu_in[3]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_occu_in[4]	=>  Location: PIN_V15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_occu_out[0]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_occu_out[1]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_occu_out[2]	=>  Location: PIN_P7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_occu_out[3]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fifo_occu_out[4]	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- write_data_in[0]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- write_data_in[1]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- write_data_in[2]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- write_data_in[3]	=>  Location: PIN_J9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- write_data_in[4]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- write_data_in[5]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- write_data_in[6]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- write_data_in[7]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- read_data_out[0]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- read_data_out[1]	=>  Location: PIN_B20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- read_data_out[2]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- read_data_out[3]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- read_data_out[4]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- read_data_out[5]	=>  Location: PIN_V20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- read_data_out[6]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- read_data_out[7]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wclk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_Y15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- write_enable	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rclk	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- read_enable	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF async_fifo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_wclk : std_logic;
SIGNAL ww_rclk : std_logic;
SIGNAL ww_fifo_occu_in : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_fifo_occu_out : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_write_enable : std_logic;
SIGNAL ww_write_data_in : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_read_enable : std_logic;
SIGNAL ww_read_data_out : std_logic_vector(7 DOWNTO 0);
SIGNAL \write_data_in[0]~input_o\ : std_logic;
SIGNAL \write_data_in[1]~input_o\ : std_logic;
SIGNAL \write_data_in[2]~input_o\ : std_logic;
SIGNAL \write_data_in[3]~input_o\ : std_logic;
SIGNAL \write_data_in[4]~input_o\ : std_logic;
SIGNAL \write_data_in[5]~input_o\ : std_logic;
SIGNAL \write_data_in[6]~input_o\ : std_logic;
SIGNAL \write_data_in[7]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \wclk~input_o\ : std_logic;
SIGNAL \wclk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \write_control|addr_mem[0]~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \write_enable~input_o\ : std_logic;
SIGNAL \write_control|addr_mem[1]~feeder_combout\ : std_logic;
SIGNAL \write_control|Add0~0_combout\ : std_logic;
SIGNAL \write_control|addr_mem[2]~feeder_combout\ : std_logic;
SIGNAL \write_control|Add0~1_combout\ : std_logic;
SIGNAL \write_control|addr_mem[3]~feeder_combout\ : std_logic;
SIGNAL \write_control|Add0~2_combout\ : std_logic;
SIGNAL \write_control|addr_mem[4]~feeder_combout\ : std_logic;
SIGNAL \write_control|Add0~3_combout\ : std_logic;
SIGNAL \rclk~input_o\ : std_logic;
SIGNAL \rclk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \read_control|addr_mem[0]~0_combout\ : std_logic;
SIGNAL \read_enable~input_o\ : std_logic;
SIGNAL \read_control|addr_mem[1]~feeder_combout\ : std_logic;
SIGNAL \read_control|Add0~0_combout\ : std_logic;
SIGNAL \read_control|addr_mem[2]~feeder_combout\ : std_logic;
SIGNAL \read_control|Add0~1_combout\ : std_logic;
SIGNAL \read_control|addr_mem[3]~feeder_combout\ : std_logic;
SIGNAL \read_control|Add0~2_combout\ : std_logic;
SIGNAL \read_control|addr_mem[4]~feeder_combout\ : std_logic;
SIGNAL \read_control|Add0~3_combout\ : std_logic;
SIGNAL \read_control|addr_mem\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \write_control|addr_mem\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \read_control|ALT_INV_Add0~3_combout\ : std_logic;
SIGNAL \read_control|ALT_INV_addr_mem\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \read_control|ALT_INV_Add0~2_combout\ : std_logic;
SIGNAL \read_control|ALT_INV_Add0~1_combout\ : std_logic;
SIGNAL \read_control|ALT_INV_Add0~0_combout\ : std_logic;
SIGNAL \write_control|ALT_INV_Add0~3_combout\ : std_logic;
SIGNAL \write_control|ALT_INV_addr_mem\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \write_control|ALT_INV_Add0~2_combout\ : std_logic;
SIGNAL \write_control|ALT_INV_Add0~1_combout\ : std_logic;
SIGNAL \write_control|ALT_INV_Add0~0_combout\ : std_logic;

BEGIN

ww_reset <= reset;
ww_wclk <= wclk;
ww_rclk <= rclk;
fifo_occu_in <= ww_fifo_occu_in;
fifo_occu_out <= ww_fifo_occu_out;
ww_write_enable <= write_enable;
ww_write_data_in <= write_data_in;
ww_read_enable <= read_enable;
read_data_out <= ww_read_data_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\read_control|ALT_INV_Add0~3_combout\ <= NOT \read_control|Add0~3_combout\;
\read_control|ALT_INV_addr_mem\(4) <= NOT \read_control|addr_mem\(4);
\read_control|ALT_INV_Add0~2_combout\ <= NOT \read_control|Add0~2_combout\;
\read_control|ALT_INV_addr_mem\(3) <= NOT \read_control|addr_mem\(3);
\read_control|ALT_INV_Add0~1_combout\ <= NOT \read_control|Add0~1_combout\;
\read_control|ALT_INV_addr_mem\(2) <= NOT \read_control|addr_mem\(2);
\read_control|ALT_INV_Add0~0_combout\ <= NOT \read_control|Add0~0_combout\;
\read_control|ALT_INV_addr_mem\(1) <= NOT \read_control|addr_mem\(1);
\read_control|ALT_INV_addr_mem\(0) <= NOT \read_control|addr_mem\(0);
\write_control|ALT_INV_Add0~3_combout\ <= NOT \write_control|Add0~3_combout\;
\write_control|ALT_INV_addr_mem\(4) <= NOT \write_control|addr_mem\(4);
\write_control|ALT_INV_Add0~2_combout\ <= NOT \write_control|Add0~2_combout\;
\write_control|ALT_INV_addr_mem\(3) <= NOT \write_control|addr_mem\(3);
\write_control|ALT_INV_Add0~1_combout\ <= NOT \write_control|Add0~1_combout\;
\write_control|ALT_INV_addr_mem\(2) <= NOT \write_control|addr_mem\(2);
\write_control|ALT_INV_Add0~0_combout\ <= NOT \write_control|Add0~0_combout\;
\write_control|ALT_INV_addr_mem\(1) <= NOT \write_control|addr_mem\(1);
\write_control|ALT_INV_addr_mem\(0) <= NOT \write_control|addr_mem\(0);

-- Location: IOOBUF_X56_Y0_N19
\fifo_occu_in[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \write_control|ALT_INV_addr_mem\(0),
	devoe => ww_devoe,
	o => ww_fifo_occu_in(0));

-- Location: IOOBUF_X56_Y0_N36
\fifo_occu_in[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \write_control|Add0~0_combout\,
	devoe => ww_devoe,
	o => ww_fifo_occu_in(1));

-- Location: IOOBUF_X54_Y0_N19
\fifo_occu_in[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \write_control|Add0~1_combout\,
	devoe => ww_devoe,
	o => ww_fifo_occu_in(2));

-- Location: IOOBUF_X54_Y0_N53
\fifo_occu_in[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \write_control|Add0~2_combout\,
	devoe => ww_devoe,
	o => ww_fifo_occu_in(3));

-- Location: IOOBUF_X56_Y0_N2
\fifo_occu_in[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \write_control|Add0~3_combout\,
	devoe => ww_devoe,
	o => ww_fifo_occu_in(4));

-- Location: IOOBUF_X8_Y0_N2
\fifo_occu_out[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \read_control|ALT_INV_addr_mem\(0),
	devoe => ww_devoe,
	o => ww_fifo_occu_out(0));

-- Location: IOOBUF_X8_Y0_N19
\fifo_occu_out[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \read_control|Add0~0_combout\,
	devoe => ww_devoe,
	o => ww_fifo_occu_out(1));

-- Location: IOOBUF_X8_Y0_N36
\fifo_occu_out[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \read_control|Add0~1_combout\,
	devoe => ww_devoe,
	o => ww_fifo_occu_out(2));

-- Location: IOOBUF_X6_Y0_N19
\fifo_occu_out[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \read_control|Add0~2_combout\,
	devoe => ww_devoe,
	o => ww_fifo_occu_out(3));

-- Location: IOOBUF_X6_Y0_N53
\fifo_occu_out[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \read_control|Add0~3_combout\,
	devoe => ww_devoe,
	o => ww_fifo_occu_out(4));

-- Location: IOOBUF_X34_Y81_N59
\read_data_out[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_read_data_out(0));

-- Location: IOOBUF_X86_Y81_N53
\read_data_out[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_read_data_out(1));

-- Location: IOOBUF_X32_Y81_N36
\read_data_out[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_read_data_out(2));

-- Location: IOOBUF_X66_Y81_N42
\read_data_out[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_read_data_out(3));

-- Location: IOOBUF_X6_Y0_N2
\read_data_out[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_read_data_out(4));

-- Location: IOOBUF_X62_Y0_N19
\read_data_out[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_read_data_out(5));

-- Location: IOOBUF_X32_Y81_N2
\read_data_out[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_read_data_out(6));

-- Location: IOOBUF_X89_Y9_N5
\read_data_out[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_read_data_out(7));

-- Location: IOIBUF_X89_Y35_N61
\wclk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wclk,
	o => \wclk~input_o\);

-- Location: CLKCTRL_G9
\wclk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \wclk~input_o\,
	outclk => \wclk~inputCLKENA0_outclk\);

-- Location: LABCELL_X56_Y1_N51
\write_control|addr_mem[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \write_control|addr_mem[0]~0_combout\ = ( !\write_control|addr_mem\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \write_control|ALT_INV_addr_mem\(0),
	combout => \write_control|addr_mem[0]~0_combout\);

-- Location: IOIBUF_X54_Y0_N1
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: IOIBUF_X56_Y0_N52
\write_enable~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_write_enable,
	o => \write_enable~input_o\);

-- Location: FF_X56_Y1_N53
\write_control|addr_mem[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \wclk~inputCLKENA0_outclk\,
	d => \write_control|addr_mem[0]~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \write_enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \write_control|addr_mem\(0));

-- Location: LABCELL_X56_Y1_N15
\write_control|addr_mem[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \write_control|addr_mem[1]~feeder_combout\ = ( \write_control|Add0~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \write_control|ALT_INV_Add0~0_combout\,
	combout => \write_control|addr_mem[1]~feeder_combout\);

-- Location: FF_X56_Y1_N17
\write_control|addr_mem[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \wclk~inputCLKENA0_outclk\,
	d => \write_control|addr_mem[1]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \write_enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \write_control|addr_mem\(1));

-- Location: LABCELL_X56_Y1_N42
\write_control|Add0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \write_control|Add0~0_combout\ = ( \write_control|addr_mem\(0) & ( !\write_control|addr_mem\(1) ) ) # ( !\write_control|addr_mem\(0) & ( \write_control|addr_mem\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \write_control|ALT_INV_addr_mem\(1),
	dataf => \write_control|ALT_INV_addr_mem\(0),
	combout => \write_control|Add0~0_combout\);

-- Location: LABCELL_X56_Y1_N54
\write_control|addr_mem[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \write_control|addr_mem[2]~feeder_combout\ = ( \write_control|Add0~1_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \write_control|ALT_INV_Add0~1_combout\,
	combout => \write_control|addr_mem[2]~feeder_combout\);

-- Location: FF_X56_Y1_N56
\write_control|addr_mem[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \wclk~inputCLKENA0_outclk\,
	d => \write_control|addr_mem[2]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \write_enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \write_control|addr_mem\(2));

-- Location: LABCELL_X56_Y1_N24
\write_control|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \write_control|Add0~1_combout\ = ( \write_control|addr_mem\(2) & ( \write_control|addr_mem\(0) & ( !\write_control|addr_mem\(1) ) ) ) # ( !\write_control|addr_mem\(2) & ( \write_control|addr_mem\(0) & ( \write_control|addr_mem\(1) ) ) ) # ( 
-- \write_control|addr_mem\(2) & ( !\write_control|addr_mem\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000111111111111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \write_control|ALT_INV_addr_mem\(1),
	datae => \write_control|ALT_INV_addr_mem\(2),
	dataf => \write_control|ALT_INV_addr_mem\(0),
	combout => \write_control|Add0~1_combout\);

-- Location: LABCELL_X56_Y1_N36
\write_control|addr_mem[3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \write_control|addr_mem[3]~feeder_combout\ = ( \write_control|Add0~2_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \write_control|ALT_INV_Add0~2_combout\,
	combout => \write_control|addr_mem[3]~feeder_combout\);

-- Location: FF_X56_Y1_N38
\write_control|addr_mem[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \wclk~inputCLKENA0_outclk\,
	d => \write_control|addr_mem[3]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \write_enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \write_control|addr_mem\(3));

-- Location: LABCELL_X56_Y1_N30
\write_control|Add0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \write_control|Add0~2_combout\ = ( \write_control|addr_mem\(3) & ( \write_control|addr_mem\(0) & ( (!\write_control|addr_mem\(2)) # (!\write_control|addr_mem\(1)) ) ) ) # ( !\write_control|addr_mem\(3) & ( \write_control|addr_mem\(0) & ( 
-- (\write_control|addr_mem\(2) & \write_control|addr_mem\(1)) ) ) ) # ( \write_control|addr_mem\(3) & ( !\write_control|addr_mem\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000011111111111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \write_control|ALT_INV_addr_mem\(2),
	datad => \write_control|ALT_INV_addr_mem\(1),
	datae => \write_control|ALT_INV_addr_mem\(3),
	dataf => \write_control|ALT_INV_addr_mem\(0),
	combout => \write_control|Add0~2_combout\);

-- Location: LABCELL_X56_Y1_N21
\write_control|addr_mem[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \write_control|addr_mem[4]~feeder_combout\ = ( \write_control|Add0~3_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \write_control|ALT_INV_Add0~3_combout\,
	combout => \write_control|addr_mem[4]~feeder_combout\);

-- Location: FF_X56_Y1_N23
\write_control|addr_mem[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \wclk~inputCLKENA0_outclk\,
	d => \write_control|addr_mem[4]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \write_enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \write_control|addr_mem\(4));

-- Location: LABCELL_X56_Y1_N6
\write_control|Add0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \write_control|Add0~3_combout\ = ( \write_control|addr_mem\(4) & ( \write_control|addr_mem\(0) & ( (!\write_control|addr_mem\(3)) # ((!\write_control|addr_mem\(2)) # (!\write_control|addr_mem\(1))) ) ) ) # ( !\write_control|addr_mem\(4) & ( 
-- \write_control|addr_mem\(0) & ( (\write_control|addr_mem\(3) & (\write_control|addr_mem\(2) & \write_control|addr_mem\(1))) ) ) ) # ( \write_control|addr_mem\(4) & ( !\write_control|addr_mem\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000001011111111111111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \write_control|ALT_INV_addr_mem\(3),
	datac => \write_control|ALT_INV_addr_mem\(2),
	datad => \write_control|ALT_INV_addr_mem\(1),
	datae => \write_control|ALT_INV_addr_mem\(4),
	dataf => \write_control|ALT_INV_addr_mem\(0),
	combout => \write_control|Add0~3_combout\);

-- Location: IOIBUF_X89_Y35_N44
\rclk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rclk,
	o => \rclk~input_o\);

-- Location: CLKCTRL_G10
\rclk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \rclk~input_o\,
	outclk => \rclk~inputCLKENA0_outclk\);

-- Location: MLABCELL_X8_Y1_N51
\read_control|addr_mem[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \read_control|addr_mem[0]~0_combout\ = ( !\read_control|addr_mem\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \read_control|ALT_INV_addr_mem\(0),
	combout => \read_control|addr_mem[0]~0_combout\);

-- Location: IOIBUF_X8_Y0_N52
\read_enable~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_read_enable,
	o => \read_enable~input_o\);

-- Location: FF_X8_Y1_N53
\read_control|addr_mem[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rclk~inputCLKENA0_outclk\,
	d => \read_control|addr_mem[0]~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \read_enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \read_control|addr_mem\(0));

-- Location: MLABCELL_X8_Y1_N39
\read_control|addr_mem[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \read_control|addr_mem[1]~feeder_combout\ = ( \read_control|Add0~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \read_control|ALT_INV_Add0~0_combout\,
	combout => \read_control|addr_mem[1]~feeder_combout\);

-- Location: FF_X8_Y1_N41
\read_control|addr_mem[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rclk~inputCLKENA0_outclk\,
	d => \read_control|addr_mem[1]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \read_enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \read_control|addr_mem\(1));

-- Location: MLABCELL_X8_Y1_N18
\read_control|Add0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \read_control|Add0~0_combout\ = ( \read_control|addr_mem\(1) & ( !\read_control|addr_mem\(0) ) ) # ( !\read_control|addr_mem\(1) & ( \read_control|addr_mem\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \read_control|ALT_INV_addr_mem\(0),
	dataf => \read_control|ALT_INV_addr_mem\(1),
	combout => \read_control|Add0~0_combout\);

-- Location: MLABCELL_X8_Y1_N54
\read_control|addr_mem[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \read_control|addr_mem[2]~feeder_combout\ = ( \read_control|Add0~1_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \read_control|ALT_INV_Add0~1_combout\,
	combout => \read_control|addr_mem[2]~feeder_combout\);

-- Location: FF_X8_Y1_N56
\read_control|addr_mem[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rclk~inputCLKENA0_outclk\,
	d => \read_control|addr_mem[2]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \read_enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \read_control|addr_mem\(2));

-- Location: MLABCELL_X8_Y1_N24
\read_control|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \read_control|Add0~1_combout\ = ( \read_control|addr_mem\(2) & ( \read_control|addr_mem\(1) & ( !\read_control|addr_mem\(0) ) ) ) # ( !\read_control|addr_mem\(2) & ( \read_control|addr_mem\(1) & ( \read_control|addr_mem\(0) ) ) ) # ( 
-- \read_control|addr_mem\(2) & ( !\read_control|addr_mem\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100001111000011111111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \read_control|ALT_INV_addr_mem\(0),
	datae => \read_control|ALT_INV_addr_mem\(2),
	dataf => \read_control|ALT_INV_addr_mem\(1),
	combout => \read_control|Add0~1_combout\);

-- Location: MLABCELL_X8_Y1_N12
\read_control|addr_mem[3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \read_control|addr_mem[3]~feeder_combout\ = ( \read_control|Add0~2_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \read_control|ALT_INV_Add0~2_combout\,
	combout => \read_control|addr_mem[3]~feeder_combout\);

-- Location: FF_X8_Y1_N14
\read_control|addr_mem[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rclk~inputCLKENA0_outclk\,
	d => \read_control|addr_mem[3]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \read_enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \read_control|addr_mem\(3));

-- Location: MLABCELL_X8_Y1_N30
\read_control|Add0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \read_control|Add0~2_combout\ = ( \read_control|addr_mem\(2) & ( \read_control|addr_mem\(1) & ( !\read_control|addr_mem\(3) $ (!\read_control|addr_mem\(0)) ) ) ) # ( !\read_control|addr_mem\(2) & ( \read_control|addr_mem\(1) & ( \read_control|addr_mem\(3) 
-- ) ) ) # ( \read_control|addr_mem\(2) & ( !\read_control|addr_mem\(1) & ( \read_control|addr_mem\(3) ) ) ) # ( !\read_control|addr_mem\(2) & ( !\read_control|addr_mem\(1) & ( \read_control|addr_mem\(3) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011110000111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \read_control|ALT_INV_addr_mem\(3),
	datac => \read_control|ALT_INV_addr_mem\(0),
	datae => \read_control|ALT_INV_addr_mem\(2),
	dataf => \read_control|ALT_INV_addr_mem\(1),
	combout => \read_control|Add0~2_combout\);

-- Location: MLABCELL_X8_Y1_N45
\read_control|addr_mem[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \read_control|addr_mem[4]~feeder_combout\ = ( \read_control|Add0~3_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \read_control|ALT_INV_Add0~3_combout\,
	combout => \read_control|addr_mem[4]~feeder_combout\);

-- Location: FF_X8_Y1_N47
\read_control|addr_mem[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \rclk~inputCLKENA0_outclk\,
	d => \read_control|addr_mem[4]~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \read_enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \read_control|addr_mem\(4));

-- Location: MLABCELL_X8_Y1_N6
\read_control|Add0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \read_control|Add0~3_combout\ = ( \read_control|addr_mem\(4) & ( \read_control|addr_mem\(0) & ( (!\read_control|addr_mem\(3)) # ((!\read_control|addr_mem\(2)) # (!\read_control|addr_mem\(1))) ) ) ) # ( !\read_control|addr_mem\(4) & ( 
-- \read_control|addr_mem\(0) & ( (\read_control|addr_mem\(3) & (\read_control|addr_mem\(2) & \read_control|addr_mem\(1))) ) ) ) # ( \read_control|addr_mem\(4) & ( !\read_control|addr_mem\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000111111111111111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \read_control|ALT_INV_addr_mem\(3),
	datac => \read_control|ALT_INV_addr_mem\(2),
	datad => \read_control|ALT_INV_addr_mem\(1),
	datae => \read_control|ALT_INV_addr_mem\(4),
	dataf => \read_control|ALT_INV_addr_mem\(0),
	combout => \read_control|Add0~3_combout\);

-- Location: IOIBUF_X88_Y81_N36
\write_data_in[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_write_data_in(0),
	o => \write_data_in[0]~input_o\);

-- Location: IOIBUF_X74_Y81_N58
\write_data_in[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_write_data_in(1),
	o => \write_data_in[1]~input_o\);

-- Location: IOIBUF_X4_Y0_N18
\write_data_in[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_write_data_in(2),
	o => \write_data_in[2]~input_o\);

-- Location: IOIBUF_X36_Y81_N1
\write_data_in[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_write_data_in(3),
	o => \write_data_in[3]~input_o\);

-- Location: IOIBUF_X40_Y81_N1
\write_data_in[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_write_data_in(4),
	o => \write_data_in[4]~input_o\);

-- Location: IOIBUF_X64_Y0_N1
\write_data_in[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_write_data_in(5),
	o => \write_data_in[5]~input_o\);

-- Location: IOIBUF_X30_Y81_N35
\write_data_in[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_write_data_in(6),
	o => \write_data_in[6]~input_o\);

-- Location: IOIBUF_X62_Y81_N35
\write_data_in[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_write_data_in(7),
	o => \write_data_in[7]~input_o\);

-- Location: LABCELL_X19_Y45_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


