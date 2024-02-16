transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/xor_4bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/xor_32bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/xor_1bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/sub.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/or_4bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/or_32bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/not_32bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/nor_4bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/nor_32bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/less_than.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/and_4bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/and_32bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/adder_4bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/adder_16bits.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/mips.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/alu_control.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/control_unit.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/sign_extend.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/shift_left_2.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/mux2x1_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/mux2x1_5bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/mux8to1.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/instruction_block.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/register_block.v}
vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/memory_block.v}

vlog -vlog01compat -work work +incdir+C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits {C:/Users/aydin/OneDrive/Desktop/MIPS_processor_32bits/my_testbench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  my_testbench

add wave *
view structure
view signals
run -all
