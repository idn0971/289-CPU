transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -2008 -work work {C:/Users/idn09/Documents/ECE 289/289 CPU/src/seven_segments.vhd}
vcom -2008 -work work {C:/Users/idn09/Documents/ECE 289/289 CPU/src/binary_to_bcd_digit.vhd}
vcom -2008 -work work {C:/Users/idn09/Documents/ECE 289/289 CPU/src/binary_to_bcd.vhd}
vcom -2008 -work work {C:/Users/idn09/Documents/ECE 289/289 CPU/src/bcd_to_7seg_display.vhd}
vcom -2008 -work work {C:/Users/idn09/Documents/ECE 289/289 CPU/src/alu.vhd}
vcom -2008 -work work {C:/Users/idn09/Documents/ECE 289/289 CPU/src/controlFSM.vhd}
vcom -2008 -work work {C:/Users/idn09/Documents/ECE 289/289 CPU/src/memory.vhd}
vcom -2008 -work work {C:/Users/idn09/Documents/ECE 289/289 CPU/src/reg32by32.vhd}
vcom -2008 -work work {C:/Users/idn09/Documents/ECE 289/289 CPU/src/pc_Unit.vhd}
vcom -2008 -work work {C:/Users/idn09/Documents/ECE 289/289 CPU/src/CPU289.vhd}
vcom -2008 -work work {C:/Users/idn09/Documents/ECE 289/289 CPU/src/instDecode.vhd}
vcom -2008 -work work {C:/Users/idn09/Documents/ECE 289/289 CPU/src/controlUnit.vhd}
vcom -2008 -work work {C:/Users/idn09/Documents/ECE 289/289 CPU/src/aluDecode.vhd}
vcom -2008 -work work {C:/Users/idn09/Documents/ECE 289/289 CPU/src/instructionMemory.vhd}

