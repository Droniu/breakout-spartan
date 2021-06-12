----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:07:43 06/11/2021 
-- Design Name: 
-- Module Name:    color_converter - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity color_converter is
    Port ( VGA_R_IN : in  STD_LOGIC;
           VGA_G_IN : in  STD_LOGIC;
           VGA_B_IN : in  STD_LOGIC;
           VGA_R_OUT : out  STD_LOGIC_VECTOR (2 downto 0);
           VGA_G_OUT : out  STD_LOGIC_VECTOR (2 downto 0);
           VGA_B_OUT : out  STD_LOGIC_VECTOR (2 downto 1));
end color_converter;

architecture Behavioral of color_converter is
	
begin

	VGA_R_OUT <= "111" when VGA_R_IN = '1' else "000";
	VGA_G_OUT <= "111" when VGA_G_IN = '1' else "000";
	VGA_B_OUT <= "11" when VGA_B_IN = '1' else "00";
	
end Behavioral;

