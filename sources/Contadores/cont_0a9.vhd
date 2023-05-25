library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contador0a9 is
    port (
        sr_in: in std_logic_vector(3 downto 0);
        t_in, rst, load, start: in std_logic;
        t_out: out std_logic_vector(3 downto 0)

        );

end entity;

architecture contador0a9 of contador0a9 is
    
    signal contador : unsigned(3 downto 0) := (others => '0');
    signal t_out_s: std_logic_vector(3 downto 0):= (others => '0');

    
    begin
        process(t_in, rst,load, start, sr_in)
        begin

            if rst='1' or start='1' then
                contador <= (others => '0');

              
            elsif rst='0' then 
                if  rising_edge(t_in) then
                    if contador >= 9 then
                        contador <= (others => '0');
                    else
                        contador <= contador + 1;
                        
                    end if;
                    
                end if;  
            end if;            
         
            if falling_edge(load) and sr_in=t_out_s then
                contador <= (others => '0');
            end if;
         
        end process;
        t_out_s <= std_logic_vector(contador);
        t_out <= t_out_s;

    end architecture;