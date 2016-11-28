LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY Clk_Divider IS
PORT (rst, clk_50MHz: IN STD_LOGIC;
		clk_out: OUT STD_LOGIC);
END Clk_Divider;

ARCHITECTURE func OF Clk_Divider IS
BEGIN
clk_div:
PROCESS (clk_50MHz, rst)
VARIABLE count: STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN
	IF (rst = '1') THEN 
		count := x"00000000";
	ELSIF (clk_50MHz'EVENT AND clk_50MHz = '1') THEN
			count := count + 1;
	END IF;
	clk_out <= count(23); --3Hz
END PROCESS;

END func;
