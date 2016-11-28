--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:31:13 10/30/2015
-- Design Name:   
-- Module Name:   E:/Documents/ASU Courses/EEE 333 - Hardware Design/Labs/Lab 1/VendingMachine_Moore/Debounce_tb.vhd
-- Project Name:  VendingMachine_Moore
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Debounce
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Debounce_tb IS
END Debounce_tb;
 
ARCHITECTURE behavior OF Debounce_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Debounce
    PORT(
         button : IN  std_logic;
         clk : IN  std_logic;
         dbButton : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal button : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal dbButton : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Debounce PORT MAP (
          button => button,
          clk => clk,
          dbButton => dbButton
        );

	PROCESS
	BEGIN
	clk <= NOT clk;
	WAIT FOR 1 NS;
	END PROCESS;
	
	PROCESS
	BEGIN
		button <= '1';
		
		WAIT FOR 4 NS;
		
		button <= '0';
		
		WAIT FOR 4 NS;
		
		button <= '1';
		
		WAIT FOR 8 NS;
		
		button <= '0';
		
		WAIT FOR 4 NS;
		
		button <= '1';
		
		WAIT;
	END PROCESS;
	
END;
