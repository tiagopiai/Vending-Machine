LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_arith.all;

ENTITY vendMachine IS
	PORT(	rst, N, D, Q, clk: IN STD_LOGIC;
			P, V, X: OUT STD_LOGIC);
END vendMachine;

ARCHITECTURE func OF vendMachine IS
TYPE STATE_TYPE IS (M_0, M_5, M_10, M_15, M_20, M_25, M_30, M_35, M_40, M_45, C1_D, C1_N, led1_off, C2_D, C2_N, led2_off);

SIGNAL current_state, next_state: STATE_TYPE;
BEGIN

state_uptade:
PROCESS(clk, rst)
BEGIN
	IF (rst = '1') THEN
		current_state <= M_0;
	ELSIF (clk'EVENT AND clk = '1') THEN
       current_state <= next_state;
    END IF;
END PROCESS;

state_change:
PROCESS (N, D, Q, current_state)
BEGIN
	CASE current_state IS
		WHEN M_0 =>
			IF (N = '1' AND D = '0' AND Q = '0') THEN
				next_state <= M_5;
			ELSIF (N = '0' AND D = '1' AND Q = '0') THEN
				next_state <= M_10;
			ELSIF (N = '0' AND D = '0' AND Q = '1') THEN
				next_state <= M_25;
			ELSE
				next_state <= M_0;
			END IF;
			
		WHEN M_5 =>
			IF (N = '1' AND D = '0' AND Q = '0') THEN
				next_state <= M_10;
			ELSIF (N = '0' AND D = '1' AND Q = '0') THEN
				next_state <= M_15;
			ELSIF (N = '0' AND D = '0' AND Q = '1') THEN
				next_state <= M_30;
			ELSE
				next_state <= M_5;
			END IF;
			
		WHEN M_10 =>
			IF (N = '1' AND D = '0' AND Q = '0') THEN
				next_state <= M_15;
			ELSIF (N = '0' AND D = '1' AND Q = '0') THEN
				next_state <= M_20;
			ELSIF (N = '0' AND D = '0' AND Q = '1') THEN
				next_state <= M_35;
			ELSE
				next_state <= M_10;
			END IF;
			
		WHEN M_15 =>
			IF (N = '1' AND D = '0' AND Q = '0') THEN
				next_state <= M_20;
			ELSIF (N = '0' AND D = '1' AND Q = '0') THEN
				next_state <= M_25;
			ELSIF (N = '0' AND D = '0' AND Q = '1') THEN
				next_state <= M_40;
			ELSE
				next_state <= M_15;
			END IF;
			
		WHEN M_20 =>
			IF (N = '1' AND D = '0' AND Q = '0') THEN
				next_state <= M_25;
			ELSIF (N = '0' AND D = '1' AND Q = '0') THEN
				next_state <= M_30;
			ELSIF (N = '0' AND D = '0' AND Q = '1') THEN
				next_state <= M_45;
			ELSE
				next_state <= M_20;
			END IF;
			
		WHEN M_25 =>
			next_state <= led2_off;
			
		WHEN M_30 =>
			next_state <= C2_N;
			
		WHEN M_35 =>
			next_state <= C2_D;
			
		WHEN M_40 =>
			next_state <= C1_N;
					
		WHEN M_45 =>
			next_state <= C1_D;
					
		WHEN C1_D =>
			next_state <= led1_off;
			
		WHEN C1_N =>
			next_state <= led1_off;
			
		WHEN led1_off =>
			next_state <= C2_D;
				
		WHEN C2_D =>
			next_state <= led2_off;
		
		WHEN C2_N =>
			next_state <= led2_off;
		
		WHEN led2_off =>
			next_state <= M_0;
	END CASE;
END PROCESS;

output_process:
PROCESS (current_state)

BEGIN
	CASE current_state IS
		WHEN M_0 =>
			P <= '0';
			V <= '0';
			X <= '0';
			
		WHEN M_5 =>
			P <= '0';
			V <= '0';
			X <= '0';
			
		WHEN M_10 =>
			P <= '0';
			V <= '0';
			X <= '0';
			
		WHEN M_15 =>
			P <= '0';
			V <= '0';
			X <= '0';
			
		WHEN M_20 =>
			P <= '0';
			V <= '0';
			X <= '0';
			
		WHEN M_25 =>
			P <= '1';
			V <= '0';
			X <= '0';
			
		WHEN M_30 =>
			P <= '1';
			V <= '0';
			X <= '0';
			
		WHEN M_35 =>
			P <= '1';
			V <= '0';
			X <= '0';
			
		WHEN M_40 =>
			P <= '1';
			V <= '0';
			X <= '0';
			
		WHEN M_45 =>
			P <= '1';
			V <= '0';
			X <= '0';
			
		WHEN C1_N =>
			V <= '1';
			P <= '0';
			
		WHEN C1_D =>
			X <= '1';
			P <= '0';
			
		WHEN led1_off =>
			V <= '0';
			X <= '0';
			P <= '0';
			
		WHEN C2_N =>
			V <= '1';
			P <= '0';
			
		WHEN C2_D =>
			X <= '1';
			P <= '0';
			
		WHEN led2_off =>
			V <= '0';
			X <= '0';
			P <= '0';
			
	END CASE;
END PROCESS;




END func;