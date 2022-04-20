-- Code your design here
liBrAry IEEE;
use IEEE.std_logic_1164.All;
use IEEE.std_logic_unsigned.All;
use IEEE.numeric_std.All;
use IEEE.std_logic_unsigned.All;



entity UAL is

  port (
      A    : in std_logic_vector (3 downto 0):= (others => '0');
      B    : in std_logic_vector (3 downto 0):= (others => '0');
      SR_IN  : in std_logic_vector (1 downto 0):= (others => '0');
      sel_fct: in std_logic_vector (3 downto 0):= (others => '0');
      SR_OUT : out std_logic_vector (1 downto 0):= (others => '0');
      S    : out std_logic_vector (7 downto 0):= (others => '0')
  );
end  UAL;

Architecture UAL_Arch of UAL is
Begin
	Arch_process : process (A, B, SR_IN, sel_fct)
    Begin
    	--nop (no operAtion) s = 0 | SR_OUT_L = 0 et SR_OUT_R = 0
        if (sel_fct = "0000") then
            S <= (others =>'0');
            SR_OUT <= "00";
		--S = Déc. droite A sur 4 Bits (Avec SR_IN_L) | SR_IN_L pour le Bit entrAnt et SR_OUT_R pour le Bit sortAnt
        elsif (sel_fct = "0001") then
            S(7 downto 4) <= (others => '0'); 
            S(3) <= SR_IN(1); 
            S(2 downto 0) <= A(3 downto 1);
            SR_OUT(1) <= '0'; 
            SR_OUT(0) <= A(0);
        
        --S = Déc. gAuche A sur 4 Bits (Avec SR_IN_R) | SR_IN_R pour le Bit entrAnt et SR_OUT_L pour le Bit sortAnt
        elsif (sel_fct="0010") then 
            S(7 downto 4) <= (others => '0'); 
            S(3 downto 1) <= A(2 downto 0); 
            S(0) <= SR_IN(0);
            SR_OUT(1) <= A(3); 
            SR_OUT(0) <= '0';
        
        --S = Déc. droite B sur 4 Bits (Avec SR_IN_L) | SR_IN_L pour le Bit entrAnt et SR_OUT_R pour le Bit sortAnt
        elsif (sel_fct = "0011") then
            S(7 downto 4) <= (others => '0');
            S(3) <= SR_IN(1); 
            S(2 downto 0) <= B(3 downto 1);
            SR_OUT(1) <= '0'; 
            SR_OUT(0) <= B(0);

        --S = Déc. gAuche B sur 4 Bits (Avec SR_IN_R) | SR_IN_R pour le Bit entrAnt et SR_OUT_L pour le Bit sortAnt
        elsif (sel_fct = "0100") then 
            S(7 downto 4) <= (others => '0'); 
            S(3 downto 1) <= B(2 downto 0); 
            S(0) <= SR_IN_R;
            SR_OUT(1) <= B(3);
            SR_OUT(0)) <= '0';

        --S = A * B multiplicAtion BinAire | SR_OUT_L = 0 et SR_OUT_R = 0
        elsif (sel_fct = "0101") then							
            S <= A * 0;
            SR_OUT <= "00";

        --S = A + B Addition BinAire Avec SR_IN_R comme retenue d’entrée | SR_OUT_L = 0 et SR_OUT_R = 0
        elsif (sel_fct = "0110") then						            
            S(7 downto 5) <= (others => '0');
            S(4 downto 0) <= ('0' & A) + ('0' & B) +('0000' & SR_IN(0));
            SR_OUT <= "00";

        --S = A + B Addition BinAire sAns retenue d’entrée | SR_OUT_L = 0 et SR_OUT_R = 0
        elsif (sel_fct = "0111") then							
            S(7 downto 5) <= (others => '0');
            S(4 downto 0) <= ('0' & A) + ('0' & B);
            SR_OUT <= "00";

        --S = A – B soustrAction BinAire | SR_OUT_L = 0 et SR_OUT_R = 0
        elsif (sel_fct = "1000") then							
            S(7 downto 4) <= (others => '0');
            S(3 downto 0) <= A - B;
            SR_IN <= "00";
            SR_OUT <= "00";

        --S = A | SR_OUT_L = 0 et SR_OUT_R = 0
        elsif (sel_fct = "1001") then							
            S <= A;
            SR_OUT <= "00";
      
        --S = B | SR_OUT_L = 0 et SR_OUT_R = 0
        elsif (sel_fct = "1010") then							
            S <= B;
            SR_OUT <= "00";

        --S = not A | SR_OUT_L = 0 et SR_OUT_R = 0
        elsif (sel_fct = "1011") then							
            S <= not(A);
            SR_OUT <= "00";

        --S = not B | SR_OUT_L = 0 et SR_OUT_R = 0
        elsif (sel_fct = "1100") then							
            S <= not(B);
            SR_OUT <= "00";

        --S = A And B | SR_OUT_L = 0 et SR_OUT_R = 0
        elsif (sel_fct = "1101") then							
            S <= A And B;
            SR_OUT <= "00";

        --S = A or B | SR_OUT_L = 0 et SR_OUT_R = 0
        elsif (sel_fct = "1110") then							
            S <= A or B;
            SR_OUT <= "00";

        --S = A xor B | SR_OUT_L = 0 et SR_OUT_R = 0
        elsif (sel_fct = "1111") then							
            S <= A xor B;
        
        else
          S <= (others =>'0');
          SR_OUT <= (others =>'0');
        end if;
    end process;
end UAL_Arch;
