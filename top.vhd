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
signal ding_new: STD_LOGIC_VECTOR (n-1 DOWNTO 0);
signal din_old: STD_LOGIC_VECTOR (n-1 DOWNTO 0);
SIGNAL din_old_xor : std_logic_vector(n-1 DOWNTO 0);
signal sub : std_logic_vector(n DOWNTO 0);
signal subInt : integer;
signal rise: STD_LOGIC;

begin
	process(rst,clk,ena)
	begin
	   if(rst='1') then
		    din_new<= (others=>'0');
		    din_old<=  (others=>'0');
	   elsif (clk'EVENT AND clk='1') then
	      if(ena='1') then
     			  din_new<=din;
     			  din_old<=dnew;
		    end if;
	   end if;
	end process;	
	
		   
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
	
	
end arc_sys;







