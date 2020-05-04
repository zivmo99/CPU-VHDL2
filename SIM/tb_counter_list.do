onerror {resume}
add list -width 17 /tb_counter/rst
add list /tb_counter/rise
add list /tb_counter/ena
add list /tb_counter/count
add list /tb_counter/clk
configure list -usestrobe 0
configure list -strobestart {0 ps} -strobeperiod {0 ps}
configure list -usesignaltrigger 1
configure list -delta collapse
configure list -signalnamewidth 0
configure list -datasetprefix 0
configure list -namelimit 5
