library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
-----------------------------------------
ENTITY detector IS
	GENERIC(k : positive := 3;
			m : positive := 7);
	PORT (count : IN std_logic_vector(k downto 0);
		  detector : OUT std_logic);
END detector;

------------------------------------------------
ARCHITECTURE rtl OF detector IS
BEGIN
  BEGIN
  detector <= '1' when count>=m else '0';
END rtl;