library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contador0a9 is
    port (
        t_in, rst,en: in std_logic;
        t_out: out std_logic_vector(3 downto 0)
        );

end entity;

architecture contador0a9 of contador0a9 is
    
    signal contador : unsigned(3 downto 0) := (others => '0');
    signal t_out_s,: std_logic_vector(3 downto 0):= (others => '0');
    signal slct: std_logic := '0';
    
    begin
        process(t_in, rst,en)
        begin
            if rst='1' and en='0' then
                contador <= (others => '0');
                 t_out_s <= std_logic_vector(contador);
              
            elsif rising_edge(t_in) and en='0' then
                if contador >= 9 then
                    contador <= (others => '0');
                else
                    contador <= contador + 1;
                end if;
            end if;            
     
        end process;
        
        t_out0 <= t_out_s;

    end architecture;