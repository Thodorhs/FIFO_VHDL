library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fifo_control is
	generic (
		f_DATA_WIDTH : natural := 10;
		f_ADDRESS_WIDTH : natural := 5
	 );
    port(clk          : in  std_logic;
         reset        : in  std_logic;
         enable       : in  std_logic;
         sync_pointer : in  std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0);
         pointer      : out std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0);
         fifo_occu    : out std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0);
         full_empty   : out std_logic;
         addr_mem     : buffer std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0);
         w_r_en       : out std_logic);
  end fifo_control;
  
architecture arch of fifo_control is
  begin
  -- compute occupancy
	fifo_occu <= std_logic_vector(unsigned(addr_mem) - unsigned(sync_pointer));
	
	-- process to calculate empty or full
	process(sync_pointer)
		begin
		 if sync_pointer(f_ADDRESS_WIDTH - 1) = addr_mem(f_ADDRESS_WIDTH - 1) then
			full_empty <= '1';
		 else
			full_empty <= '0';
		 end if;
  end process;
  
  -- process to compute on rising clock edge
  
  process(reset, clk)
	begin
		if reset = '1' then 
			addr_mem   <= (others => '0');
			w_r_en    <= '0';
		elsif rising_edge(clk) then
			if enable = '1' then
				w_r_en <= '1';
				addr_mem <= std_logic_vector(unsigned(addr_mem) + 1);
			end if;
		end if;
	end process;
end arch;