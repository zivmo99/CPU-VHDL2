LIBRARY ieee;
USE ieee.std_logic_1164.all;


package aux_package is
-----------------------------------------------------------------
	component top is
		generic (
			n : positive := 8 ;
			m : positive := 7 ;
			k : positive := 3
		); -- where k=log2(m+1)
		port(
			rst,ena,clk : in std_logic;
			din : in std_logic_vector(n-1 downto 0);
			cond : in integer range 0 to 3;
			detector : out std_logic
		);
	end component;
-----------------------------------------------------------------
	component Adder IS
		GENERIC (length : INTEGER := 8);
		PORT ( a, b: IN STD_LOGIC_VECTOR (length-1 DOWNTO 0);
			cin: IN STD_LOGIC;
            s: OUT STD_LOGIC_VECTOR (length-1 DOWNTO 0);
			cout: OUT STD_LOGIC);
	END component;
-----------------------------------------------------------------
	component detector IS
		GENERIC(k : positive := 3;
				m : positive := 7);
		PORT (count : IN std_logic_vector(k downto 0);
			  detector : OUT std_logic);
	END component;
-----------------------------------------------------------------
	component counter IS
		GENERIC(k : positive := 3;
				m : positive := 7);
		PORT (rst, ena, clk, rise : IN STD_LOGIC;
				count : OUT std_logic_vector(k downto 0));
	END component;


end aux_package;

