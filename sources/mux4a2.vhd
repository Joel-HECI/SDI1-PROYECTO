
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4a2 is
    Port ( 
        IA : in STD_LOGIC_VECTOR (3 downto 0);
        IB : in STD_LOGIC_VECTOR (3 downto 0);
        IC : in STD_LOGIC_VECTOR (3 downto 0);
        ID : in STD_LOGIC_VECTOR (3 downto 0);
        S : in STD_LOGIC_VECTOR;
        Y0 : out STD_LOGIC_VECTOR (3 downto 0);
        Y1: out STD_LOGIC_VECTOR (3 downto 0)
    );
 end mux4a2;

architecture arch_mux42 of mux4a2 is
    begin
        
    Y0 <= IA WHEN S='1'
    ELSE IC WHEN S='0'

    Y1 <= IB WHEN S='1'
    ELSE ID WHEN S='0'

end arch_mux42;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4a2 is
    Port ( 
        IA : in STD_LOGIC_VECTOR (3 downto 0);
        IB : in STD_LOGIC_VECTOR (3 downto 0);
        IC : in STD_LOGIC_VECTOR (3 downto 0);
        ID : in STD_LOGIC_VECTOR (3 downto 0);
        S : in STD_LOGIC;
        Y0 : out STD_LOGIC_VECTOR (3 downto 0);
        Y1: out STD_LOGIC_VECTOR (3 downto 0)
    );
 end mux4a2;

architecture arch_mux42 of mux4a2 is
    begin
        
    Y0 <= IA WHEN S='1'
    ELSE IC WHEN S='0';

    Y1 <= IB WHEN S='1'
    ELSE ID WHEN S='0';

end arch_mux42;

