transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/idn09/Documents/ECE 289/CPU Cyclone II/sevenSegDecode.vhd}
vcom -93 -work work {C:/Users/idn09/Documents/ECE 289/CPU Cyclone II/memory.vhd}
vcom -93 -work work {C:/Users/idn09/Documents/ECE 289/CPU Cyclone II/instructionMemory.vhd}
vcom -93 -work work {C:/Users/idn09/Documents/ECE 289/CPU Cyclone II/reg32by32.vhd}
vcom -93 -work work {C:/Users/idn09/Documents/ECE 289/CPU Cyclone II/pc_Unit.vhd}
vcom -93 -work work {C:/Users/idn09/Documents/ECE 289/CPU Cyclone II/instDecode.vhd}
vcom -93 -work work {C:/Users/idn09/Documents/ECE 289/CPU Cyclone II/CPU289.vhd}
vcom -93 -work work {C:/Users/idn09/Documents/ECE 289/CPU Cyclone II/controlUnit.vhd}
vcom -93 -work work {C:/Users/idn09/Documents/ECE 289/CPU Cyclone II/controlFSM.vhd}
vcom -93 -work work {C:/Users/idn09/Documents/ECE 289/CPU Cyclone II/aluDecode.vhd}
vcom -93 -work work {C:/Users/idn09/Documents/ECE 289/CPU Cyclone II/alu.vhd}

