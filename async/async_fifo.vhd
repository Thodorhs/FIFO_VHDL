library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity async_fifo is
 generic (
	f_DATA_WIDTH : natural := 10;
	f_ADDRESS_WIDTH : natural := 5;
 );
	
 port (
	reset : in std_logic;
	wclk : in std_logic;
	rclk : in std_logic;

	-- OCCUPANCY
	fifo_occu_in : out std_logic_vector(4 downto 0);
	fifo_occu_out : out std_logic_vector(4 downto 0);

	-- WRITE
	write_enable : in std_logic;
	write_data_in : in std_logic_vector(7 downto 0);

	-- READ
	read_enable : in std_logic;
	read_data_out : out std_logic_vector(7 downto 0)
 );
end async_fifo;


architecture ar of async_fifo is


end ar;
