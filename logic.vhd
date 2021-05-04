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
            TILES_IN_ROW : positive := 9 );

    Port (  CLK             in  STD_LOGIC
            ROTARY_ENC :    in  STD_LOGIC_VECTOR (PIX_X_BITS - 1 downto 0);
		    ENABLED_TILES : out STD_LOGIC_VECTOR ((TILE_ROWS * TILES_IN_ROW) - 1 downto 0);
		    BALL_X :        out STD_LOGIC_VECTOR (PIX_X_BITS - 1 downto 0);
		    BALL_Y :        out STD_LOGIC_VECTOR (PIX_Y_BITS - 1 downto 0);
		    PLATFORM_X :    out STD_LOGIC_VECTOR (PIX_X_BITS - 1 downto 0);
end logic;

architecture Behavioral of logic is
    constant CLOCK_STOP  : integer := 500000
    constant BALL_RADIUS : integer := 15
    signal   BALL_CLOCK  : integer := 0
    signal   VSPEED      : integer := 0
    signal   HSPEED      : integer := 0
    signal   pos_x       : integer := 300
    signal   pos_y       : integer := 60
    signal   game_start  : integer := 0

    begin
        ballclock: process(CLK)
            begin
                if (rising_edge(clk)) then
                    if BALL_CLOCK >= CLOCK_STOP then
                        BALL_CLOCK <= 0;
                    else
                        BALL_CLOCK <= BALL_CLOCK + 1;
                    end if;
                end if;
        end process;

        movement: process(CLK, BALL_CLOCK, pos_x, pos_y, game_start)
            begin
                if (rising_edge(clk)) then
                    if game_start = 0
                        VSPEED <= -1
                        HSPEED <= -1
                        game_start <= 1
                    end if;

                    if (BALL_CLOCK = 0)
                        pos_x <= pos_x + HSPEED
                        pos_y <= pos_y + VSPEED
                    end if;
                    
                    -- tu trzeba wrzucic inne zachowania pileczki

                end if;
        end process;

        conversion: process(CLK, pos_x, pos_y, BALL_X, BALL_Y)
            begin
                if (rising_edge(clk)) then
                    BALL_X <= std_logic_vector(to_unsigned(pos_x, BALL_X'length));
                    BALL_Y <= std_logic_vector(to_unsigned(pos_y, BALL_Y'length));
                end if;
        end process;

end Behavioral;
