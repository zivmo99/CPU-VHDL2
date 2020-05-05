Compile order:

0 - tb_CC.vhd	
// Test bench for the condition check.

1 - tb_counter.vhd		
// Test bench for the counter

2 - tb_detector.vhd		
// Test bench for the detector

3 - tb_SD.vhd
// Test bench for the synchronous delay. 

4 - tb_top.vhd		
// Test bench for top

5 - Adder.vhd		
// Adder sub module. 2 in vectors of length 8. 1 in bit cin. s- output vector length 8, cout - 1 bit carry.

6 - aux_package.vhd		
// The packge of this project

7 - counter.vhd		
// Counts the number of rise signal. in port 1 bit - rise. output 4 bit count vector.

8 - detector.vhd		
// Detects if the counter>=8. 4 bit vector in port: counter. 1 bit output port detect.

9 - top.vhd		
// The primary module of the project. 3 in bit ports: rst,ena,clk. din in vector port length 8.
// cond - in port in length 4. detector - output bit port.

10 - CondCheck.vhd		
// The condition check module. Input ports: din[i] - vector length 8 - new value, din[i-1] - vector length 8 - old value.
// Output port - rise, 1 bit.

11 - SynchronousDelay.vhd		
// the delay module. in ports: din - vector of length 8, clk, rst, ena: ports of 1 bit length.
// Output ports: din[i] - vector length 8 - new value, din[i-1] - vector length 8 - old value.