
####################################################################################
# Constraints
# ----------------------------------------------------------------------------
#
# 0. Design Compiler variables
#
# 1. Master Clock Definitions
#
# 2. Generated Clock Definitions
#
# 3. Clock Uncertainties
#
# 4. Clock Latencies 
#
# 5. Clock Relationships
#
# 6. #set input/output delay on ports
#
# 7. Driving cells
#
# 8. Output load

####################################################################################
           #########################################################
                  #### Section 0 : DC Variables ####
           #########################################################
#################################################################################### 

# Prevent assign statements in the generated netlist (must be applied before compile command)
set_fix_multiple_port_nets -all -buffer_constants -feedthroughs

####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions
####################################################################################

set CLK1_NAME REF_CLK
set CLK1_PER 20
set CLK2_NAME UART_CLK
set CLK2_PER 271.267
set CLK3_NAME SCAN_CLK
set CLK3_PER 20
set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW 0.1
set CLK_RISE 0.05
set CLK_FALL 0.05


create_clock -name $CLK1_NAME -period $CLK1_PER -waveform "0 [expr $CLK1_PER/2]" [get_ports REF_CLK]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $CLK1_NAME]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks $CLK1_NAME]
set_clock_transition -rise $CLK_RISE  [get_clocks $CLK1_NAME]
set_clock_transition -fall $CLK_FALL  [get_clocks $CLK1_NAME]

create_clock -name $CLK2_NAME -period $CLK2_PER -waveform "0 [expr $CLK2_PER/2]" [get_ports UART_CLK]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $CLK2_NAME]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks $CLK2_NAME]
set_clock_transition -rise $CLK_RISE  [get_clocks $CLK2_NAME]
set_clock_transition -fall $CLK_FALL  [get_clocks $CLK2_NAME]

create_generated_clock -master_clock $CLK2_NAME -source [get_ports UART_CLK] -name "RX_CLK" [get_port CLK_DIV_RX_INST/o_div_clk] -divide_by 1
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks "RX_CLK"]
set_clock_uncertainty -hold $CLK_HOLD_SKEW   [get_clocks "RX_CLK"]
set_clock_transition -rise $CLK_RISE  [get_clocks "RX_CLK"]
set_clock_transition -fall $CLK_FALL  [get_clocks "RX_CLK"]

create_generated_clock -master_clock $CLK2_NAME -source [get_ports UART_CLK] -name "TX_CLK" [get_port CLK_DIV_TX_INST/o_div_clk] -divide_by 32
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks "TX_CLK"]
set_clock_uncertainty -hold $CLK_HOLD_SKEW   [get_clocks "TX_CLK"]
set_clock_transition -rise $CLK_RISE  [get_clocks "TX_CLK"]
set_clock_transition -fall $CLK_FALL  [get_clocks "TX_CLK"]

create_generated_clock -master_clock $CLK1_NAME -source [get_ports REF_CLK] -name "ALU_CLK" [get_port CLK_GATE_INST/GATED_CLK] -divide_by 1
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks "ALU_CLK"]
set_clock_uncertainty -hold $CLK_HOLD_SKEW   [get_clocks "ALU_CLK"]
set_clock_transition -rise $CLK_RISE  [get_clocks ALU_CLK]
set_clock_transition -fall $CLK_FALL  [get_clocks ALU_CLK]

create_clock -name $CLK3_NAME -period $CLK3_PER -waveform "0 [expr $CLK3_PER/2]" [get_ports scan_clk]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $CLK3_NAME]
set_clock_uncertainty -hold $CLK_HOLD_SKEW   [get_clocks $CLK3_NAME]
set_clock_transition -rise $CLK_RISE  [get_clocks  $CLK3_NAME]
set_clock_transition -fall $CLK_FALL  [get_clocks  $CLK3_NAME]

set_dont_touch_network [get_clocks {REF_CLK UART_CLK ALU_CLK TX_CLK RX_CLK SCAN_CLK}]


####################################################################################
           #########################################################
             #### Section 2 : Clocks Relationship ####
           #########################################################
####################################################################################

set_clock_groups -asynchronous -group [get_clocks "REF_CLK ALU_CLK"] -group [get_clocks "UART_CLK TX_CLK RX_CLK"] -group [get_clocks "SCAN_CLK"]

####################################################################################
           #########################################################
             #### Section 3 : #set input/output delay on ports ####
           #########################################################
####################################################################################

set in_delay  [expr 0.2*$CLK2_PER]
set out_delay [expr 0.2*$CLK2_PER]
set in2_delay  [expr 0.2*$CLK3_PER]
set out2_delay [expr 0.2*$CLK3_PER]

set_input_delay $in_delay -clock $CLK2_NAME [get_port UART_RX_IN]
set_input_delay $in2_delay -clock $CLK3_NAME [get_port test_mode]
set_input_delay $in2_delay -clock $CLK3_NAME [get_port SI]
set_input_delay $in2_delay -clock $CLK3_NAME [get_port SE]

set_output_delay $out_delay -clock TX_CLK [get_port UART_TX_O]
set_output_delay $out_delay -clock $CLK2_NAME [get_port parity_error]
set_output_delay $out_delay -clock $CLK2_NAME [get_port framing_error]
set_output_delay $out2_delay -clock $CLK3_NAME [get_port SO]

####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################

set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port UART_RX_IN]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port test_mode]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port SI]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port SE]

####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################

set_load 0.5 [get_port UART_TX_O]
set_load 0.5 [get_port parity_error]
set_load 0.5 [get_port framing_error]
set_load 0.5 [get_port SO]

####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis

set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
           #########################################################
                  #### Section 7 : wireload Model ####
           #########################################################
####################################################################################


####################################################################################
           #########################################################
                  #### Section 8 : set_case_analysis ####
           #########################################################
####################################################################################

set_case_analysis 1 [get_port test_mode]

####################################################################################

