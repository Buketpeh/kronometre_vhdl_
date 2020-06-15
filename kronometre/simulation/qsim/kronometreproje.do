onerror {quit -f}
vlib work
vlog -work work kronometreproje.vo
vlog -work work kronometreproje.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.kronometreproje_vlg_vec_tst
vcd file -direction kronometreproje.msim.vcd
vcd add -internal kronometreproje_vlg_vec_tst/*
vcd add -internal kronometreproje_vlg_vec_tst/i1/*
add wave /*
run -all
