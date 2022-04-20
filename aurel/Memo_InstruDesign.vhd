-- Code your design here
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;		 
use ieee.std_logic_unsigned.all;

entity instruction_memo is
port(	
    clk   : in std_logic;
	reset	: in std_logic;	
	sel_fct: out std_logic_vector(3 downto 0);
    sel_route: out std_logic_vector(3 downto 0);
    sel_out: out std_logic_vector(1 downto 0)
);
end instruction_memo;

--------------------------------------------------------------

architecture instruction_memo_Arch of instruction_memo is

    type ROM_Array is array (0 to 127) of std_logic_vector(3 downto 0);

    constant MEMORY: ROM_Array := (
        0 => "0001",		 
        1 => "0010",		
        2 => "0101",		
        3 => "0100",       		
        4 => "0101",		
        5 => "0110",       	
	    OTHERS => "0000"
	);       
    
    constant limit : integer := 4;
    

begin
    process(clk, reset) is 
    	variable pointer : integer := 0;
    begin
        if (clk = '1') then
        	sel_fct <= MEMORY(pointer);
            if pointer = limit then
            	pointer := 0;
            else
        		pointer := pointer + 1 ;
            end if;
        end if ;
    end process;
end instruction_memo_Arch;

--------------------------------------------------------------
