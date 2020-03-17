# Copyright (C) 2016  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License 
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel MegaCore Function License Agreement, or other 
# applicable license agreement, including, without limitation, 
# that your use is for the sole purpose of programming logic 
# devices manufactured by Intel and sold by Intel or its 
# authorized distributors.  Please refer to the applicable 
# agreement for further details.

# Quartus Prime: Generate Tcl File for Project
# File: CPU289.tcl
# Generated on: Fri Mar 13 12:57:59 2020

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "CPU289"]} {
		puts "Project CPU289 is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists CPU289]} {
		project_open -revision CPU289 CPU289
	} else {
		project_new -revision CPU289 CPU289
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone IV E"
	set_global_assignment -name DEVICE EP4CE115F29C7
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 16.1.0
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "09:41:43  FEBRUARY 28, 2020"
	set_global_assignment -name LAST_QUARTUS_VERSION "16.1.0 Lite Edition"
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_global_assignment -name PROJECT_IP_REGENERATION_POLICY ALWAYS_REGENERATE_IP
	set_global_assignment -name VHDL_INPUT_VERSION VHDL_2008
	set_global_assignment -name VHDL_SHOW_LMF_MAPPING_MESSAGES OFF
	set_global_assignment -name VHDL_FILE seven_segments.vhd
	set_global_assignment -name VHDL_FILE binary_to_bcd_digit.vhd
	set_global_assignment -name VHDL_FILE binary_to_bcd.vhd
	set_global_assignment -name VHDL_FILE bcd_to_7seg_display.vhd
	set_global_assignment -name SOURCE_FILE memory.cmp
	set_global_assignment -name SOURCE_FILE instructionMemory.cmp
	set_global_assignment -name VHDL_FILE alu.vhd
	set_global_assignment -name VHDL_FILE controlFSM.vhd
	set_global_assignment -name QIP_FILE memory.qip
	set_global_assignment -name VHDL_FILE reg32by32.vhd
	set_global_assignment -name VHDL_FILE pc_Unit.vhd
	set_global_assignment -name VHDL_FILE CPU289.vhd
	set_global_assignment -name VHDL_FILE instDecode.vhd
	set_global_assignment -name VHDL_FILE controlUnit.vhd
	set_global_assignment -name VHDL_FILE aluDecode.vhd
	set_global_assignment -name MIF_FILE cpuInstructions.mif
	set_global_assignment -name TIMEQUEST_MULTICORNER_ANALYSIS ON
	set_global_assignment -name SMART_RECOMPILE ON
	set_global_assignment -name MIF_FILE factorial.mif
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name QIP_FILE instructionMemory.qip
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Including default assignments
	set_global_assignment -name TIMEQUEST_REPORT_WORST_CASE_TIMING_PATHS ON -family "Cyclone IV E"
	set_global_assignment -name TIMEQUEST_CCPP_TRADEOFF_TOLERANCE 0 -family "Cyclone IV E"
	set_global_assignment -name TDC_CCPP_TRADEOFF_TOLERANCE 0 -family "Cyclone IV E"
	set_global_assignment -name TIMEQUEST_DO_CCPP_REMOVAL ON -family "Cyclone IV E"
	set_global_assignment -name TIMEQUEST_SPECTRA_Q OFF -family "Cyclone IV E"
	set_global_assignment -name SYNTH_TIMING_DRIVEN_SYNTHESIS ON -family "Cyclone IV E"
	set_global_assignment -name SYNCHRONIZATION_REGISTER_CHAIN_LENGTH 2 -family "Cyclone IV E"
	set_global_assignment -name SYNTH_RESOURCE_AWARE_INFERENCE_FOR_BLOCK_RAM ON -family "Cyclone IV E"
	set_global_assignment -name OPTIMIZE_HOLD_TIMING "ALL PATHS" -family "Cyclone IV E"
	set_global_assignment -name OPTIMIZE_MULTI_CORNER_TIMING ON -family "Cyclone IV E"
	set_global_assignment -name AUTO_DELAY_CHAINS ON -family "Cyclone IV E"
	set_global_assignment -name CRC_ERROR_OPEN_DRAIN OFF -family "Cyclone IV E"
	set_global_assignment -name USE_CONFIGURATION_DEVICE OFF -family "Cyclone IV E"
	set_global_assignment -name ENABLE_OCT_DONE OFF -family "Cyclone IV E"

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
