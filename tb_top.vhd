library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;

entity tb_top is
	constant k : positive := 3;
	constant m : positive := 7;
	constant n : positive := 8 ;

end tb_top;

architecture rtb of tb_top is
	SIGNAL rst, ena, clk, detector : STD_LOGIC;
	SIGNAL din : std_logic_vector(n-1 downto 0);
	SIGNAL cond : integer range 0 to 3;
begin
	L0 : top generic map (k,m,n) port map(rst, ena, clk, din, cond, detector);
    
	--------- start of stimulus section ------------------	
        clk1 : process
        begin
		  for i in 0 to 100 loop
			clk <= '0';
			wait for 50 ns;
			clk <= '1';
			wait for 50 ns;
		  end loop;
		  wait;
        end process clk1;
		  
		en1 : process
        begin
		  ena <='0','1' after 200 ns;--, '0' after 2100 ns, '1' after 2200 ns;
		  wait;
        end process en1; 
		
		rst1 : process
        begin
		  rst <='1','0' after 100 ns; --, '1' after 1100 ns, '0' after 1200 ns;
		  wait;
        end process rst1;
		
		condition : process
        begin
			cond <= 0;
			--wait for 200 ns;
			--for i in 0 to 2 loop
				cond <= 0;
				wait for 1200 ns;
				cond <= 1;
				wait for 2400 ns;
				cond <= 2;
				wait for 3600 ns;
				cond <= 3;
				wait for 4800 ns;
			--end loop;
			 wait;
        end process condition;
		
		din1 : process
		VARIABLE temp : INTEGER;
        begin	
			temp := 0;
			for i in 0 to 3 loop
				din <= (others => '0');
				wait for 100 ns;
				for i in 0 to 10 loop
					din <= din+temp;
					wait for 100 ns;	
				end loop;
				temp := temp+1;
			end loop;
			wait;
        end process din1;
  
end architecture rtb;
