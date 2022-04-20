-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;



entity UAL is

  port (
      e_a    : in std_logic_vector (3 downto 0):= (others => '0');
      e_b    : in std_logic_vector (3 downto 0):= (others => '0');
      sr_in  : in std_logic_vector (1 downto 0):= (others => '0');
      sel_fct: in std_logic_vector (3 downto 0):= (others => '0');
      sr_out : out std_logic_vector (1 downto 0):= (others => '0');
      s      : out std_logic_vector (7 downto 0):= (others => '0')
  );
end  UAL;

architecture UAL_Arch of UAL is
begin
	arch_process : process (e_a, e_b, sr_in, sel_fct)
    begin
    	--nop (no operation) s = 0 | sr_out_L = 0 et sr_out_R = 0
        if (sel_fct = "0000") then
            s <= (others =>'0');
            sr_out <= "00";
		--S = Déc. droite e_a sur 4 bits (avec sr_in_L) | sr_in_L pour le bit entrant et sr_out_R pour le bit sortant
        elsif (sel_fct = "0001") then
            s(7 downto 4) <= (others => '0'); 
            s(3) <= sr_in(1); 
            s(2 downto 0) <= e_a(3 downto 1);
            sr_out(1) <= '0'; 
            sr_out(0) <= e_a(0);
        
        --S = Déc. gauche e_a sur 4 bits (avec sr_in_R) | sr_in_R pour le bit entrant et sr_out_L pour le bit sortant
        elsif (sel_fct="0010") then 
            s(7 downto 4) <= (others => '0'); 
            s(3 downto 1) <= e_a(2 downto 0); 
            s(0) <= sr_in(0);
            sr_out(1) <= e_a(3); 
            sr_out(0) <= '0';
        
        --S = Déc. droite B sur 4 bits (avec sr_in_L) | sr_in_L pour le bit entrant et sr_out_R pour le bit sortant
        elsif (sel_fct = "0011") then
            s(7 downto 4) <= (others => '0');
            s(3) <= sr_in(1); 
            s(2 downto 0) <= e_b(3 downto 1);
            sr_out(1) <= '0'; 
            sr_out(0) <= e_b(0);

        --S = Déc. gauche B sur 4 bits (avec sr_in_R) | sr_in_R pour le bit entrant et sr_out_L pour le bit sortant
        elsif (sel_fct = "0100") then 
            s(7 downto 4) <= (others => '0'); 
            s(3 downto 1) <= e_b(2 downto 0); 
            s(0) <= sr_in_R;
            sr_out(1) <= e_b(3);
            sr_out(0)) <= '0';

        --S = A * B multiplication binaire | sr_out_L = 0 et sr_out_R = 0
        elsif (sel_fct = "0101") then							
            s <= a * b;
            sr_out <= "00";

        --S = A + B addition binaire avec sr_in_R comme retenue d’entrée | sr_out_L = 0 et sr_out_R = 0
        elsif (sel_fct = "0110") then						            
            s(7 downto 5) <= (others => '0');
            s(4 downto 0) <= ('0' & a) + ('0' & b) +('0000' & sr_in(0));
            sr_out <= "00";

        --S = A + B addition binaire sans retenue d’entrée | sr_out_L = 0 et sr_out_R = 0
        elsif (sel_fct = "0111") then							
            s(7 downto 5) <= (others => '0');
            s(4 downto 0) <= ('0' & a) + ('0' & b);
            sr_out <= "00";

        --S = A – B soustraction binaire | sr_out_L = 0 et sr_out_R = 0
        elsif (sel_fct = "1000") then							
            s(7 downto 4) <= (others => '0');
            s(3 downto 0) <= a - b;
            sr_in <= "00";
            sr_out <= "00";

        --S = A | sr_out_L = 0 et sr_out_R = 0
        elsif (sel_fct = "1001") then							
            s <= a;
            sr_out <= "00";
      
        --S = B | sr_out_L = 0 et sr_out_R = 0
        elsif (sel_fct = "1010") then							
            s <= b;
            sr_out <= "00";

        --S = not A | sr_out_L = 0 et sr_out_R = 0
        elsif (sel_fct = "1011") then							
            s <= not(a);
            sr_out <= "00";

        --S = not B | sr_out_L = 0 et sr_out_R = 0
        elsif (sel_fct = "1100") then							
            s <= not(b);
            sr_out <= "00";

        --S = A and B | sr_out_L = 0 et sr_out_R = 0
        elsif (sel_fct = "1101") then							
            s <= a and b;
            sr_out <= "00";

        --S = A or B | sr_out_L = 0 et sr_out_R = 0
        elsif (sel_fct = "1110") then							
            s <= a or b;
            sr_out <= "00";

        --S = A xor B | sr_out_L = 0 et sr_out_R = 0
        elsif (sel_fct = "1111") then							
            s <= a xor b;
        
        else
          s <= (others =>'0');
          sr_out <= (others =>'0');
        end if;
    end process;
end UAL_Arch;
