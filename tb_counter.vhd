library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;

entity tb_counter is
	constant k : positive := 3;
	constant m : positive := 7;
end tb_counter;

architecture rtb of tb_counter is
	SIGNAL rst, ena, clk, rise : STD_LOGIC;
	SIGNAL count : STD_LOGIC_VECTOR (k DOWNTO 0);
begin
	L0 : counter generic map (k,m) port map(rst, ena, clk, rise, count);
    
	--------- start of stimulus section ------------------	
        clk1 : process
        begin
		  for i in 0 to 50 loop
			clk <= '0';
			wait for 50 ns;
			clk <= '1';
			wait for 50 ns;
		  end loop;
		  wait;
        end process clk1;
		  
		en1 : process
        begin
		  ena <='0','1' after 200 ns, '0' after 2100 ns, '1' after 2200 ns;
		  wait;
        end process en1; 
		
		rst1 : process
        begin
		  rst <='1','0' after 50 ns, '1' after 1100 ns, '0' after 1200 ns;
		  wait;
        end process rst1;
		
		rise1 : process
        begin
			for i in 0 to 1 loop
				for i in 0 to 15 loop
					rise <= '1';
					wait for 50 ns;
				end loop;
			    rise <='0';
				for i in 0 to 15 loop
					rise <= '1';
					wait for 50 ns;
				end loop;
			end loop; 
        end process rise1;
  
end architecture rtb;
