library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity enable_block is
    port(

        en  : in std_logic;
        
        load, t, w: in std_logic;
        load_o, t_o, w_o: out std_logic;
        
        start, stop_in: in std_logic;
        start_o, stop_o, rst_o: out std_logic
    );
end entity;


architecture Behavioral of enable_block is

    signal stop_s: std_logic:='0';
    begin


    load_o<=load WHEN en='0' ELSE '0';
    t_o<=t WHEN en='0' ELSE '0';
    w_o<=w WHEN en='0' ELSE '0';

    start_o<=start;
    
     stop_o<=stop_in WHEN en='1' ELSE '0';
     rst_o<=stop_in WHEN  en='0' ELSE '0';


end architecture;
