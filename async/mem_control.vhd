library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_TEXTIO.ALL;
library std;
use std.textio.all;

entity mem_control is
generic (
	f_DATA_WIDTH 	 : natural := 8;
	f_ADDRESS_WIDTH : natural := 5
);

port(
	wclk 	 		: in 	std_logic;				
	rclk 			: in 	std_logic;
	write_en		: in 	std_logic;
	read_en 		: in 	std_logic;
	raddr			: in 	std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0);
	waddr			: in 	std_logic_vector((f_ADDRESS_WIDTH - 1) downto 0);
	data_in		: in  std_logic_vector((f_DATA_WIDTH - 1) downto 0);
	data_out 	: out	std_logic_vector((f_DATA_WIDTH - 1) downto 0)
);

end mem_control;


architecture mem of mem_control is
	type 	 t_Memory is array (0 to 2**(f_ADDRESS_WIDTH-1)-1)
						 of std_logic_vector((f_DATA_WIDTH-1) downto 0);
	
	signal Mem : t_Memory;
	file output_file : text open write_mode is "output.txt";

begin
	
	data_out <= Mem(to_integer(unsigned(raddr(f_ADDRESS_WIDTH-2 downto 0)))) 
				when read_en = '1' else (others => 'X');
	
	mem_write : process(wclk)
	variable line_var : line;
	begin
		if(rising_edge(wclk)) then
			if(write_en = '1') then
				Mem(to_integer(unsigned(waddr(f_ADDRESS_WIDTH-2 downto 0)))) <= data_in;
				
				 -- Print the address and value
            write(line_var, string'("Addr: "));
            write(line_var, to_integer(unsigned(waddr(f_ADDRESS_WIDTH-2 downto 0))));
            write(line_var, string'(" | Value: "));
            write(line_var, to_integer(unsigned(data_in)));
            writeline(output, line_var);  -- Print to console
			
			end if;
		end if;
		
	end process;

end mem;