----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:57:28 04/07/2021 
-- Design Name: 
-- Module Name:    picture - Behavioral 
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

entity picture is
	 Generic ( PIX_X_BITS : positive := 10;
				  PIX_Y_BITS : positive := 9 );
    Port ( PIX_X : in  STD_LOGIC_VECTOR (PIX_X_BITS - 1 downto 0);
           PIX_Y : in  STD_LOGIC_VECTOR (PIX_Y_BITS - 1 downto 0);
           RGB : out  STD_LOGIC_VECTOR (2 downto 0));
end picture;

architecture Behavioral of picture is
	subtype t_color is std_logic_vector(2 downto 0);
	constant WHITE : t_color := "111";
	constant BLACK : t_color := "000";
	constant RED : t_color := "100";
	constant GREEN : t_color := "010";
	constant BLUE : t_color := "001";
	constant YELLOW : t_color := "110";
	constant CYAN : t_color := "011";
	constant MAGENTA : t_color := "101";
	
	signal x_int : integer range 0 to (PIX_X_BITS ** 2) - 1;
	signal y_int : integer range 0 to (PIX_Y_BITS ** 2) - 1;
	
begin
	x_int <= to_integer(unsigned(PIX_X));
	y_int <= to_integer(unsigned(PIX_Y));

	RGB <=  RED when x_int > 0   and x_int < 71  and y_int >= 40 and y_int <= 60 else
		    RED when x_int > 71  and x_int < 142 and y_int >= 40 and y_int <= 60 else
		    RED when x_int > 142 and x_int < 213 and y_int >= 40 and y_int <= 60 else
		    RED when x_int > 213 and x_int < 284 and y_int >= 40 and y_int <= 60 else
		    RED when x_int > 284 and x_int < 355 and y_int >= 40 and y_int <= 60 else
		    RED when x_int > 355 and x_int < 426 and y_int >= 40 and y_int <= 60 else
		    RED when x_int > 426 and x_int < 497 and y_int >= 40 and y_int <= 60 else
		    RED when x_int > 497 and x_int < 568 and y_int >= 40 and y_int <= 60 else
			RED when x_int > 568 and x_int < 639 and y_int >= 40 and y_int <= 60 else
		    BLACK;

end Behavioral;
