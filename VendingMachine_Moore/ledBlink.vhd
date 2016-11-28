LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY ledBlink IS
PORT (clk: IN STD_LOGIC;
		led: OUT STD_LOGIC);
END ledBlink;

ARCHITECTURE func OF ledBlink IS
BEGIN

PROCESS(clk)
BEGIN
IF (clk'EVENT AND clk = '1') THEN
led <= '0';
FOR I IN 0 TO 10000 LOOP
FOR I IN 0 TO 10000 LOOP
END LOOP;
END LOOP;

led <= '1';
FOR I IN 0 TO 10000 LOOP
END LOOP;
END IF;
END PROCESS;
END func;