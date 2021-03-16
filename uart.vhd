library ieee;
use ieee.std_logic_1164.all;

entity uart is

	port(
		clk		 : in	std_logic;
		r_w	 : in	std_logic;
		int_out	 : out	std_logic;
		uart_bufferin	 : in std_logic_vector(7 downto 0);
		uart_bufferout	 : out std_logic_vector(7 downto 0);
		tx	 : out	std_logic;
		rx	 : in	std_logic
		
	);

end entity;

architecture rtl of uart is


	-- Build an enumerated type for the state machine
	type state_type is (rw,bit1,bit2,bit3,bit4,bit5,bit6,bit7,bit8,int);

	-- Register to hold the current state
	signal state   : state_type;
 
begin

	-- Logic to advance to the next state
	process (clk)
	begin
		if (rising_edge(clk)) then
		
			case state is
				when rw=>
					state <= bit1;
					if (r_w='1') then 
					tx <= uart_bufferin(0);
					else
					uart_bufferout(0) <= rx;
					end if;
					
					when bit1=>
					state <= bit2;
					if (r_w='1') then 
					tx <= uart_bufferin(1);
					else
					uart_bufferout(1) <= rx;
					end if;
				
					when bit2=>
					state <= bit3;
					if (r_w='1') then 
					tx <= uart_bufferin(2);
					else
					uart_bufferout(2) <= rx;
					end if;
					
					when bit3=>
					state <= bit4;
					if (r_w='1') then 
					tx <= uart_bufferin(3);
					else
					uart_bufferout(3) <= rx;
					end if;
				
					when bit4=>
					state <= bit5;
					if (r_w='1') then 
					tx <= uart_bufferin(4);
					else
					uart_bufferout(4) <= rx;
					end if;
					
					when bit5=>
					state <= bit6;
					if (r_w='1') then 
					tx <= uart_bufferin(5);
					else
					uart_bufferout(5) <= rx;
					end if;
					
					when bit6=>
					state <= bit7;
					if (r_w='1') then 
					tx <= uart_bufferin(6);
					else
					uart_bufferout(6) <= rx;
					end if;
					
					when bit7=>
					state <= bit8;
					if (r_w='1') then 
					tx <= uart_bufferin(7);
					else
					uart_bufferout(7) <= rx;
					end if;
					
					when bit8=>
					state <= int;
					
					when int=>
					state <= rw;
					
			end case;
		
		end if;
		
		
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when  rw=>
				int_out <= '0';
			when bit1 =>
				int_out <= '0';
			when bit2 =>
				int_out <= '0';
			when bit3 =>
				int_out <= '0';
			when bit4 =>
				int_out <= '0';
			when bit5 =>
				int_out <= '0';
			when bit6 =>
				int_out <= '0';
			when bit7 =>
				int_out <= '0';
			when bit8 =>
				int_out <= '0';
			when int =>
				int_out <= '1';

		end case;
	end process;
	
	
end rtl;

