LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY vendMachine_tb IS
END vendMachine_tb;
 
ARCHITECTURE behavior OF vendMachine_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT vendMachine
    PORT(
         rst : IN  std_logic;
         N : IN  std_logic;
         D : IN  std_logic;
         Q : IN  std_logic;
         clk : IN  std_logic;
         P : OUT  std_logic;
         V : OUT  std_logic;
         X : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal N : std_logic := '0';
   signal D : std_logic := '0';
   signal Q : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal P : std_logic;
   signal V : std_logic;
   signal X : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: vendMachine PORT MAP (
          rst => rst,
          N => N,
          D => D,
          Q => Q,
          clk => clk,
          P => P,
          V => V,
          X => X
        );

 	clock:
	PROCESS
	BEGIN
		clk <= NOT clk;
		WAIT FOR 1 NS;
	END PROCESS;
	
	PROCESS
	BEGIN
		D <= '0';
		N <= '0';
		Q <= '0';
		
		WAIT FOR 4 NS;

-- N + D + D = 25 cents no change	
		N <= '1';
	
		WAIT FOR 2 NS;
		
		N <= '0';
		
		WAIT FOR 2 NS;
		
		D <= '1';
		
		WAIT FOR 2 NS;

		D <= '0';
		
		WAIT FOR 2 NS;
		
		D <= '1';
		
		WAIT FOR 2 NS;
		
		D <= '0';
		
		WAIT FOR 8 NS;
		
-- D + D + D = 30 cents 5 cents of change
		
		D <= '1';
		
		WAIT FOR 2 NS;
		
		D <= '0';
		
		WAIT FOR 2 NS;

		D <= '1';
		
		WAIT FOR 2 NS;
		
		D <= '0';
		
		WAIT FOR 2 NS;
		
		D <= '1';
		
		WAIT FOR 2 NS;
		
		D <= '0';
	
		WAIT FOR 8 NS;
		
-- N + D + Q = 40 cents 15 cents of change

		N <= '1';
		
		WAIT FOR 2 NS;
		
		N <= '0';
		
		WAIT FOR 2 NS;
		
		D <= '1';
		
		WAIT FOR 2 NS;
		
		D <= '0';
		
		WAIT FOR 2 NS;
		
		Q <= '1';
		
		WAIT FOR 2 NS;
		
		Q <= '0';
		
		WAIT FOR 8 NS;
		
-- D + D + Q = 45 cents 20 cents of change

		D <= '1';
		
		WAIT FOR 2 NS;
		
		D <= '0';
		
		WAIT FOR 2 NS;
		
		D <= '1';
		
		WAIT FOR 2 NS;
		
		D <= '0';
		
		WAIT FOR 2 NS;
		
		Q <= '1';
		
		WAIT FOR 2 NS;
		
		Q <= '0';
		
		WAIT;
	END PROCESS;
END;
