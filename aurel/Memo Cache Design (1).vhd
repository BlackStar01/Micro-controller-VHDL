-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;


entity Cache is

  port (
      clk    : in  std_logic;
      w : in  std_logic;
      e      : in std_logic_vector (7 downto 0):= (others => '0');
      s      : out std_logic_vector (7 downto 0):= (others => '0')
  );
  -- e : entrée , s : sortie , w(write) : entrée pour choisir de modifier le contenu du cache ou le lire    
end  Cache;

architecture Cache_Arch of Cache is
   signal data : std_logic_vector (7 downto 0):= (others => '0');
begin
	arch_process : process (clk, w, e)
    begin
        if clk = '1' then
            if w = '1' then
                data <= e;
            else
                s <= data; 
            end if ;
        else
            s <= (others => '0');
        end if ;
    end process;
end Cache_Arch;

