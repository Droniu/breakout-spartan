----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:30:11 05/04/2021 
-- Design Name: 
-- Module Name:    logic - Behavioral 
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

entity logic is
    Generic (   
            PIX_X_BITS : positive := 10;
            PIX_Y_BITS : positive := 9;
            TILE_ROWS : positive := 6;
            TILES_IN_ROW : positive := 9;
				CLOCKS_PER_FRAME: positive := 800*521;
				FRAMES_PER_BALL_MOVE: positive := 1);

    Port (  CLK_25MHz        :     in  STD_LOGIC;
				RESET : in STD_LOGIC;
		    ENABLED_TILES : out STD_LOGIC_VECTOR ((TILE_ROWS * TILES_IN_ROW) - 1 downto 0);
		    BALL_X :        out STD_LOGIC_VECTOR (PIX_X_BITS - 1 downto 0);
		    BALL_Y :        out STD_LOGIC_VECTOR (PIX_Y_BITS - 1 downto 0);
		    PLATFORM_X :    out STD_LOGIC_VECTOR (PIX_X_BITS - 1 downto 0));
end logic;

architecture Behavioral of logic is
	subtype x_coord is integer range 0 to (2 ** PIX_X_BITS) - 1;
	subtype y_coord is integer range 0 to (2 ** PIX_Y_BITS) - 1;
	subtype tiles_status is std_logic_vector((TILE_ROWS * TILES_IN_ROW) - 1 downto 0);
	subtype speed is integer range -100 to 100;

   constant FIRST_ROW_Y_OFFSET : positive := 40;
	constant TILE_HEIGHT : positive := 20;
	constant TILE_WIDTH : positive := 71;
	constant BALL_RADIUS : positive := 15;
	constant PLATFORM_HEIGHT : positive := 14;
	constant PLATFORM_WIDTH : positive := 100;
	constant PLATFORM_Y : positive := 440;
	
	constant INIT_BALL_X : positive := 300;
	constant INIT_BALL_Y : positive := 220;
	constant INIT_PLATFORM_X : positive := 100;
	constant INIT_H_SPEED : speed := 4;
	constant INIT_V_SPEED : speed := -10;
	constant INIT_ENABLED_TILES : tiles_status := "100110111110111101110010101101011101110111101011011101";
	
	 
	 signal	frame_clk : std_logic;
	 signal 	frame_clk_cnt : integer range 0 to CLOCKS_PER_FRAME;
	 
    signal  ball_clk  : std_logic;
    signal  ball_clk_cnt : integer range 0 to FRAMES_PER_BALL_MOVE;
	 
	 signal 	v_speed : speed;
	 signal 	h_speed : speed;
	 
    signal  ball_x_int : x_coord;
    signal  ball_y_int : y_coord;
	 signal 	platform_x_int : x_coord;

    begin
		  frame_clk_div: process(CLK_25MHz, RESET) begin
		  
				if RESET = '1' then
						frame_clk_cnt <= 0;
						frame_clk <= '0';
						
						platform_x_int <= INIT_PLATFORM_X;
						h_speed <= INIT_H_SPEED;
						v_speed <= INIT_V_SPEED;
						ENABLED_TILES <= INIT_ENABLED_TILES;
						
				elsif rising_edge(CLK_25MHz) then
					if frame_clk_cnt = CLOCKS_PER_FRAME/2 then
						frame_clk_cnt <= 0;
						frame_clk <= '1';
					else
						frame_clk_cnt <= frame_clk_cnt + 1;
						frame_clk <= '0';
					end if;
				end if;
		  end process;
		  
        ball_clk_div: process(frame_clk, RESET)
            begin
				    if RESET = '1' then
							ball_clk_cnt <= 0;
							ball_clk <= '0';
                elsif (rising_edge(frame_clk)) then
                    if ball_clk_cnt = FRAMES_PER_BALL_MOVE then
                        ball_clk_cnt <= 0;
								ball_clk <= '1';
                    else
                        ball_clk_cnt <= ball_clk_cnt + 1;
								ball_clk <= '0';
                    end if;
                end if;
        end process;
		  
        ball_movement: process(ball_clk, RESET)
            begin
					 if RESET = '1' then
						ball_x_int <= INIT_BALL_X;
						ball_y_int <= INIT_BALL_Y;
                elsif (rising_edge(ball_clk)) then
                        ball_x_int <= ball_x_int + h_speed;
                        ball_y_int <= ball_y_int + v_speed;
                end if;
                    
                    -- tu trzeba wrzucic inne zachowania pileczki

        end process;


		  BALL_X <= std_logic_vector(to_unsigned(ball_x_int, PIX_X_BITS));
		  BALL_Y <= std_logic_vector(to_unsigned(ball_y_int, PIX_Y_BITS));
		  PLATFORM_X <= std_logic_vector(to_unsigned(platform_x_int, PIX_X_BITS));


end Behavioral;
