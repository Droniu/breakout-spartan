--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : breakout.vhf
-- /___/   /\     Timestamp : 04/23/2021 01:05:08
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl C:/Users/szyminson/Documents/xilinx/breakout-spartan/breakout.vhf -w C:/Users/szyminson/Documents/xilinx/breakout-spartan/breakout.sch
--Design Name: breakout
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity breakout is
   port ( BALL_X        : in    std_logic_vector (9 downto 0); 
          BALL_Y        : in    std_logic_vector (8 downto 0); 
          CLK_50MHz     : in    std_logic; 
          ENABLED_TILES : in    std_logic_vector (53 downto 0); 
          PLATFORM_X    : in    std_logic_vector (9 downto 0); 
          VGA_B         : out   std_logic; 
          VGA_G         : out   std_logic; 
          VGA_HS        : out   std_logic; 
          VGA_R         : out   std_logic; 
          VGA_VS        : out   std_logic);
end breakout;

architecture BEHAVIORAL of breakout is
   signal XLXN_2        : std_logic_vector (2 downto 0);
   signal XLXN_4        : std_logic_vector (9 downto 0);
   signal XLXN_5        : std_logic_vector (8 downto 0);
   component driver
      port ( CLK_50MHz : in    std_logic; 
             RGB       : in    std_logic_vector (2 downto 0); 
             VGA_R     : out   std_logic; 
             VGA_G     : out   std_logic; 
             VGA_B     : out   std_logic; 
             VGA_HS    : out   std_logic; 
             VGA_VS    : out   std_logic; 
             PIX_X     : out   std_logic_vector (9 downto 0); 
             PIX_Y     : out   std_logic_vector (8 downto 0));
   end component;
   
   component picture
      port ( PIX_X         : in    std_logic_vector (9 downto 0); 
             PIX_Y         : in    std_logic_vector (8 downto 0); 
             RGB           : out   std_logic_vector (2 downto 0); 
             ENABLED_TILES : in    std_logic_vector (53 downto 0); 
             BALL_X        : in    std_logic_vector (9 downto 0); 
             BALL_Y        : in    std_logic_vector (8 downto 0); 
             PLATFORM_X    : in    std_logic_vector (9 downto 0));
   end component;
   
begin
   XLXI_1 : driver
      port map (CLK_50MHz=>CLK_50MHz,
                RGB(2 downto 0)=>XLXN_2(2 downto 0),
                PIX_X(9 downto 0)=>XLXN_4(9 downto 0),
                PIX_Y(8 downto 0)=>XLXN_5(8 downto 0),
                VGA_B=>VGA_B,
                VGA_G=>VGA_G,
                VGA_HS=>VGA_HS,
                VGA_R=>VGA_R,
                VGA_VS=>VGA_VS);
   
   XLXI_2 : picture
      port map (BALL_X(9 downto 0)=>BALL_X(9 downto 0),
                BALL_Y(8 downto 0)=>BALL_Y(8 downto 0),
                ENABLED_TILES(53 downto 0)=>ENABLED_TILES(53 downto 0),
                PIX_X(9 downto 0)=>XLXN_4(9 downto 0),
                PIX_Y(8 downto 0)=>XLXN_5(8 downto 0),
                PLATFORM_X(9 downto 0)=>PLATFORM_X(9 downto 0),
                RGB(2 downto 0)=>XLXN_2(2 downto 0));
   
end BEHAVIORAL;


