LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY std;
USE std.textio.all;

LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;

ENTITY vga_vga_sch_tb IS
END vga_vga_sch_tb;
ARCHITECTURE behavioral OF vga_vga_sch_tb IS

  COMPONENT driver
    PORT(
         CLK_50MHz : IN  std_logic;
         RGB : IN  std_logic_vector(2 downto 0);
         VGA_R : OUT  std_logic;
         VGA_G : OUT  std_logic;
         VGA_B : OUT  std_logic;
         VGA_HS : OUT  std_logic;
         VGA_VS : OUT  std_logic;
         PIX_X : OUT  std_logic_vector(9 downto 0);
         PIX_Y : OUT  std_logic_vector(8 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK_50MHz : std_logic;
   signal RGB : std_logic_vector(2 downto 0);

 	--Outputs
   signal VGA_R : std_logic;
   signal VGA_G : std_logic;
   signal VGA_B : std_logic;
   signal VGA_HS : std_logic;
   signal VGA_VS : std_logic;
   signal PIX_X : std_logic_vector(9 downto 0);
   signal PIX_Y : std_logic_vector(8 downto 0);

  constant SIM_FRAMES : positive := 1;           -- frames simulated
  constant BMP_FRAMES : natural  := 1;           -- frames written to BMP files

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

  uut: driver PORT MAP (
          CLK_50MHz => CLK_50MHz,
          RGB => RGB,
          VGA_R => VGA_R,
          VGA_G => VGA_G,
          VGA_B => VGA_B,
          VGA_HS => VGA_HS,
          VGA_VS => VGA_VS,
          PIX_X => PIX_X,
          PIX_Y => PIX_Y
        );

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
  
 tb_sim : process
	 begin
	 RGB <= "011"; -- sta³a CYAN to "011"
	 wait;
	 end process;

END;