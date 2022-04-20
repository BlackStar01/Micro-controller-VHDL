library ieee; 
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.pro_types.all; 
  
entity InstructionMemory is 
port(	
    clk   : in std_logic;
	reset	: in std_logic;	
	sel_fct: out std_logic_vector(3 downto 0);
    sel_route: out std_logic_vector(3 downto 0);
    sel_out: out std_logic_vector(1 downto 0)
);
end entity; 
  
architecture im_Arch of InstructionMemory is 

    type ROM_Array is array (0 to 127) of std_logic_vector(3 downto 0);
    
    constant MEMORY: ROM_Array := (
        0 => "0001",		 
        1 => "0010",		
        2 => "0011",		
        3 => "0101",       		
        4 => "0110",		
        5 => "0111",
        6 => "1000",
        7 => "1001",
        8 => "1010",
        9 => "1011",
        10 => "1110",
        11 => "1111",
            
	    OTHERS => "0000"
	);       
    
    constant limit : integer := 4;

begin
    process(clk, reset) is 
    	variable index : integer := 0;
    begin
        if (clk = '1') then
        	sel_fct <= MEMORY(index);
            if index = limit then
            	index := 0;
            else
        		index := index + 1 ;
            end if;
        end if ;
    end process;
end im_Arch;
