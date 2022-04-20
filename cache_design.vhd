library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cache_memory is
	generic (blocksize : integer := 1024);

	port (
		clk    		: in  std_logic;
		writer 		: in  std_logic;
		enter      	: in std_logic_vector (7 downto 0):= (others => '0');
		output	    : out std_logic_vector (7 downto 0):= (others => '0')
    );
end entity;

architecture cache_memory_Arch of cache_memory is
	signal data : std_logic_vector (7 downto 0):= (others => '0');

begin
	arch_process : process (clk, writer, enter)
    begin
        if clk = '1' then
            if writer = '1' then
                data <= enter;
            else
				output <= data; 
            end if;
        else
			output <= (others => '0');
        end if ;
    end process;
end cache_memory_Arch;
