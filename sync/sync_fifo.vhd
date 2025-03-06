library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sync_fifo is 
	generic (
		f_WIDTH : natural := 100;
		f_DEPTH : natural := 8;
	);
	
	port (
		f_clk : in std_logic;
		f_reset : in std_logic;
		
		-- OCCUPANCY
		
		-- WRITE
		f_write_en : in std_logic;
		f_write_data : in std_logic_vector( f_WIDTH-1 downto 0);
		f_full : out std_logic;
		
		-- READ
		f_read_en : in std_logic;
		f_read_data : in std_logic_vector( f_WIDTH-1 downto 0);
		f_empty : out std_logic;
	);
	
end sync_fifo;
