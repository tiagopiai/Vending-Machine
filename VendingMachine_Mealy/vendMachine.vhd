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
TYPE STATE_TYPE IS (M_0, M_5, M_10, M_15, M_20, C1_D, C1_N, led1_off, C2_D, C2_N, led2_off);

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
				next_state <= led2_off;
			ELSE
				next_state <= M_0;
			END IF;
			
		WHEN M_5 =>
			IF (N = '1' AND D = '0' AND Q = '0') THEN
				next_state <= M_10;
			ELSIF (N = '0' AND D = '1' AND Q = '0') THEN
				next_state <= M_15;
			ELSIF (N = '0' AND D = '0' AND Q = '1') THEN
				next_state <= C2_N;
			ELSE
				next_state <= M_5;
			END IF;
			
		WHEN M_10 =>
			IF (N = '1' AND D = '0' AND Q = '0') THEN
				next_state <= M_15;
			ELSIF (N = '0' AND D = '1' AND Q = '0') THEN
				next_state <= M_20;
			ELSIF (N = '0' AND D = '0' AND Q = '1') THEN
				next_state <= C2_D;
			ELSE
				next_state <= M_10;
			END IF;
			
		WHEN M_15 =>
			IF (N = '1' AND D = '0' AND Q = '0') THEN
				next_state <= M_20;
			ELSIF (N = '0' AND D = '1' AND Q = '0') THEN
				next_state <= led2_off;
			ELSIF (N = '0' AND D = '0' AND Q = '1') THEN
				next_state <= C1_N;
			ELSE
				next_state <= M_15;
			END IF;
			
		WHEN M_20 =>
			IF (N = '1' AND D = '0' AND Q = '0') THEN
				next_state <= led2_off;
			ELSIF (N = '0' AND D = '1' AND Q = '0') THEN
				next_state <= C2_N;
			ELSIF (N = '0' AND D = '0' AND Q = '1') THEN
				next_state <= C1_D;
			ELSE
				next_state <= M_20;
			END IF;
					
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
PROCESS (current_state, N, D, Q, rst)
BEGIN
	IF (rst <= '1') THEN
		P <= '0';
		V <= '0';
		X <= '0';
	END IF;
	IF (current_state = M_0 AND Q = '1') THEN
		P <= '1';
		V <= '0';
		X <= '0';
	ELSIF (current_state = M_5 AND Q = '1') THEN
		P <= '1';
		V <= '0';
		X <= '0';
	ELSIF (current_state = M_10 AND Q = '1') THEN
		P <= '1';
		V <= '0';
		X <= '0';
	ELSIF (current_state = M_15 AND (D = '1' OR Q = '1')) THEN
		P <= '1';
		V <= '0';
		X <= '0';
	ELSIF (current_state = M_20 AND (N = '1' OR D = '1' OR Q = '1')) THEN
		P <= '1';
		V <= '0';
		X <= '0';
	ELSIF (current_state = C1_D) THEN
		P <= '0';
		V <= '0';
		X <= '1';
	ELSIF (current_state = C1_N) THEN
		P <= '0';
		V <= '1';
		X <= '0';
	ELSIF (current_state = led1_off) THEN
		P <= '0';
		V <= '0';
		X <= '0';
	ELSIF (current_state = C2_D) THEN
		P <= '0';
		V <= '0';
		X <= '1';
	ELSIF (current_state = C2_N) THEN
		P <= '0';
		V <= '1';
		X <= '0';
	ELSIF (current_state = led2_off) THEN
		P <= '0';
		V <= '0';
		X <= '0';
	END IF;
END PROCESS;




END func;