library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity cache_memory_testbench is 
end cache_memory_testbench;

architecture cache_memory_testbench_arch of cache_memory_testbench is

    component cache_memory is
      
      port (
          clk    : in std_logic;
          writer : in std_logic;
          enter      : in std_logic_vector (7 downto 0):= (others => '0');
          output      : out std_logic_vector (7 downto 0):= (others => '0')
      );
    end component;

    constant PERIOD : time := 100 us ;
   
   	signal clk_sim, writer_sim : std_logic := '0'; 
	  signal output_sim, enter_sim : std_logic_vector (7 downto 0) := (others => '0');
     
  begin

	  Cache_underTest : cache_memory

      port map (
			  clk => clk_sim,
        writer => writer_sim,
        output => output_sim,
        enter => enter_sim
      );
      
      MyStimulus_Proc : process
  
      begin
          clk_sim <= '1';
          writer_sim <= '1';
          enter_sim <= "00000100";      
        wait for PERIOD;
          report  " Write = " & std_logic'image(writer_sim) & " Enter = " & integer'image(to_integer(unsigned(enter_sim))) & " Output = " & integer'image(to_integer(unsigned(output_sim)));
            
          clk_sim <= '0';
          writer_sim <= '0';
        wait for PERIOD;
          report  " W rite= " & std_logic'image(writer_sim) & " Enter = " & integer'image(to_integer(unsigned(enter_sim))) & " Output = " & integer'image(to_integer(unsigned(output_sim)));
            
          clk_sim <= '1';
          writer_sim <= '0';       
        wait for PERIOD;
          report  " Write = " & std_logic'image(writer_sim) & " Enter = " & integer'image(to_integer(unsigned(enter_sim))) & " Output = " & integer'image(to_integer(unsigned(output_sim)));
            
          clk_sim <= '0';
        wait for PERIOD;
          report  " Write = " & std_logic'image(writer_sim) & " Enter = " & integer'image(to_integer(unsigned(enter_sim))) & " Output = " & integer'image(to_integer(unsigned(output_sim)));
        wait;
      end process ;
        
  end cache_memory_testbench_arch;