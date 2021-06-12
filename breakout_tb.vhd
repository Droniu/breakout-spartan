LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY std;
USE std.textio.all;

LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;

ENTITY breakout_breakout_sch_tb IS
END breakout_breakout_sch_tb;
ARCHITECTURE behavioral OF breakout_breakout_sch_tb IS 

   COMPONENT breakout
   PORT( CLK_50MHz	:	IN	STD_LOGIC; 
			RESET : IN STD_LOGIC;
          VGA_R	:	OUT	STD_LOGIC; 
          VGA_G	:	OUT	STD_LOGIC; 
          VGA_B	:	OUT	STD_LOGIC; 
          VGA_HS	:	OUT	STD_LOGIC; 
          VGA_VS	:	OUT	STD_LOGIC);
   END COMPONENT;

   SIGNAL CLK_50MHZ	:	STD_LOGIC;
	SIGNAL RESET 	: STD_LOGIC;
   SIGNAL VGA_R	:	STD_LOGIC;
   SIGNAL VGA_G	:	STD_LOGIC;
   SIGNAL VGA_B	:	STD_LOGIC;
   SIGNAL VGA_HS	:	STD_LOGIC;
   SIGNAL VGA_VS	:	STD_LOGIC;
	
	
  --constant ball_x_int : positive := 300;
  --constant ball_y_int : positive := 220;
  --constant platform_x_int : positive := 100;
  --constant tiles : std_logic_vector(53 downto 0) := "100110111110111101110010101101011101110111111011011111";
  --constant tiles : std_logic_vector(53 downto 0) := "111111111111111111111111111111111111111111111111111111";

  constant SIM_FRAMES : positive := 15;           -- frames simulated
  constant BMP_FRAMES : natural  := 15;           -- frames written to BMP files

  constant BMP_FILE   : string := "frame";       -- BMP file name (without extension)

  constant BMP_WIDTH  : positive := 640;
  constant BMP_HEIGHT : positive := 480;

  constant BMP_HEADER_LEN  : positive := 54;
  constant BMP_PALETTE_LEN : positive := 32;

  constant H_TOTAL : positive := 800;
  constant H_BP    : positive := 48;

  constant V_TOTAL : positive := 521;
  constant V_BP    : positive := 29;

  constant FILE_NR_LEN : positive := integer'image(BMP_FRAMES)'length;

  subtype t_pix  is std_logic_vector(2 downto 0);
  subtype t_byte is std_logic_vector(7 downto 0);

  type t_line is array (0 to BMP_WIDTH - 1) of t_pix;
  type t_bmp  is array (0 to BMP_HEIGHT - 1) of t_line;

  type t_bmp_ptr  is access t_bmp;
  type t_bmp_file is file of character;

  type t_bmp_header  is array (0 to BMP_HEADER_LEN - 1) of t_byte;
  type t_bmp_palette is array (0 to BMP_PALETTE_LEN - 1) of t_byte;

  constant BMP_HEADER : t_bmp_header := (
                                     --    Bitmap File Header
    x"42", x"4D",                    -- 00 BMP file identifier            "BM"
    x"56", x"58", x"02", x"00",      -- 02 File size                      153686
    x"00", x"00",                    -- 06 Reserved                       0
    x"00", x"00",                    -- 08 Reserved                       0
    x"56", x"00", x"00", x"00",      -- 10 Data offset                    54 + 32

                                     --    Bitmap Info Header
    x"28", x"00", x"00", x"00",      -- 14 Header size                    40
    x"80", x"02", x"00", x"00",      -- 18 Bitmap width in pixels         640
    x"E0", x"01", x"00", x"00",      -- 22 Bitmap height in pixels        480
    x"01", x"00",                    -- 26 Number of color planes         1
    x"04", x"00",                    -- 28 Number of bits per pixel       4
    x"00", x"00", x"00", x"00",      -- 30 Compression method             0
    x"00", x"00", x"00", x"00",      -- 34 Image size                     0
    x"C4", x"0E", x"00", x"00",      -- 38 Horizontal resolution          3780
    x"C4", x"0E", x"00", x"00",      -- 42 Vertical resolution            3780
    x"08", x"00", x"00", x"00",      -- 46 Number of colors in palette    8
    x"00", x"00", x"00", x"00" );    -- 50 Number of important colors     0

  constant BMP_PALETTE : t_bmp_palette := (
                                     --    Color Palette   B G R 0
    x"00", x"00", x"00", x"00",      -- 54 Color 0 - Black
    x"FF", x"00", x"00", x"00",      -- 58 Color 1 - Blue
    x"00", x"FF", x"00", x"00",      -- 62 Color 2 - Green
    x"FF", x"FF", x"00", x"00",      -- 66 Color 3 - Cyan
    x"00", x"00", x"FF", x"00",      -- 70 Color 4 - Red
    x"FF", x"00", x"FF", x"00",      -- 74 Color 5 - Magenta
    x"00", x"FF", x"FF", x"00",      -- 78 Color 6 - Yellow
    x"FF", x"FF", x"FF", x"00" );    -- 82 Color 7 - White

  constant CLK_50MHZ_PERIOD : time := 20 ns;

  constant CLOCKS_LINE  : positive := 2 * H_TOTAL;
  constant CLOCKS_FRAME : positive := V_TOTAL * CLOCKS_LINE;
  constant SIM_CLOCKS   : positive := SIM_FRAMES * CLOCKS_FRAME;

--------------------------------------------------------------------------------
-- Convert byte to character
--------------------------------------------------------------------------------
function bmp_byte_to_char(constant byte : t_byte) return character is
  begin
    return(character'val(to_integer(unsigned(byte))));
  end bmp_byte_to_char;

--------------------------------------------------------------------------------
-- Save data from bmp_ptr to file
--------------------------------------------------------------------------------
procedure bmp_save(bmp_ptr : inout t_bmp_ptr; file_name : in string) is
  file fp : t_bmp_file open write_mode is file_name;
  variable x : integer range 0 to BMP_WIDTH;
  variable pack : t_byte;

  begin
    for i in BMP_HEADER'range loop                    -- write bmp_header
      write(fp, bmp_byte_to_char(BMP_HEADER(i)));
    end loop;

    for i in BMP_PALETTE'range loop                   -- write bmp_palette
      write(fp, bmp_byte_to_char(BMP_PALETTE(i)));
    end loop;

    for y in BMP_HEIGHT - 1 downto 0 loop             -- write image data
      x := 0;
      while x < BMP_WIDTH loop
        pack(7 downto 4) := '0' & bmp_ptr(y)(x);
        pack(3 downto 0) := '0' & bmp_ptr(y)(x + 1);
        write(fp, bmp_byte_to_char(pack));
        x := x + 2;
      end loop;
    end loop;

  end bmp_save;

--------------------------------------------------------------------------------
-- Skip n clocks
--------------------------------------------------------------------------------
procedure skip_clocks(constant n : positive) is
  begin
    for i in 1 to n loop
      wait until rising_edge(CLK_50MHZ);
    end loop;
  end skip_clocks;

--------------------------------------------------------------------------------
-- Skip one sync pulse on selected sync_line
--------------------------------------------------------------------------------
procedure skip_sync(signal sync_line : in std_logic) is
  begin
    if sync_line = '1' then
      wait until falling_edge(sync_line);
    end if;

    wait until rising_edge(sync_line);
  end procedure skip_sync;

--------------------------------------------------------------------------------
-- Write text + time with specified unit
--------------------------------------------------------------------------------
procedure write_time(txt : in string; t : in time; unit : in time) is
  variable L : line;

  begin
    write(L, txt & ": ");
    write(L, t, UNIT => unit);
    writeline(output, L);
  end procedure write_time;
--------------------------------------------------------------------------------

BEGIN

  UUT: breakout PORT MAP(
       CLK_50MHz => CLK_50MHZ,
		 RESET => RESET,
       VGA_R     => VGA_R,
       VGA_G     => VGA_G,
       VGA_B     => VGA_B,
       VGA_HS    => VGA_HS,
       VGA_VS    => VGA_VS );

--------------------------------------------------------------------------------
-- Clock generator
--------------------------------------------------------------------------------
tb_clk : process
  begin
    CLK_50MHZ <= '0';
    wait for CLK_50MHZ_PERIOD / 2;

    for i in 1 to SIM_CLOCKS loop
      CLK_50MHZ <= '0';
      wait for CLK_50MHZ_PERIOD / 2;
      CLK_50MHZ <= '1';
      wait for CLK_50MHZ_PERIOD / 2;
    end loop;

    wait;
  end process;

--------------------------------------------------------------------------------
-- Horizontal sync pulse monitor
--------------------------------------------------------------------------------
tb_hs : process
  variable start : time := now;

  begin
	 skip_clocks(5);
  
    wait for CLK_50MHZ_PERIOD;

    if VGA_HS = '1' then
      wait until falling_edge(VGA_HS);
      start := now;
    end if;

    wait until rising_edge(VGA_HS);
    write_time("HS Pulse Width", now - start, us);

    wait until falling_edge(VGA_HS);
    write_time("HS Period", now - start, us);

    wait;
  end process;

--------------------------------------------------------------------------------
-- Vertical sync pulse monitor
--------------------------------------------------------------------------------
tb_vs : process
  variable start : time := now;

  begin
	 skip_clocks(5);
    wait for CLK_50MHZ_PERIOD;

    if VGA_VS = '1' then
      wait until falling_edge(VGA_VS);
      start := now;
    end if;

    wait until rising_edge(VGA_VS);
    write_time("VS Pulse Width", now - start, us);

    wait until falling_edge(VGA_VS);
    write_time("VS Period", now - start, ms);

    wait;
  end process;

--------------------------------------------------------------------------------
-- Main testbench process
--------------------------------------------------------------------------------
tb_bmp : process
  variable bmp_ptr : t_bmp_ptr;
  variable file_nr : string(FILE_NR_LEN downto 1);

  begin
	 RESET <= '1';
	 skip_clocks(5);
	 RESET <= '0';
  
    wait for CLK_50MHZ_PERIOD;

    bmp_ptr := new t_bmp;

    for frame in 1 to BMP_FRAMES loop

      skip_sync(VGA_VS);

      for i in 1 to V_BP loop
        skip_sync(VGA_HS);
      end loop;

      for y in 0 to BMP_HEIGHT - 1 loop

        skip_sync(VGA_HS);
        skip_clocks(2 * H_BP);

        for x in 0 to BMP_WIDTH - 1 loop
          skip_clocks(2);
          bmp_ptr(y)(x) := VGA_R & VGA_G & VGA_B;
        end loop;

      end loop;

      if BMP_FRAMES > 1 then
        file_nr := (others => '0');
        file_nr(integer'image(frame)'length downto 1) := integer'image(frame);
        bmp_save(bmp_ptr, BMP_FILE & "_" & file_nr & ".bmp");
      else
        bmp_save(bmp_ptr, BMP_FILE & ".bmp");
      end if;

    end loop;
    wait;
  end process;

END;
