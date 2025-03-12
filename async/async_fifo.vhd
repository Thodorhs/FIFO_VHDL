library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package pkg is
  type dbg_mem is array (0 to 15) of std_logic_vector(7 downto 0);
end package;

package body pkg is
end package body;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.pkg.all;


entity async_fifo is
 generic (
	f_DATA_WIDTH : natural := 8;
	f_ADDRESS_WIDTH : natural := 5
 );
	
 port (
	reset : in std_logic;
	wclk : in std_logic;
	rclk : in std_logic;

	-- OCCUPANCY
	fifo_occu_in 	: out std_logic_vector(f_ADDRESS_WIDTH-1 downto 0);
	fifo_occu_out 	: out std_logic_vector(f_ADDRESS_WIDTH-1 downto 0);

	-- WRITE
	write_enable 	: in std_logic;
	write_data_in 	: in std_logic_vector(f_DATA_WIDTH-1 downto 0);

	-- READ
	read_enable   	: in std_logic;
	read_data_out 	: out std_logic_vector(f_DATA_WIDTH-1 downto 0);
	
	full				: out std_logic;
	empty				: out std_logic
 );
end async_fifo;


architecture ar of async_fifo is
	signal wptr_sync      : std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0);
	signal rptr_sync      : std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0);
	signal wptr           : std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0);
	signal rptr           : std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0); 
	signal waddr          : std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0); -- address to go in mem
	signal raddr          : std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0); -- address to go in mem
	signal w_en           : std_logic;
	signal r_en           : std_logic;
	signal f 				 : std_logic ;
	signal e					 : std_logic ;
	signal mem_dbg 		: dbg_mem := (others => (others => '0'));
	
	component fifo_control is
		generic (
			  f_DATA_WIDTH : natural := 8;
			  f_ADDRESS_WIDTH : natural := 5;
			  is_write_control : boolean := true
		 );
		port( clk          : in  std_logic;
				reset        : in  std_logic;
				enable       : in  std_logic;
				sync_pointer : in  std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0);
				pointer      : out std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0);
				fifo_occu    : out std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0);
				full_empty   : buffer std_logic;
				addr_mem     : out std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0);
				w_r_en       : out std_logic);
	end component;
	
	component mem_control is
		port ( wclk 	 		: in 	std_logic;
				 rclk 			: in 	std_logic;
				 reset			: in  std_logic;
				 write_en		: in 	std_logic;
				 read_en 		: in 	std_logic;
				 raddr			: in 	std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0);
				 waddr			: in 	std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0);
				 data_in			: in	std_logic_vector((f_DATA_WIDTH - 1) downto 0);
				 data_out 		: out	std_logic_vector((f_DATA_WIDTH - 1) downto 0));
	end component;
	
	
	component fifo_sync is
		port( clk		: in std_logic;
				reset		: in std_logic;
				ptr		: in std_logic_vector(f_ADDRESS_WIDTH - 1 downto 0);
				sync_ptr : buffer std_logic_vector(f_ADDRESS_WIDTH - 1 downto 0));
	end component;
	
	
	begin
	process(rclk)
	begin
	if(reset = '1') then
		empty <= '0';
	elsif (rising_edge(rclk)) then
		empty <= e;
	end if;
	
	end process;
	
	process(wclk)
	begin
		if(reset = '1') then
		full <= '0';
	elsif (rising_edge(wclk)) then
		full <= f;
	end if;
	end process;
	
	mem_ctrl : mem_control
	port map (	wclk 		=> wclk,
					rclk 		=> rclk,
					reset    => reset,
					write_en => w_en,
					read_en  => r_en,
					raddr    => raddr,
					waddr		=> waddr,
					data_in  => write_data_in,
					data_out => read_data_out
					);
	
	
	-- map write control ports
	write_control : fifo_control
	generic map (
    f_DATA_WIDTH => f_DATA_WIDTH,
    f_ADDRESS_WIDTH => f_ADDRESS_WIDTH,
    is_write_control => true
	)
	port map( clk => wclk,
				 reset => reset,
				 enable => write_enable,
				 sync_pointer => rptr_sync,
				 pointer => wptr,
				 fifo_occu => fifo_occu_in,
				 full_empty => f,
				 addr_mem => waddr,
				 w_r_en => w_en);
				 
	-- map read control ports
	read_control : fifo_control
	generic map (
    f_DATA_WIDTH => f_DATA_WIDTH,
    f_ADDRESS_WIDTH => f_ADDRESS_WIDTH,
    is_write_control => false
	)
	port map( clk => rclk,
				 reset => reset,
				 enable => read_enable,
				 sync_pointer => wptr_sync,
				 pointer => rptr,
				 fifo_occu => fifo_occu_out,
				 full_empty => e,
				 addr_mem => raddr,
				 w_r_en => r_en);
				 
	read_sync : fifo_sync
	port map( clk => rclk,
				 reset => reset,
				 ptr  => wptr,
				 sync_ptr => wptr_sync);
	
	write_sync : fifo_sync
	port map( clk => wclk,
				 reset => reset,
				 ptr  => rptr,
				 sync_ptr => rptr_sync);
end ar;
