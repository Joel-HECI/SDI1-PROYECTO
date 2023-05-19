library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contador0a9 is
    port (
        t_in, rst,en, load, start: in std_logic;
        t_out: out std_logic_vector(3 downto 0)

        );

end entity;

architecture contador0a9 of contador0a9 is
    
    signal contador : unsigned(3 downto 0) := (others => '0');
    signal t_out_s: std_logic_vector(3 downto 0):= (others => '0');

    
    begin
        process(t_in, rst,en,load, start)
        begin
            if (rst='1' and en='0') or start='1' then
                contador <= (others => '0');
               
              
            elsif rst='0' and en='0' then 
            if  rising_edge(t_in) and en='0' then
                if contador >= 9 then
                    contador <= (others => '0');
                else
                    contador <= contador + 1;
                end if;
            end if;
            end if;            
         t_out_s <= std_logic_vector(contador);
         
         
            
        end process;
        
        t_out <= t_out_s;

    end architecture;