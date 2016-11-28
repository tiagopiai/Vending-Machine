LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY Debounce IS
PORT(	button, clk: IN STD_LOGIC;
		dbButton: OUT STD_LOGIC);
END Debounce;

ARCHITECTURE func OF Debounce IS
SIGNAL count: STD_LOGIC_VECTOR (1 DOWNTO 0);
BEGIN
PROCESS(clk, button, count)
BEGIN
	IF (button = '1') THEN
		count <= "00";
	ELSIF (clk'EVENT AND clk = '1') THEN
		IF(count /= "11") THEN
			count <= count + 1;
		END IF;
	END IF;
	IF (count = "01" AND button = '0') THEN
		dbButton <= '1';
	ELSE
		dbButton <= '0';
	END IF;
END PROCESS;
END func;