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
	signal full			: std_logic;
	signal empty		: std_logic;
	signal w_en 		: std_logic;
	signal r_en 		: std_logic;
	constant WCLOCK_PERIOD 		: time := 100 ns;
	constant RCLOCK_PERIOD 		: time := 50 ns;
	
	

	
begin
	wclk <= not wclk after WCLOCK_PERIOD;
	rclk <= not rclk after RCLOCK_PERIOD;
	reset <= '1', '0' after  150 ns;
	
	dut : entity work.async_fifo
		port map (
			reset => reset,
			wclk  => wclk,
			rclk  => rclk,
			fifo_occu_in => occu_in,
			fifo_occu_out=> occu_out,
			full => full,
			empty => empty,
			write_enable => w_en,
			write_data_in => data_in,
			read_enable   => r_en,
			read_data_out => data_out);
	
	stimulus:
	process 
	 variable i : integer := 0;
	 variable line_var : line;
	 file output_file : text open write_mode is "tb_out.txt";
	 variable data : std_logic_vector(7 downto 0);
	  	
		procedure do_write (data : std_logic_vector(7 downto 0)) is
		begin
			
			w_en <= '1';
			data_in <= data;
			wait for WCLOCK_PERIOD;
			wait for WCLOCK_PERIOD;
			w_en <='0';
		end do_write;
	
		procedure do_nwrites(
		n : integer; 
		data : std_logic_vector(7 downto 0)) is
		variable i : integer := 0;
		variable line_var : line;
		variable temp :  std_logic_vector(7 downto 0);
		begin
			temp := data;
			while( i < n ) loop
					
					w_en <='1';
					data_in <= temp;
					wait for WCLOCK_PERIOD;
					wait for WCLOCK_PERIOD;
					i := i + 1;
					
					temp := std_logic_vector(unsigned(temp) + 1);
				
			end loop;
			w_en <= '0';
		end do_nwrites;
	
		procedure do_read is
		begin
			wait until (empty = '0');
			r_en <= '1';
			wait for RCLocK_PERIOD;
			wait for RCLocK_PERIOD;	
			 write(line_var, string'("Data read: "));
          write(line_var, to_integer(unsigned(data_out)));
          writeline(output, line_var);  
			r_en <= '0';	
		end do_read;
		
		procedure do_nreads(n : integer) is
		variable i : integer := 0;
		begin
			while(i < n) loop
				
				r_en <= '1';
				wait for RCLOCK_PERIOD;
				wait for RCLOCK_PERIOD;
				write(line_var, string'("Data read: "));
				write(line_var, to_integer(unsigned(data_out)));
				writeline(output, line_var); 
				i := i +1;
				--r_en <= '0';
			end loop;
			r_en <='0';
		end do_nreads;
	  
	begin
		wait until reset = '0';

		data := X"00";
		do_nwrites(20,data);
		do_nreads(20);
		data := X"10";
		do_write(data);
		data := X"20";
		do_write(data);
		wait until (empty = '0');
		do_nreads(2);
		
		assert false report "End of simulation" severity failure;
		wait;
	end process stimulus;
	

	
end tb;