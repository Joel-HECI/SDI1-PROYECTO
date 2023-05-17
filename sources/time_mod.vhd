library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity time_mod is
    port
    (
        t_in0, t_in1 : in std_logic_vector(3 downto 0);
        time_o : out integer range o to 90
    );
end entity;

architecture Behavioral of time_mod is
    
    time_o<=to_integer(unsigned(t_in1))*10+to_integer(unsigned(t_in0));

    end architecture;