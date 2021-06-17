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
				FRAMES_PER_BALL_MOVE: positive := 6);

    Port (  CLK_25MHz        :     in  STD_LOGIC;
				RESET : in STD_LOGIC;
				PL_LEFT : in STD_LOGIC;
				PL_RIGHT : in STD_LOGIC;
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
	subtype ticks_sum is integer range -50 to 50;

   constant FIRST_ROW_Y_OFFSET : positive := 40;
	constant TILE_HEIGHT : positive := 20;
	constant TILE_WIDTH : positive := 71;
	constant BALL_RADIUS : positive := 15;
	constant PLATFORM_HEIGHT : positive := 14;
	constant PLATFORM_WIDTH : positive := 100;
	constant PLATFORM_Y : positive := 440;
	constant PLATFORM_PIX_PER_TICK : positive := 2;
	
	constant INIT_BALL_X : positive := 180;
	constant INIT_BALL_Y : positive := 300;
	constant INIT_PLATFORM_X : positive := 320;
	constant INIT_H_SPEED : speed := 4;
	constant INIT_V_SPEED : speed := 5;
	constant INIT_ENABLED_TILES : tiles_status :="111111111111111111111111111111111111111111111111111111"; --"100110111110111101110010101101011101110111101011011101";
	constant INIT_ENCODER_TICKS : ticks_sum := 0;
	
	 
	 signal	frame_clk : std_logic;
	 signal 	frame_clk_cnt : integer range 0 to CLOCKS_PER_FRAME;
	 
    signal  ball_clk  : std_logic;
    signal  ball_clk_cnt : integer range 0 to FRAMES_PER_BALL_MOVE;
	 
	 signal 	v_speed : speed;
	 signal 	h_speed : speed;
	 
    signal  ball_x_int : x_coord;
    signal  ball_y_int : y_coord;
	 signal 	platform_x_int : x_coord;
	 
	 signal enabled_tiles_mem : tiles_status;
	
	function platform_collision ( ball_x : x_coord;
											ball_y : y_coord;
											platform_x : x_coord ) return boolean is
	begin
		return ball_x > platform_x - (PLATFORM_WIDTH/2) and
					ball_x < platform_x + (PLATFORM_WIDTH/2) and
					ball_y + BALL_RADIUS >= PLATFORM_Y - (PLATFORM_HEIGHT/2);
	end platform_collision;
	
	function wall_collision ( ball_x : x_coord) return boolean is
	begin
		return ball_x + BALL_RADIUS > 640 or
					ball_x - BALL_RADIUS < 0;
	end wall_collision;
	
	function ceiling_collision ( ball_y : y_coord) return boolean is
	begin
		return ball_y - BALL_RADIUS < 0;
	end ceiling_collision;
	
	function tile_collision( ball_x : x_coord;
									ball_y : y_coord;
							  enabled_tiles : tiles_status;
							  tile_number : integer range 0 to TILES_IN_ROW - 1;
							  row_number : integer range 0 to TILE_ROWS - 1) return integer is
		variable ret_int : integer range 0 to 2;
		variable y_offset : integer range 0 to 140;
	begin
		ret_int := 0;
		y_offset := (row_number * TILE_HEIGHT) + FIRST_ROW_Y_OFFSET;
		if enabled_tiles(TILES_IN_ROW * row_number + tile_number) = '1' then
				if (ball_x > tile_number*TILE_WIDTH and 
				  ball_x < (tile_number*TILE_WIDTH + TILE_WIDTH) and
				  ball_y > y_offset + BALL_RADIUS and 
				  ball_y < (y_offset + TILE_HEIGHT + BALL_RADIUS)) or
				  (ball_x > tile_number*TILE_WIDTH and 
				  ball_x < (tile_number*TILE_WIDTH + TILE_WIDTH) and
				  ball_y + BALL_RADIUS > y_offset and 
				  ball_y + BALL_RADIUS < (y_offset + TILE_HEIGHT))
				  then
					ret_int := 2;
				elsif (ball_x > tile_number*TILE_WIDTH + BALL_RADIUS and 
				  ball_x < (tile_number*TILE_WIDTH + TILE_WIDTH + BALL_RADIUS) and
				  ball_y > y_offset and 
				  ball_y < (y_offset + TILE_HEIGHT)) or
				  (ball_x + BALL_RADIUS > tile_number*TILE_WIDTH and 
				  ball_x + BALL_RADIUS < (tile_number*TILE_WIDTH + TILE_WIDTH) and
				  ball_y > y_offset and 
				  ball_y < (y_offset + TILE_HEIGHT)) then
				  ret_int := 1;
				end if;
			end if;
		return ret_int;
	end tile_collision;
	
	function tiles_collision( ball_x : x_coord;
							  ball_y : y_coord;
							  enabled_tiles : tiles_status) return integer is
		variable ret_int : integer range 0 to 2;
	begin
		ret_int := 0;
		for row_number in 0 to TILE_ROWS - 1 loop
			for i in 0 to TILES_IN_ROW - 1 loop
				if tile_collision(ball_x, ball_y, enabled_tiles, i, row_number) = 1 then
					ret_int := 1;
				elsif tile_collision(ball_x, ball_y, enabled_tiles, i, row_number) = 2 then
					ret_int := 2;
				end if;
			end loop;
		end loop;
		
		return ret_int;
	end tiles_collision;
	
	function get_colliding_tile( ball_x : x_coord;
							  ball_y : y_coord;
							  enabled_tiles : tiles_status) return integer is
		variable y_offset : integer range 0 to 140;
		variable ret_int : integer range 0 to (TILE_ROWS * TILES_IN_ROW)**2;
	begin
		ret_int := 0;
		for row_number in 0 to TILE_ROWS - 1 loop
			y_offset := row_number * TILE_HEIGHT + FIRST_ROW_Y_OFFSET;

			for i in 0 to TILES_IN_ROW - 1 loop
				if tile_collision(ball_x, ball_y, enabled_tiles, i, row_number) > 0 then
					  ret_int := TILES_IN_ROW * row_number + i;
				end if;
			end loop;
		end loop;
		
		return ret_int;
	end get_colliding_tile;

    begin
	
		  frame_clk_div: process(CLK_25MHz, RESET) begin
		  
				if RESET = '1' then
						frame_clk_cnt <= 0;
						frame_clk <= '0';
						
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
				variable tiles_collision_result : integer range 0 to 2;
            begin
					 if RESET = '1' then
						ball_x_int <= INIT_BALL_X;
						ball_y_int <= INIT_BALL_Y;
						h_speed <= INIT_H_SPEED;
						v_speed <= INIT_V_SPEED;
						enabled_tiles_mem <= INIT_ENABLED_TILES;
                elsif (rising_edge(ball_clk)) then
								tiles_collision_result := tiles_collision(ball_x_int + h_speed, ball_y_int + v_speed, enabled_tiles_mem);
								
								if ball_y_int + v_speed + BALL_RADIUS > 480 then
									v_speed <= 0;
									h_speed <= 0;
								
								elsif platform_collision(ball_x_int + h_speed, ball_y_int + v_speed, platform_x_int)
									 then
									--if ball_x_int + h_speed > platform_x_int + 20 then
										--ball_x_int <= ball_x_int + h_speed + 1;
										--ball_y_int <= ball_y_int - v_speed;
										--v_speed <= -v_speed;
										--h_speed <= h_speed + 1;
									--elsif ball_x_int + h_speed + 20 < platform_x_int then
										--ball_x_int <= ball_x_int - h_speed - 1;
										--ball_y_int <= ball_y_int - v_speed;
										--v_speed <= -v_speed;
										--h_speed <= h_speed - 1;
									--else 
										ball_y_int <= ball_y_int - v_speed;
										ball_x_int <= ball_x_int + h_speed;
										v_speed <= -v_speed;
									--end if;

									
									
									
								elsif tiles_collision_result = 2 or ceiling_collision(ball_y_int + v_speed) then
									if tiles_collision_result = 2 then
										enabled_tiles_mem(get_colliding_tile(ball_x_int + h_speed, ball_y_int + v_speed, enabled_tiles_mem)) <= '0';
									end if;
									ball_x_int <= ball_x_int + h_speed;
									ball_y_int <= ball_y_int - v_speed;
									v_speed <= -v_speed;
									
								
								elsif tiles_collision_result = 1 or wall_collision(ball_x_int + h_speed) then
									if tiles_collision_result = 1 then
										enabled_tiles_mem(get_colliding_tile(ball_x_int + h_speed, ball_y_int + v_speed, enabled_tiles_mem)) <= '0';
									end if;
									ball_x_int <= ball_x_int - h_speed;
									ball_y_int <= ball_y_int + v_speed;
									h_speed <= -h_speed;
								
								else
									ball_x_int <= ball_x_int + h_speed;
									ball_y_int <= ball_y_int + v_speed;
								end if;  
                end if;
                    

        end process;
		  
		  platform_movement: process(frame_clk, RESET)
			begin
				if RESET = '1' then
					platform_x_int <= INIT_PLATFORM_X;
					--encoder_ticks <= INIT_ENCODER_TICKS;
				elsif(rising_edge(frame_clk)) then
					--if ball_clk = '1' then
						--platform_x_int <= platform_x_int + (encoder_ticks * PLATFORM_PIX_PER_TICK);
						--encoder_ticks <= INIT_ENCODER_TICKS;
					--end if;
					if PL_RIGHT = '1' then
						--encoder_ticks <= encoder_ticks - 1;
						platform_x_int <= platform_x_int + PLATFORM_PIX_PER_TICK;
					elsif PL_LEFT = '1' then
						--encoder_ticks <= encoder_ticks + 1;
						platform_x_int <= platform_x_int - PLATFORM_PIX_PER_TICK;
					end if;
				end if;

		  end process;
		 

		  BALL_X <= std_logic_vector(to_unsigned(ball_x_int, PIX_X_BITS));
		  BALL_Y <= std_logic_vector(to_unsigned(ball_y_int, PIX_Y_BITS));
		  PLATFORM_X <= std_logic_vector(to_unsigned(platform_x_int, PIX_X_BITS));
		  ENABLED_TILES <= enabled_tiles_mem;


end Behavioral;
