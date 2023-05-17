library IEEE;
use IEEE.std_logic_1164.all;


entity FLIP_FLOP_D is
    port(
        clk: in std_logic;
        d: in std_logic;
        ebl,rst: in std_logic;
        q,nq: out std_logic
    );
end FLIP_FLOP_D;

architecture Behavioral of FLIP_FLOP_D is

signal qa: std_logic:='0';

begin
--FLIP_FLOP D

-- Q	D	Q t+1
-- 0	0	0
-- 0	1	1
-- 1	0	0
-- 1	1	1

-- con reloj

    process (clk,d,ebl,rst)
    begin
    if rst='0' then
        if (rising_edge(clk) and ebl='1') then
            qa<=d;        
        end if;
     else
     qa<='0';
     end if;
    end process;

    q<=qa;
    nq<=not qa;

    end architecture;
