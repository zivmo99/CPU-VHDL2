onerror {resume}
add list -width 12 /tb_sd/rst
add list /tb_sd/ena
add list /tb_sd/din_old
add list /tb_sd/din_new
add list /tb_sd/din
add list /tb_sd/clk
configure list -usestrobe 0
configure list -strobestart {0 ps} -strobeperiod {0 ps}
configure list -usesignaltrigger 1
configure list -delta collapse
configure list -signalnamewidth 0
configure list -datasetprefix 0
configure list -namelimit 5
