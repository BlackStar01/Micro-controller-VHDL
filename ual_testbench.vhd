-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity myUALtestbench is 
end myUALtestbench;

architecture UAL_TB_Arch of myUALtestbench is

      component ual is
      
      port (
          a: in std_logic_vector (3 downto 0);
          b : in std_logic_vector (3 downto 0);
          SR_IN : in std_logic_vector (1 downto 0);
          sel_fct : in std_logic_vector (3 downto 0);
          SR_OUT : out std_logic_vector (1 downto 0);
          S : out std_logic_vector (7 downto 0)
      );
      
      end  component;

   
      signal a_sim, b_sim, sel_fct_sim : std_logic_vector (3 downto 0) := (others => '0');
      signal SR_OUT_sim, SR_IN_sim : std_logic_vector (1 downto 0) := (others => '0');
      signal s_sim : std_logic_vector (7 downto 0) := (others => '0');
      
begin

	My_UAL_underTest : ual

      port map (
      	a => a_sim ,
            b => b_sim,
            sel_fct => sel_fct_sim, 
            SR_IN => SR_IN_sim,
      	SR_OUT => SR_OUT_sim,
      	S => s_sim 
      );
      
      MyStimulus_Proc : process
      begin
      
      	sel_fct_sim <= "0101";
        a_sim <= "0000";
        b_sim <= "0011";
      	report " A :" & integer'image(to_integer(unsigned(a_sim))) & " B :"& integer'image(to_integer(unsigned(b_sim))) &"|| S :" & integer'image(to_integer(unsigned(s_sim)));
		wait ; 
      end process ;
      
      
end UAL_TB_Arch;