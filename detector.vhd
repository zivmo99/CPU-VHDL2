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
  PROCESS (count)
  BEGIN
    IF(count>=m+1) THEN
		detector <= '1';
	ELSE
		detector <= '0';
	END IF;
  END PROCESS;
END rtl;