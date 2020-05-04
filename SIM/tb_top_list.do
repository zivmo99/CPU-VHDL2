onerror {resume}
add list -width 13 /tb_top/rst
add list /tb_top/ena
add list /tb_top/din
add list /tb_top/detector
add list /tb_top/cond
add list /tb_top/clk
configure list -usestrobe 0
configure list -strobestart {0 ps} -strobeperiod {0 ps}
configure list -usesignaltrigger 1
configure list -delta collapse
configure list -signalnamewidth 0
configure list -datasetprefix 0
configure list -namelimit 5
