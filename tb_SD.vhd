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

 -- 
--test1 : process
--	begin
--	rst<= '1' , '0' after 100 ns;
--	ena<='0' , '1' after 200 ns , '0' after 1800 ns, '1' after 2000 ns;
--	clk <= '0','1' after 50 ns,'0' after 100 ns,'1' after 150 ns,'0' after 200 ns,'1' after 250 ns
--	       ,'0' after 300 ns,'1' after 350 ns,'0' after 400 ns,'1' after 450 ns,'0' after 500 ns,
--	       '1' after 550 ns, '0' after 600 ns,'1' after 650 ns,'0' after 700 ns,'1' after 750 ns,
--	       '0' after 800 ns, '1' after 850 ns, '0' after 900 ns,'1' after 950 ns,'0' after 1000 ns,
--	       '1' after 1050 ns ,'0' after 1100 ns,'1' after 1150 ns,'0' after 1200 ns,'1' after 1250 ns
--	       ,'0' after 1300 ns,'1' after 1350 ns,'0' after 1400 ns,'1' after 1450 ns,'0' after 1500 ns,
--	       '1' after 1550 ns, '0' after 1600 ns,'1' after 1650 ns,'0' after 1700 ns,'1' after 1750 ns,
--	       '0' after 1800 ns, '1' after 1850 ns, '0' after 1900 ns,'1' after 1950 ns,'0' after 2000 ns,
--	       '1' after 2050 ns,'0' after 2100 ns,'1' after 2150 ns,'0' after 2200 ns,'1' after 2250 ns
--	       ,'0' after 2300 ns,'1' after 2350 ns,'0' after 2400 ns,'1' after 2450 ns,'0' after 2500 ns,
--	       '1' after 2550 ns, '0' after 2600 ns,'1' after 2650 ns,'0' after 2700 ns,'1' after 2750 ns,
--	       '0' after 2800 ns, '1' after 2850 ns, '0' after 2900 ns,'1' after 2950 ns,'0' after 3000 ns,
--	       '1' after 3050 ns,'0' after 3100 ns,'1' after 3150 ns,'0' after 3200 ns,'1' after 3250 ns
--	       ,'0' after 3300 ns,'1' after 3350 ns,'0' after 3400 ns,'1' after 3450 ns,'0' after 3500 ns,
--	       '1' after 3550 ns, '0' after 3600 ns,'1' after 3650 ns,'0' after 3700 ns,'1' after 3750 ns,
--	       '0' after 3800 ns, '1' after 3850 ns, '0' after 3900 ns,'1' after 3950 ns,'0' after 4000 ns,
--	       '1' after 4050 ns ,'0' after 4100 ns,'1' after 4150 ns,'0' after 4200 ns,'1' after 4250 ns
--	       ,'0' after 4300 ns,'1' after 4350 ns,'0' after 4400 ns,'1' after 4450 ns,'0' after 4500 ns,
--	       '1' after 4550 ns, '0' after 4600 ns;
--	 
--	din <= "00000000", "00000001" after 100 ns, "00000010" after 200 ns, "00000011" after 300 ns, 
--  "00000100" after 400 ns, "00000101" after 500 ns, "00000110" after 600 ns, "00000111" after 700 ns,
--  "00001000" after 800 ns, "00001001" after 900 ns, "00001010" after 1000 ns , "00001011" after 1100 ns,
--  "00000000" after 1200 ns, "00000010" after 1300 ns, "00000100" after 1400 ns, "00000110" after 1500 ns,
--  "00001000" after 1600 ns, "00001010" after 1700 ns, "00001110" after 1800 ns, "00010000" after 1900 ns, "00010010" after 2000 ns,
--  "00010100" after 2100 ns, "00010110" after 2200 ns, "00000000" after 2300 ns, 
--  "00000011" after 2400 ns, "00000110" after 2500 ns, "00001001" after 2600 ns, "00001100" after 2700 ns,
--  "00001111" after 2800 ns, "00010010" after 2900 ns, "00010101" after 3000 ns , "00011000" after 3100 ns,
--  "00011011" after 3200 ns, "00011110" after 3300 ns, "00000000" after 3400 ns, "00000100" after 3500 ns, "00001000" after 3600 ns, "00001100" after 3700 ns,
--  "00010000" after 3800 ns, "00010100" after 3900 ns, "00011000" after 4000 ns , "00011100" after 4100 ns,
--  "00100000" after 4200 ns, "00100100" after 4300 ns, "00101000" after 4400 ns, "00101100" after 4500 ns;
--  wait;
--  end process test1;  



end architecture tb_SD;