onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /SYS_TB/REF_CLK
add wave -noupdate /SYS_TB/UART_CLK
add wave -noupdate /SYS_TB/DUT/UART_INST/RST
add wave -noupdate /SYS_TB/DUT/UART_INST/TX_CLK
add wave -noupdate /SYS_TB/DUT/UART_INST/RX_CLK
add wave -noupdate /SYS_TB/DUT/UART_INST/RX_IN_S
add wave -noupdate -radix hexadecimal /SYS_TB/DUT/UART_INST/RX_OUT_P
add wave -noupdate /SYS_TB/DUT/UART_INST/RX_OUT_V
add wave -noupdate -group SYS_CTRL /SYS_TB/DUT/UART_INST/U0_UART_RX/U0_uart_fsm/next_state
add wave -noupdate -group SYS_CTRL /SYS_TB/DUT/SYS_CTRL_INST/state
add wave -noupdate -group SYS_CTRL /SYS_TB/DUT/SYS_CTRL_INST/next_state
add wave -noupdate -group SYS_CTRL /SYS_TB/DUT/SYS_CTRL_INST/Address_s
add wave -noupdate -group SYS_CTRL /SYS_TB/DUT/SYS_CTRL_INST/Address
add wave -noupdate -group SYS_CTRL /SYS_TB/DUT/SYS_CTRL_INST/RdData_Valid
add wave -noupdate -group SYS_CTRL /SYS_TB/DUT/SYS_CTRL_INST/CLK_EN
add wave -noupdate -group SYS_CTRL -radix unsigned /SYS_TB/DUT/SYS_CTRL_INST/operand_A
add wave -noupdate -group SYS_CTRL -radix unsigned /SYS_TB/DUT/SYS_CTRL_INST/operand_B
add wave -noupdate -group SYS_CTRL -radix unsigned /SYS_TB/DUT/SYS_CTRL_INST/ALU_OUT
add wave -noupdate -group SYS_CTRL /SYS_TB/DUT/SYS_CTRL_INST/ALU_FUN
add wave -noupdate -group SYS_CTRL /SYS_TB/DUT/SYS_CTRL_INST/ALU_EN
add wave -noupdate -group SYS_CTRL /SYS_TB/DUT/SYS_CTRL_INST/OUT_Valid
add wave -noupdate -group SYS_CTRL /SYS_TB/DUT/SYS_CTRL_INST/operand_A
add wave -noupdate -group SYS_CTRL /SYS_TB/DUT/SYS_CTRL_INST/operand_B
add wave -noupdate -radix hexadecimal /SYS_TB/DUT/SYS_CTRL_INST/WR_DATA
add wave -noupdate /SYS_TB/DUT/SYS_CTRL_INST/WR_INC
add wave -noupdate /SYS_TB/DUT/SYS_CTRL_INST/FIFO_FULL
add wave -noupdate -group RegFile /SYS_TB/DUT/REG_FILE_INST/WrEn
add wave -noupdate -group RegFile -radix hexadecimal /SYS_TB/DUT/REG_FILE_INST/WrData
add wave -noupdate -group RegFile /SYS_TB/DUT/REG_FILE_INST/RdEn
add wave -noupdate -group RegFile /SYS_TB/DUT/REG_FILE_INST/RdData_VLD
add wave -noupdate -group RegFile -radix hexadecimal /SYS_TB/DUT/REG_FILE_INST/RdData
add wave -noupdate -group RegFile /SYS_TB/DUT/REG_FILE_INST/REG3
add wave -noupdate -group RegFile /SYS_TB/DUT/REG_FILE_INST/REG2
add wave -noupdate -group RegFile -radix unsigned /SYS_TB/DUT/REG_FILE_INST/REG1
add wave -noupdate -group RegFile -radix unsigned /SYS_TB/DUT/REG_FILE_INST/REG0
add wave -noupdate -group RegFile /SYS_TB/DUT/REG_FILE_INST/Address
add wave -noupdate -group ALU -radix unsigned /SYS_TB/DUT/ALU_INST/A
add wave -noupdate -group ALU -radix unsigned /SYS_TB/DUT/ALU_INST/B
add wave -noupdate -group ALU /SYS_TB/DUT/ALU_INST/ALU_FUN
add wave -noupdate -group ALU /SYS_TB/DUT/ALU_INST/EN
add wave -noupdate -group ALU -radix unsigned /SYS_TB/DUT/ALU_INST/ALU_OUT
add wave -noupdate -group ALU -radix unsigned /SYS_TB/DUT/ALU_INST/ALU_OUT_Comb
add wave -noupdate -group ALU /SYS_TB/DUT/ALU_INST/ALU_CLK
add wave -noupdate -radix hexadecimal /SYS_TB/DUT/UART_INST/TX_IN_P
add wave -noupdate /SYS_TB/DUT/UART_INST/TX_IN_V
add wave -noupdate /SYS_TB/UART_TX_O
add wave -noupdate /SYS_TB/DUT/CLK_GATE_INST/GATED_CLK
add wave -noupdate -group FIFO /SYS_TB/DUT/FIFO_INST/wdata
add wave -noupdate -group FIFO /SYS_TB/DUT/FIFO_INST/waddr
add wave -noupdate -group FIFO /SYS_TB/DUT/FIFO_INST/wptr_gray
add wave -noupdate -group FIFO /SYS_TB/DUT/FIFO_INST/winc
add wave -noupdate -group FIFO /SYS_TB/DUT/FIFO_INST/wfull
add wave -noupdate -group FIFO -radix hexadecimal /SYS_TB/DUT/FIFO_INST/rdata
add wave -noupdate -group FIFO /SYS_TB/DUT/FIFO_INST/raddr
add wave -noupdate -group FIFO /SYS_TB/DUT/FIFO_INST/rptr_gray
add wave -noupdate -group FIFO /SYS_TB/DUT/FIFO_INST/rinc
add wave -noupdate -group FIFO /SYS_TB/DUT/FIFO_INST/empty
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2484935 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1674463 ps} {2828793 ps}
