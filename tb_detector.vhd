library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;

entity tb_detector is
	constant k : positive := 3;
	constant m : positive := 7;
end tb_detector;

architecture rtb of tb_detector is
	SIGNAL count : STD_LOGIC_VECTOR (k DOWNTO 0);
	SIGNAL detect : STD_LOGIC;
begin
	L0 : detector generic map (k,m) port map(count, detect);
    
	--------- start of stimulus section ------------------	
        count1 : process
        begin
		  count <= (others => '0');
		  for i in 0 to 30 loop
		    wait for 50 ns;
			count <= count+1;
		  end loop;
		  wait for 50 ns;
		  count <= (others => '0');
		  wait;
        end process count1;
  
end architecture rtb;