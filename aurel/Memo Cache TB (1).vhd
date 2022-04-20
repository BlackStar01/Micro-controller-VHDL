-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity Cache_TB is 
end Cache_TB;

architecture Cache_ArchTB of Cache_TB is


    component Cache is
      
      port (
          clk    : in  std_logic;
          w : in  std_logic;
          e      : in std_logic_vector (7 downto 0):= (others => '0');
          s      : out std_logic_vector (7 downto 0):= (others => '0')
      );
    end  component;

    constant PERIOD : time := 100 us ;
   
   	signal clk_sim, w_sim : std_logic := '0'; 
	  signal s_sim, e_sim : std_logic_vector (7 downto 0) := (others => '0');
     
  begin

	  Cache_underTest : Cache

      port map (
			  clk => clk_sim,
        w => w_sim,
        s => s_sim,
        e => e_sim
      );
      
      
      MyStimulus_Proc : process
      
      begin
          clk_sim <= '1';
          w_sim <= '1';
          e_sim <= "00000100";      
        wait for PERIOD;
          report  " W = " & std_logic'image(w_sim) & " E = " & integer'image(to_integer(unsigned(e_sim))) & " S = " & integer'image(to_integer(unsigned(s_sim)));
            
          clk_sim <= '0';
          w_sim <= '0';
        wait for PERIOD;
          report  " W = " & std_logic'image(w_sim) & " E = " & integer'image(to_integer(unsigned(e_sim))) & " S = " & integer'image(to_integer(unsigned(s_sim)));
            
          clk_sim <= '1';
          w_sim <= '0';       
        wait for PERIOD;
          report  " W = " & std_logic'image(w_sim) & " E = " & integer'image(to_integer(unsigned(e_sim))) & " S = " & integer'image(to_integer(unsigned(s_sim)));
            
            
          clk_sim <= '0';
        wait for PERIOD;
          report  " W = " & std_logic'image(w_sim) & " E = " & integer'image(to_integer(unsigned(e_sim))) & " S = " & integer'image(to_integer(unsigned(s_sim)));
        wait;
      end process ;
        
  end Cache_ArchTB;