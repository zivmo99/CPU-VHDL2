LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
--USE work.aux_package.all;
-------------------------------------------------------------
entity SyncronousDelay is
GENERIC (n : positive := 8 );
PORT (rst , clk , ena: IN STD_LOGIC;
      din: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
      din_new: BUFFER STD_LOGIC_VECTOR (n-1 DOWNTO 0);
      din_old: OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0)
      );
end SyncronousDelay;


architecture SD of SyncronousDelay is 
begin
	process(rst,clk,ena)
	begin
	   if(rst='1') then
		    din_new<= (others=>'0');
		    din_old<=  (others=>'0');
	   elsif (clk'EVENT AND clk='1') then
	      if(ena='1') then
     			  din_new<=din;
     			  din_old<=din_new;
		    end if;
	   end if;
	end process;
end SD;