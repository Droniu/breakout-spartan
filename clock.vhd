----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:02:46 05/06/2021 
-- Design Name: 
-- Module Name:    clock - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock is
    Port ( CLK_50MHz : in  STD_LOGIC;
           CLK_25MHz : out  STD_LOGIC);
end clock;

architecture Behavioral of clock is
	signal clk_25 : STD_LOGIC;
begin
	clk_div: process (CLK_50MHz) begin
		if rising_edge(CLK_50MHz) then
			if clk_25 = '1' then
				clk_25 <= '0';
			else
				clk_25 <= '1';
			end if;
		end if;
	end process;

	CLK_25MHz <= clk_25;
end Behavioral;

