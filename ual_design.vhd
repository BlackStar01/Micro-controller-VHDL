library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity ual is
  port(
    a, b : in  std_logic_vector(3 downto 0);	
    sel_fct   : in  std_logic_vector(3 downto 0);						
    SR_IN : in  std_logic_vector(1 downto 0);
    SR_OUT: out  std_logic_vector(1 downto 0);
    S : out std_logic_vector(7 downto 0)
  );
end entity;

architecture my_ual of ual is
begin
  
  ual_proc : process(a, b, SR_IN, sel_fct)
  begin
    S <= (others =>'0');
    
    case sel_fct is
      --nop (no operation) S = 0 | SR_OUT_L = 0 et SR_OUT_R = 0
      when "0000" =>							
        S <= (others =>'0');
        SR_OUT <= "00";

      --S = Déc. droite A sur 4 bits (avec SR_IN_L) | SR_IN_L pour le bit entrant et SR_OUT_R pour le bit sortant
      when "0001" =>
        S(7 downto 4) <= (others => '0'); 
        S(3) <= SR_IN(1); 
        S(2 downto 0) <= A(3 downto 1);
        SR_OUT(1) <= '0'; 
        SR_OUT(0) <= A(0);

      --S = Déc. gauche A sur 4 bits (avec SR_IN_R) | SR_IN_R pour le bit entrant et SR_OUT_L pour le bit sortant
      when "0010" => 
        S(7 downto 4) <= (others => '0'); 
        S(3 downto 1) <= A(2 downto 0); 
        S(0) <= SR_IN_R;
        SR_OUT_L <= A(3); 
        SR_OUT_R <= '0';

      --S = Déc. droite B sur 4 bits (avec SR_IN_L) | SR_IN_L pour le bit entrant et SR_OUT_R pour le bit sortant
      when "0011" =>
        S(7 downto 4) <= (others => '0');
        S(3) <= SR_IN_L; 
        S(2 downto 0) <= B(3 downto 1);
        SR_OUT_L <= '0'; 
        SR_OUT_R <= B(0);

      --S = Déc. gauche B sur 4 bits (avec SR_IN_R) | SR_IN_R pour le bit entrant et SR_OUT_L pour le bit sortant
      when "0100" => 
        S(7 downto 4) <= (others => '0'); 
        S(3 downto 1) <= B(2 downto 0); 
        S(0) <= SR_IN_R;
        SR_OUT_L <= B(3);
        SR_OUT_R <= '0';

      --S = A * B multiplication binaire | SR_OUT_L = 0 et SR_OUT_R = 0
      when "0101" =>							
        S <= a * b;
        SR_OUT <= "00";

      --S = A + B addition binaire avec SR_IN_R comme retenue d’entrée | SR_OUT_L = 0 et SR_OUT_R = 0
      when "0110" =>						
        S <= a + b;
        SR_IN <= "01";
        SR_OUT <= "00";

      --S = A + B addition binaire sans retenue d’entrée | SR_OUT_L = 0 et SR_OUT_R = 0
      when "0111" =>							
        S <= a + b;
        SR_OUT <= "00";

      --S = A – B soustraction binaire | SR_OUT_L = 0 et SR_OUT_R = 0
      when "1000" =>							
        S <= a + b;
        SR_IN <= "00";
        SR_OUT <= "00";

      --S = A | SR_OUT_L = 0 et SR_OUT_R = 0
      when "1001" =>							
        S <= a;
        SR_OUT <= "00";
        
      --S = B | SR_OUT_L = 0 et SR_OUT_R = 0
      when "1010" =>							
        S <= b;
        SR_OUT <= "00";

      --S = not A | SR_OUT_L = 0 et SR_OUT_R = 0
      when "1011" =>							
        S <= not(a);
        SR_OUT <= "00";

      --S = not B | SR_OUT_L = 0 et SR_OUT_R = 0
      when "1100" =>							
        S <= not(b);
        SR_OUT <= "00";

      --S = A and B | SR_OUT_L = 0 et SR_OUT_R = 0
      when "1101" =>							
        S <= a and b;
        SR_OUT <= "00";

      --S = A or B | SR_OUT_L = 0 et SR_OUT_R = 0
      when "1110" =>							
        S <= a + b;
        SR_OUT <= "00";

      --S = A xor B | SR_OUT_L = 0 et SR_OUT_R = 0
      when "1111" =>							
        S <= a xor b;

      when others =>
        null;
      
    end case;

  end process;

end my_ual;