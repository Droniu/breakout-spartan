--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : breakout.vhf
-- /___/   /\     Timestamp : 06/17/2021 22:49:05
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3a -flat -suppress -vhdl C:/szyminson/polibuda/ucisw2/breakout-spartan/breakout.vhf -w C:/szyminson/polibuda/ucisw2/breakout-spartan/breakout.sch
--Design Name: breakout
--Device: spartan3a
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
   port ( CLK_12MHz : in    std_logic; 
          PL_LEFT   : in    std_logic; 
          PL_RIGHT  : in    std_logic; 
          RESET     : in    std_logic; 
          VGA_B     : out   std_logic_vector (2 downto 1); 
          VGA_G     : out   std_logic_vector (2 downto 0); 
          VGA_HS    : out   std_logic; 
          VGA_R     : out   std_logic_vector (2 downto 0); 
          VGA_VS    : out   std_logic);
end breakout;

architecture BEHAVIORAL of breakout is
   attribute BOX_TYPE   : string ;
   signal XLXN_2    : std_logic_vector (2 downto 0);
   signal XLXN_4    : std_logic_vector (9 downto 0);
   signal XLXN_5    : std_logic_vector (8 downto 0);
   signal XLXN_12   : std_logic_vector (53 downto 0);
   signal XLXN_13   : std_logic_vector (9 downto 0);
   signal XLXN_14   : std_logic_vector (8 downto 0);
   signal XLXN_15   : std_logic_vector (9 downto 0);
   signal XLXN_28   : std_logic;
   signal XLXN_36   : std_logic;
   signal XLXN_37   : std_logic;
   signal XLXN_38   : std_logic;
   signal XLXN_49   : std_logic;
   signal XLXN_55   : std_logic;
   signal XLXN_56   : std_logic;
   component driver
      port ( CLK_25MHz : in    std_logic; 
             RGB       : in    std_logic_vector (2 downto 0); 
             VGA_R     : out   std_logic; 
             VGA_G     : out   std_logic; 
             VGA_B     : out   std_logic; 
             VGA_HS    : out   std_logic; 
             VGA_VS    : out   std_logic; 
             PIX_X     : out   std_logic_vector (9 downto 0); 
             PIX_Y     : out   std_logic_vector (8 downto 0); 
             RESET     : in    std_logic);
   end component;
   
   component picture
      port ( PIX_X         : in    std_logic_vector (9 downto 0); 
             PIX_Y         : in    std_logic_vector (8 downto 0); 
             ENABLED_TILES : in    std_logic_vector (53 downto 0); 
             BALL_X        : in    std_logic_vector (9 downto 0); 
             BALL_Y        : in    std_logic_vector (8 downto 0); 
             PLATFORM_X    : in    std_logic_vector (9 downto 0); 
             RGB           : out   std_logic_vector (2 downto 0));
   end component;
   
   component logic
      port ( CLK_25MHz     : in    std_logic; 
             RESET         : in    std_logic; 
             PL_LEFT       : in    std_logic; 
             PL_RIGHT      : in    std_logic; 
             ENABLED_TILES : out   std_logic_vector (53 downto 0); 
             BALL_X        : out   std_logic_vector (9 downto 0); 
             BALL_Y        : out   std_logic_vector (8 downto 0); 
             PLATFORM_X    : out   std_logic_vector (9 downto 0));
   end component;
   
   component color_converter
      port ( VGA_R_IN  : in    std_logic; 
             VGA_G_IN  : in    std_logic; 
             VGA_B_IN  : in    std_logic; 
             VGA_R_OUT : out   std_logic_vector (2 downto 0); 
             VGA_G_OUT : out   std_logic_vector (2 downto 0); 
             VGA_B_OUT : out   std_logic_vector (2 downto 1));
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component vgaclk
      port ( RST_IN          : in    std_logic; 
             CLKIN_IN        : in    std_logic; 
             LOCKED_OUT      : out   std_logic; 
             CLKFX_OUT       : out   std_logic; 
             CLKIN_IBUFG_OUT : out   std_logic; 
             CLK0_OUT        : out   std_logic);
   end component;
   
begin
   XLXI_1 : driver
      port map (CLK_25MHz=>XLXN_28,
                RESET=>XLXN_49,
                RGB(2 downto 0)=>XLXN_2(2 downto 0),
                PIX_X(9 downto 0)=>XLXN_4(9 downto 0),
                PIX_Y(8 downto 0)=>XLXN_5(8 downto 0),
                VGA_B=>XLXN_38,
                VGA_G=>XLXN_37,
                VGA_HS=>VGA_HS,
                VGA_R=>XLXN_36,
                VGA_VS=>VGA_VS);
   
   XLXI_2 : picture
      port map (BALL_X(9 downto 0)=>XLXN_13(9 downto 0),
                BALL_Y(8 downto 0)=>XLXN_14(8 downto 0),
                ENABLED_TILES(53 downto 0)=>XLXN_12(53 downto 0),
                PIX_X(9 downto 0)=>XLXN_4(9 downto 0),
                PIX_Y(8 downto 0)=>XLXN_5(8 downto 0),
                PLATFORM_X(9 downto 0)=>XLXN_15(9 downto 0),
                RGB(2 downto 0)=>XLXN_2(2 downto 0));
   
   XLXI_3 : logic
      port map (CLK_25MHz=>XLXN_28,
                PL_LEFT=>XLXN_55,
                PL_RIGHT=>XLXN_56,
                RESET=>XLXN_49,
                BALL_X(9 downto 0)=>XLXN_13(9 downto 0),
                BALL_Y(8 downto 0)=>XLXN_14(8 downto 0),
                ENABLED_TILES(53 downto 0)=>XLXN_12(53 downto 0),
                PLATFORM_X(9 downto 0)=>XLXN_15(9 downto 0));
   
   XLXI_6 : color_converter
      port map (VGA_B_IN=>XLXN_38,
                VGA_G_IN=>XLXN_37,
                VGA_R_IN=>XLXN_36,
                VGA_B_OUT(2 downto 1)=>VGA_B(2 downto 1),
                VGA_G_OUT(2 downto 0)=>VGA_G(2 downto 0),
                VGA_R_OUT(2 downto 0)=>VGA_R(2 downto 0));
   
   XLXI_7 : INV
      port map (I=>RESET,
                O=>XLXN_49);
   
   XLXI_8 : vgaclk
      port map (CLKIN_IN=>CLK_12MHz,
                RST_IN=>XLXN_49,
                CLKFX_OUT=>XLXN_28,
                CLKIN_IBUFG_OUT=>open,
                CLK0_OUT=>open,
                LOCKED_OUT=>open);
   
   XLXI_9 : INV
      port map (I=>PL_LEFT,
                O=>XLXN_55);
   
   XLXI_10 : INV
      port map (I=>PL_RIGHT,
                O=>XLXN_56);
   
end BEHAVIORAL;


