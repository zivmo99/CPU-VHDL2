LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
--USE work.aux_package.all;
-------------------------------------------------------------

entity tb_SD is
	constant n : integer := 8;
end tb_SD;

architecture tb_SD of tb_SD is
component SyncronousDelay is
  GENERIC (n : positive := 8 );
  PORT (rst, clk, ena: IN STD_LOGIC;
        din: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
        din_new: BUFFER STD_LOGIC_VECTOR (n-1 DOWNTO 0);
        din_old: OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0)
      );
end component;
---------------------------------------
SIGNAL rst : STD_LOGIC ;
SIGNAL clk : STD_LOGIC ;
SIGNAL ena : STD_LOGIC ;
SIGNAL din :  STD_LOGIC_VECTOR (n-1 DOWNTO 0);
SIGNAL din_new :  STD_LOGIC_VECTOR (n-1 DOWNTO 0);
SIGNAL din_old :  STD_LOGIC_VECTOR (n-1 DOWNTO 0);

begin
	L0 : SyncronousDelay generic map (n) port map
	(rst=>rst,clk=>clk,ena=>ena,din=>din,din_new=>din_new,din_old=>din_old);
    
	--------- start of stimulus section ------------------	
  
	
--	rst1 : process
--  begin
	 rst <='1','0' after 100 ns,
		  		 '1' after 4800 ns, '0' after 4900 ns;
--  wait;
--  end process rst1;
	
	
--	en1 : process
--  begin
  	ena <='0','1' after 200 ns,
	       '0' after 1800 ns, '1' after 2000 ns;			
--  wait;
--  end process en1; 			
	
				
	clk1 : process
  begin
		  for i in 0 to 200 loop
		    	clk <= '0';
			   wait for 50 ns;
      			clk <= '1';
      			wait for 50 ns;
   		  end loop;
	wait;
  end process clk1;
	
	       
	din1 : process
	VARIABLE temp : INTEGER;
  begin
		for i in 0 to 1 loop
			temp := 1;
			for i in 0 to 3 loop
				din <= (others => '0');
				wait for 100 ns;
					for i in 0 to 10 loop
						din <= din+temp;
						wait for 100 ns;	
					end loop;
				temp := temp+1;
			end loop;
		end loop;	
	wait;
 end process din1;




end architecture tb_SD;
