library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-----------------------------------------
ENTITY counter IS
	GENERIC(k : positive := 3;
			m : positive := 7);
	PORT (rst, ena, clk, rise : IN STD_LOGIC;
			count : OUT std_logic_vector(k downto 0));
END counter;

------------------------------------------------
ARCHITECTURE rtl OF counter IS
	--signal temp : std_logic_vector (k downto 0);
BEGIN
  PROCESS (clk, rst)
    VARIABLE temp : STD_LOGIC_VECTOR (k downto 0);
  BEGIN
    IF(rst='1') THEN
		temp := (others => '0');
	ELSIF rising_edge(clk) THEN
		IF(ena='1') THEN
			IF(rise='1' AND temp<m+1) THEN
				temp := temp + 1;
			ELSIF(rise='0') THEN
				temp := (others => '0');
			END IF;
		END IF;
	END IF;
	count <= temp;
  END PROCESS;
  --count <= temp;
END rtl;