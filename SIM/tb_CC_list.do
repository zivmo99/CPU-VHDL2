onerror {resume}
add list -width 13 /tb_cc/rise
add list /tb_cc/din_old
add list /tb_cc/din_new
add list /tb_cc/cond
configure list -usestrobe 0
configure list -strobestart {0 ps} -strobeperiod {0 ps}
configure list -usesignaltrigger 1
configure list -delta collapse
configure list -signalnamewidth 0
configure list -datasetprefix 0
configure list -namelimit 5
