transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/abiga/Desktop/ArquiII/ComputerArchitecture2_VectorCPU/Microarchitecture/microarquitectura/Execute/ALU {C:/Users/abiga/Desktop/ArquiII/ComputerArchitecture2_VectorCPU/Microarchitecture/microarquitectura/Execute/ALU/multiplicador.sv}
vlog -sv -work work +incdir+C:/Users/abiga/Desktop/ArquiII/ComputerArchitecture2_VectorCPU/Microarchitecture/microarquitectura/Execute/ALU {C:/Users/abiga/Desktop/ArquiII/ComputerArchitecture2_VectorCPU/Microarchitecture/microarquitectura/Execute/ALU/FullAdder.sv}
vlog -sv -work work +incdir+C:/Users/abiga/Desktop/ArquiII/ComputerArchitecture2_VectorCPU/Microarchitecture/microarquitectura/Execute/ALU {C:/Users/abiga/Desktop/ArquiII/ComputerArchitecture2_VectorCPU/Microarchitecture/microarquitectura/Execute/ALU/divisor.sv}
vlog -sv -work work +incdir+C:/Users/abiga/Desktop/ArquiII/ComputerArchitecture2_VectorCPU/Microarchitecture/microarquitectura/Execute/ALU {C:/Users/abiga/Desktop/ArquiII/ComputerArchitecture2_VectorCPU/Microarchitecture/microarquitectura/Execute/ALU/Complement.sv}
vlog -sv -work work +incdir+C:/Users/abiga/Desktop/ArquiII/ComputerArchitecture2_VectorCPU/Microarchitecture/microarquitectura/Execute/ALU {C:/Users/abiga/Desktop/ArquiII/ComputerArchitecture2_VectorCPU/Microarchitecture/microarquitectura/Execute/ALU/ALU.sv}
vlog -sv -work work +incdir+C:/Users/abiga/Desktop/ArquiII/ComputerArchitecture2_VectorCPU/Microarchitecture/microarquitectura/Execute/ALU {C:/Users/abiga/Desktop/ArquiII/ComputerArchitecture2_VectorCPU/Microarchitecture/microarquitectura/Execute/ALU/Adder_Substractor.sv}

vlog -sv -work work +incdir+C:/Users/abiga/Desktop/ArquiII/ComputerArchitecture2_VectorCPU/Microarchitecture/microarquitectura/Tests {C:/Users/abiga/Desktop/ArquiII/ComputerArchitecture2_VectorCPU/Microarchitecture/microarquitectura/Tests/testALU.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver -L rtl_work -L work -voptargs="+acc"  testALU

add wave *
view structure
view signals
run -all
