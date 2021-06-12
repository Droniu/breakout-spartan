-- Vhdl test bench created from schematic C:\szyminson\polibuda\ucisw2\breakout-spartan\breakout.sch - Fri Jun 11 16:25:34 2021
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY breakout_breakout_sch_tb_2 IS
END breakout_breakout_sch_tb_2;
ARCHITECTURE behavioral OF breakout_breakout_sch_tb_2 IS 

   COMPONENT breakout
   PORT( VGA_HS	:	OUT	STD_LOGIC; 
          VGA_VS	:	OUT	STD_LOGIC; 
          RESET	:	IN	STD_LOGIC; 
          CLK_12MHz	:	IN	STD_LOGIC; 
          VGA_R	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0); 
          VGA_G	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0); 
          VGA_B	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 1));
   END COMPONENT;

   SIGNAL VGA_HS	:	STD_LOGIC;
   SIGNAL VGA_VS	:	STD_LOGIC;
   SIGNAL RESET	:	STD_LOGIC;
   SIGNAL CLK_12MHz	:	STD_LOGIC;
   SIGNAL VGA_R	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
   SIGNAL VGA_G	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
   SIGNAL VGA_B	:	STD_LOGIC_VECTOR (2 DOWNTO 1);
	
	-- Clock period definitions
   constant CLK_12MHz_period : time := 83 ns;
	constant SIM_CLOCKS : positive := 2 * 800 * 521 + 6000;

BEGIN

   UUT: breakout PORT MAP(
		VGA_HS => VGA_HS, 
		VGA_VS => VGA_VS, 
		RESET => RESET, 
		CLK_12MHz => CLK_12MHz, 
		VGA_R => VGA_R, 
		VGA_G => VGA_G, 
		VGA_B => VGA_B
   );
	
	-- Clock process definition
   CLK_12MHz_process :process
   begin
		for i in 1 to SIM_CLOCKS loop
			CLK_12MHz <= '0';
			wait for CLK_12MHz_period/2;
			CLK_12MHz <= '1';
			wait for CLK_12MHz_period/2;
		end loop;
		wait;
   end process;

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
		RESET <= '1';
		WAIT for 4*CLK_12MHz_period;
		RESET <= '0';
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
