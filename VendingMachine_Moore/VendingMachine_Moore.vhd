LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY VendingMachine_Moore IS
	PORT(	reset, Nickel, Dime, Quarter, clk_50MHz: IN STD_LOGIC;
			V_change, X_change, Product: OUT STD_LOGIC;
			ledClk, ledCoin: OUT STD_LOGIC);
END VendingMachine_Moore;

ARCHITECTURE func OF VendingMachine_Moore IS

COMPONENT vendMachine IS
	PORT(	rst, N, D, Q, clk: IN STD_LOGIC;
			P, V, X: OUT STD_LOGIC);
END COMPONENT;

COMPONENT Debounce IS
PORT(	button, clk: IN STD_LOGIC;
		dbButton: OUT STD_LOGIC);
END COMPONENT;

COMPONENT Clk_Divider IS
PORT (rst, clk_50MHz: IN STD_LOGIC;
		clk_out: OUT STD_LOGIC);
END COMPONENT;


SIGNAL dbNickel, dbDime, dbQuarter: STD_LOGIC;

SIGNAL P, V, X: STD_LOGIC;
SIGNAL clk_vMach: STD_LOGIC;

BEGIN

ledClk <= clk_vMach;
ledCoin <= dbNickel OR dbDime OR dbQuarter;

U1: vendMachine PORT MAP (reset, dbNickel, dbDime, dbQuarter, clk_vMach, Product, V_change, X_change);
D1: Debounce PORT MAP (Nickel, clk_vMach, dbNickel);
D2: Debounce PORT MAP (Dime, clk_vMach, dbDime);
D3: Debounce PORT MAP (Quarter, clk_vMach, dbQuarter);
C1: Clk_Divider PORT MAP (reset, clk_50MHz, clk_vMach);
END func;

