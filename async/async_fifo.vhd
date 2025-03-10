library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity async_fifo is
 generic (
	f_DATA_WIDTH : natural := 10;
	f_ADDRESS_WIDTH : natural := 5
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
	signal wptr_sync      : std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0);
	signal rptr_sync      : std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0);
	signal wptr           : std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0);
	signal rptr           : std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0); 
	signal waddr          : std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0); -- address to go in mem
	signal raddr          : std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0); -- address to go in mem
	signal full           : std_logic;
	signal empty          : std_logic;
	signal w_en           : std_logic;
	signal r_en           : std_logic;
	
	
	component fifo_control is
		port( clk          : in  std_logic;
				reset        : in  std_logic;
				enable       : in  std_logic;
				sync_pointer : in  std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0);
				pointer      : out std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0);
				fifo_occu    : out std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0);
				full_empty   : out std_logic;
				addr_mem     : out std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0);
				w_r_en       : out std_logic);
	end component;
	
	begin
	-- map write control ports
	write_control : fifo_control
	port map( clk => wclk,
				 reset => reset,
				 enable => write_enable,
				 sync_pointer => rptr_sync,
				 pointer => wptr,
				 fifo_occu => fifo_occu_in,
				 full_empty => full,
				 addr_mem => waddr,
				 w_r_en => w_en);
				 
	-- map read control ports
	read_control : fifo_control
	port map( clk => rclk,
				 reset => reset,
				 enable => read_enable,
				 sync_pointer => wptr_sync,
				 pointer => rptr,
				 fifo_occu => fifo_occu_out,
				 full_empty => empty,
				 addr_mem => raddr,
				 w_r_en => r_en);

	end ar;
