vlib work
vlog *.*v
vsim -voptargs=+accs work.SYS_TB
do wave.do
run -all