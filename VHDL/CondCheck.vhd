LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;
USE work.aux_package.all;
-------------------------------------
ENTITY CondCheck IS
  GENERIC (n : INTEGER := 8);
  PORT ( din_old,din_new: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
          cond: IN integer range 0 to 3;
          rise: OUT STD_LOGIC
          );
END CondCheck;
------------------------------------------------
ARCHITECTURE CC OF CondCheck IS
	SIGNAL din_old_xor : std_logic_vector(n-1 DOWNTO 0);
	signal sub : std_logic_vector(n DOWNTO 0);
	signal subInt : integer;
BEGIN
	temp : for i in 0 to n-1 generate
			din_old_xor(i) <= (not(din_old(i)));
	end generate;



L0 : Adder generic map(n) port map(
			a=>din_new,
			b=>din_old_xor,
			cin=>'1',
			s=>sub(n-1 DOWNTO 0),
			cout=>sub(n)
);

subInt <= to_integer(unsigned(sub(n-1 DOWNTO 0)));
rise <= '1' when cond=0 AND subInt=1 else
		'1' when cond=1 AND subInt=2 else
		'1' when cond=2 AND subInt=3 else
		'1' when cond=3 AND subInt=4 else
		'0';

END CC;
