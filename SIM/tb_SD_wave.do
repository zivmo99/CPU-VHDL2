onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_sd/rst
add wave -noupdate /tb_sd/ena
add wave -noupdate -radix unsigned /tb_sd/din_old
add wave -noupdate -radix unsigned /tb_sd/din_new
add wave -noupdate -radix unsigned /tb_sd/din
add wave -noupdate /tb_sd/clk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8050000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 122
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
WaveRestoreZoom {0 ps} {6011698 ps}
