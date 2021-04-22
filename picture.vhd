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
				  PIX_Y_BITS : positive := 9;
				  TILE_ROWS : positive := 6;
				  TILES_IN_ROW : positive := 9 );
    Port ( PIX_X : in  STD_LOGIC_VECTOR (PIX_X_BITS - 1 downto 0);
           PIX_Y : in  STD_LOGIC_VECTOR (PIX_Y_BITS - 1 downto 0);
           RGB : out  STD_LOGIC_VECTOR (2 downto 0));
end picture;

architecture Behavioral of picture is
	subtype t_color is std_logic_vector(2 downto 0);
	subtype x_coord is integer range 0 to (PIX_X_BITS ** 2) - 1;
	subtype y_coord is integer range 0 to (PIX_Y_BITS ** 2) - 1;
	subtype tiles_status is std_logic_vector((TILE_ROWS * TILES_IN_ROW) - 1 downto 0); 
	
	constant WHITE : t_color := "111";
	constant BLACK : t_color := "000";
	constant RED : t_color := "100";
	constant GREEN : t_color := "010";
	constant BLUE : t_color := "001";
	constant YELLOW : t_color := "110";
	constant CYAN : t_color := "011";
	constant MAGENTA : t_color := "101";
	
	constant FIRST_ROW_Y_OFFSET : integer := 40;
	constant TILE_HEIGHT : integer := 20;
	constant TILE_WIDTH : integer := 71;
	
	constant ENABLED_TILES : tiles_status := "100110111110111101110010101101011101110111101011011101";
	
	signal x_int : x_coord;
	signal y_int : y_coord;
	
	function tiles_row( row_number : integer range 0 to 10;
							  x_int : x_coord;
							  y_int : y_coord;
							  enabled_tiles : tiles_status ) return boolean is
		variable y_offset : integer range 0 to 140;
		variable ret_bool : boolean;
	begin
		y_offset := row_number * TILE_HEIGHT + FIRST_ROW_Y_OFFSET;
		ret_bool := false;
		for i in 0 to TILES_IN_ROW - 1 loop
			ret_bool := ret_bool or 
				( x_int > i*TILE_WIDTH and 
				  x_int < (i*TILE_WIDTH + TILE_WIDTH) and
				  y_int > y_offset and 
				  y_int < (y_offset + TILE_HEIGHT) and 
				  enabled_tiles(TILES_IN_ROW * row_number + i) = '1' );
		end loop;
		
		return ret_bool;
	end tiles_row;
	
begin
	x_int <= to_integer(unsigned(PIX_X));
	y_int <= to_integer(unsigned(PIX_Y));

	RGB <=  RED when tiles_row(0, x_int, y_int, ENABLED_TILES) else
			  YELLOW when tiles_row(1, x_int, y_int, ENABLED_TILES) else
			  GREEN when tiles_row(2, x_int, y_int, ENABLED_TILES) else
			  CYAN when tiles_row(3, x_int, y_int, ENABLED_TILES) else
			  BLUE when tiles_row(4, x_int, y_int, ENABLED_TILES) else
			  MAGENTA when tiles_row(5, x_int, y_int, ENABLED_TILES) else
			  BLACK;

end Behavioral;
