library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
entity async_fifo_tb is
end async_fifo_tb;


architecture tb of async_fifo_tb is
	signal wclk 		: std_logic:='0';
	signal rclk 		: std_Logic:='0';
	signal reset		: std_logic:='0';
	signal data_in 	: std_logic_vector(7 downto 0);
	signal data_out 	: std_logic_vector(7 downto 0);
	signal occu_in  	: std_logic_vector(4 downto 0);
	signal occu_out	: std_logic_vector(4 downto 0);
	signal w_en 		: std_logic;
	signal r_en 		: std_logic;
	constant CLOCK_PERIOD 		: time := 5 ns;
begin
	wclk <= not wclk after CLOCK_PERIOD;
	rclk <= not rclk after 10 ns;
	reset <= '1', '0' after  20 ns;
	
	dut : entity work.async_fifo
		port map (
			reset => reset,
			wclk  => wclk,
			rclk  => rclk,
			fifo_occu_in => occu_in,
			fifo_occu_out=> occu_out,
			write_enable => w_en,
			write_data_in => data_in,
			read_enable   => r_en,
			read_data_out => data_out);
	
	stimulus:
	process 
	 variable i : integer := 0;
	 variable line_var : line;
	 file output_file : text open write_mode is "tb_out.txt";

	begin
		
		wait until (reset = '0');
		
		while( i < 20 ) loop
			data_in <= std_logic_vector(to_unsigned(i, data_in'length));
			w_en    <= '1'; 
			wait for CLOCK_PERIOD;
			wait for CLOCK_PERIOD;
			i := i + 1;
		end loop;
		
		
		wait until rising_edge(wclk);
		assert false report "End of simulation" severity failure;
		wait;
	end process stimulus;
	

end tb;