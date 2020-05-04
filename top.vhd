LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE work.aux_package.all;
USE ieee.numeric_std.ALL;
-------------------------------------------------------------
entity top is
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
end top;
------------- complete the top Architecture code --------------
architecture arc_sys of top is
signal din_new : STD_LOGIC_VECTOR (n-1 DOWNTO 0);
signal din_old : STD_LOGIC_VECTOR (n-1 DOWNTO 0);	 
SIGNAL din_old_xor : std_logic_vector(n-1 DOWNTO 0); -- For the condition check (subtractor)
signal sub : std_logic_vector(n DOWNTO 0);			 -- The subtractor result
signal subInt : integer; 							 -- The subtractor result in integer
signal rise : STD_LOGIC;
signal count : std_logic_vector(k downto 0);

begin
	-- Synchronous delay
	process(rst,clk)
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
	
	
	-- Condition check (Subtractor)	
	temp : for i in 0 to n-1 generate
			din_old_xor(i) <= (not(din_old(i)));
	end generate;

	L0 : Adder generic map(n) port map(
		a=>din_new,
		b=>din_old_xor,
		cin=>'1',
		s=>sub(n-1 DOWNTO 0),
		cout=>sub(n)
	); -- Adder single instantiation
	
	subInt <= to_integer(unsigned(sub(n-1 DOWNTO 0)));
	rise <= '1' when cond=0 AND subInt=1 else
		'1' when cond=1 AND subInt=2 else
		'1' when cond=2 AND subInt=3 else
		'1' when cond=3 AND subInt=4 else
		'0';
	
	
	-- Counter
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

		
	-- Detector	
	detector <= '1' when count>=m else '0';
	
end arc_sys;