library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contador0a9 is
    port (
        t_in, rst, load: in std_logic;
        t_out0, t_out1: out std_logic_vector(3 downto 0)
        );

end entity;

architecture contador0a9 of contador0a9 is
    
    signal contador : unsigned(3 downto 0) := (others => '0');
    signal t_out0_s, t_out1_s: std_logic_vector(3 downto 0):= (others => '0');
    signal slct: std_logic := '0';
    
    begin
        process(t_in, rst, load)
        begin
            if rst='1' then
                contador <= (others => '0');
            elsif t_in='1' then
                if contador = 9 then
                    contador <= (others => '0');
                else
                    contador <= contador + 1;
                end if;
            end if;

            if load='1' then
                
                    if slct='0' then 
                    t_out0_s <= std_logic_vector(contador);
                    slct <= not slct;

                    else
                    t_out1_s <= std_logic_vector(contador);
                    slct <= not slct;
                end if;
            
            end if;
        end process;
        
        t_out0 <= t_out0_s;
        t_out1 <= t_out1_s;
    end architecture;