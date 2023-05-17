library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DIV_1HZ is
    Port (
        Clk : in STD_LOGIC;
        CLK_o : out STD_LOGIC
        );
end DIV_1HZ;    

architecture Behavioral of DIV_1HZ is

    
constant freq_counter : integer := 50e6; -- 1 Hz
signal Divisor : integer range 0 to freq_counter;
signal CLKo : STD_LOGIC;
-- La definición de la variable Divisor se
-- definición de la Arquitectura

begin
 
 div:process(Clk)
 begin

if (Clk'event and Clk='1') then
    if(Divisor = freq_counter)then 
        Divisor<=0;
        CLKo <= not CLKo;
    else
        Divisor <= Divisor + 1;
    end if; 
CLK_o <= CLKo;
end if;

end Process div;
    
    end Behavioral;