library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DIV_VD is
    Port (
        Clk : in STD_LOGIC;
        CLK_o : out STD_LOGIC
        );
end DIV_VD;    

architecture Behavioral of DIV_VD is

signal Divisor : integer range 0 to 2500;
signal CLKo : STD_LOGIC;
-- La definición de la variable Divisor se
-- definición de la Arquitectura

begin
 
 div:process(Clk)
 begin

if (Clk'event and Clk='1') then
    if(Divisor = 2500)then 
        Divisor<=0;
        CLKo <= not CLKo;
    else
        Divisor <= Divisor + 1;
    end if; 
CLK_o <= CLKo;
end if;

end Process div;
    
    end Behavioral;