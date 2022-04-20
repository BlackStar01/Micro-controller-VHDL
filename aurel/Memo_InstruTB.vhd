-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity instruction_memo_TB is 
end instruction_memo_TB;

architecture instruction_memo_ArchTB of instruction_memo_TB is


      component instruction_memo is
      
        port(	
          clk   : in std_logic;
          reset	: in std_logic;	
          sel_fct: out std_logic_vector(3 downto 0);
          sel_route: out std_logic_vector(3 downto 0);
          sel_out: out std_logic_vector(1 downto 0)
        );
      end  component;

    constant PERIOD : time := 100 us ;
   
   	signal clk_sim, reset_sim : std_logic := '0';
    signal sel_out_sim : std_logic_vector(1 downto 0) := (others => '0');  
	signal sel_fct_sim, sel_route_sim : std_logic_vector (3 downto 0) := (others => '0');
     
begin

	  instruction_memo_underTest : instruction_memo

      port map (
			clk => clk_sim,
            reset => reset_sim,
            sel_out => sel_out_sim,
            sel_fct => sel_fct_sim,
            sel_route => sel_route_sim
      );
      
      
      MyStimulus_Proc : process
      
      begin
        clk_sim <= '1';      
      	wait for PERIOD;
          report " Fonction = " & integer'image(to_integer(unsigned(sel_fct_sim)));
        
        clk_sim <= '0';
		wait for PERIOD;
          report " Fonction = " & integer'image(to_integer(unsigned(sel_fct_sim)));
        clk_sim <= '1';      
      	wait for PERIOD;
          report " Fonction = " & integer'image(to_integer(unsigned(sel_fct_sim)));
        
        clk_sim <= '0';
		wait for PERIOD;
          report " Fonction = " & integer'image(to_integer(unsigned(sel_fct_sim)));
        clk_sim <= '1';      
      	wait for PERIOD;
          report " Fonction = " & integer'image(to_integer(unsigned(sel_fct_sim)));
        
        clk_sim <= '0';
		wait for PERIOD;
          report " Fonction = " & integer'image(to_integer(unsigned(sel_fct_sim)));
        
        
        wait;
      end process ;
      
      
      
    
end instruction_memo_ArchTB;