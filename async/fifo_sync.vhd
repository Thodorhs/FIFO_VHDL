library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity fifo_sync is
 generic (
	f_DATA_WIDTH 	 : natural := 8;
	f_ADDRESS_WIDTH : natural := 5
 );
	
 port (
	clk 			: in std_logic;
	reset			: in std_logic;
	ptr 			: in std_logic_vector(f_ADDRESS_WIDTH-1 downto 0);
	sync_ptr 	: buffer std_logic_vector(f_ADDRESS_WIDTH-1 downto 0) := (others => '0')
 );
end fifo_sync;


architecture ar of fifo_sync is
	signal binary_to_gray : std_logic_vector(f_ADDRESS_WIDTH-1 downto 0) := (others => '0');
	signal ff_1				 : std_logic_vector(f_ADDRESS_WIDTH-1 downto 0);
	signal ff_2				 : std_logic_vector(f_ADDRESS_WIDTH-1 downto 0);
begin

	gen_b2g : for i in 0 to f_ADDRESS_WIDTH-2 generate
		binary_to_gray(i) <= ptr(i) xor ptr(i+1);
	end generate;
	
	sync_ptr(f_ADDRESS_WIDTH-1) <= ff_2(f_ADDRESS_WIDTH-1);
	gen_g2b : for i in f_ADDRESS_WIDTH-2 downto 0 generate
		sync_ptr(i) <= sync_ptr(i+1) xor ff_2(i);
	end generate;
	
	process(clk,reset)
	begin
		if(reset = '1') then
			ff_1 <= (others => '0');
		elsif (rising_edge(clk)) then
			ff_1 <= binary_to_gray;
		end if;
	end process;
	
	process(clk,reset)
	begin
		if(reset = '1') then
			ff_2 <= (others => '0');
		elsif (rising_edge(clk)) then
			ff_2 <= ff_1;
		end if;
	end process;
	
	
end ar;