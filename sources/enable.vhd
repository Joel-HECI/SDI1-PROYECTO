library IEEE;
use IEEE.std_logic_1164.all;

entity enable_block is
    port(

        load, t, w: in std_logic;
        en  : in std_logic;
        load_o, t_o, w_o: out std_logic
    );
end entity;


architecture Behavioral of enable_block is
begin

    load_o<=load WHEN en='0' ELSE '0';
    t_o<=t WHEN en='0' ELSE '0';
    w_o<=w WHEN en='0' ELSE '0';
end architecture;
