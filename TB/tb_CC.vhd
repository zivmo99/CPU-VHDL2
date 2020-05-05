LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.all;
USE work.aux_package.all;
-------------------------------------------------------------

entity tb_CC is
	constant n : integer := 8;
end tb_CC;

architecture tb_CC of tb_CC is
component CondCheck is
  GENERIC (n : INTEGER := 8);
  PORT ( din_old,din_new: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
          cond: IN integer range 0 TO 3 ;
          rise: OUT STD_LOGIC
		);
end component;
---------------------------------------
SIGNAL din_old : STD_LOGIC_VECTOR (n-1 DOWNTO 0);
SIGNAL din_new : STD_LOGIC_VECTOR (n-1 DOWNTO 0);
SIGNAL cond : integer range 0 TO 3 ;
SIGNAL rise :  STD_LOGIC;

begin
	L0 : CondCheck generic map (n) port map
	(din_old=>din_old,din_new=>din_new,cond=>cond,rise=>rise);
    
	--------- start of stimulus section ------------------	

	cond<= 0 , 1 after 1200 ns , 2 after 2400 ns , 3 after 3600 ns , 0 after 4800 ns;

  din_new1 : process
	VARIABLE temp : INTEGER;
  begin
			for i in 0 to 1 loop
				temp := 1;
				for i in 0 to 3 loop
					din_new <= (others => '0');
					wait for 100 ns;
					for i in 0 to 10 loop
						din_new <= din_new+temp;
						wait for 100 ns;	
					end loop;
					temp := temp+1;
				end loop;
			end loop;	
	wait;
  end process din_new1;
  
  	din_old1 : process
		VARIABLE temp : INTEGER;
        begin
			for i in 0 to 1 loop
				temp := 1;
				for i in 0 to 3 loop
					din_old <= (others => '0');
					if(i=0) then 
  					 wait for 100 ns;
					end if;
					wait for 100 ns;
					for i in 0 to 10 loop
						din_old <= din_old+temp;
						wait for 100 ns;	
					end loop;
					temp := temp+1;
				end loop;
			end loop;	
			wait;
    end process din_old1;
  
end architecture tb_CC;