onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_counter/rst
add wave -noupdate /tb_counter/rise
add wave -noupdate /tb_counter/ena
add wave -noupdate /tb_counter/clk
add wave -noupdate -radix unsigned /tb_counter/count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3544676 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 136
configure wave -valuecolwidth 39
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {4194374 ps}
