library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is
end entity;

architecture behavioral of testbench is
    
    

    signal rst, load: std_logic := '0';
    signal t: std_logic := '0';
    signal data_out0, data_out1: std_logic_vector(3 downto 0) := (others => '0');


    begin

    pot: entity work.contador0a9
        port map(
            t_in => t,
            rst => rst,
            load=> load,
            t_out0 => data_out0,
            t_out1 => data_out1
     
        );
    
    process
    begin
        wait for 50 ms;
        for i in 0 to 9 loop
            t<= not t;
            wait for 500 us;
            end loop;
        load<= '1';
        wait for 10 us;
        load<= '0';
        wait for 50 ms;
        for i in 0 to 13 loop
            t<= not t;
            wait for 500 us;
            end loop;
        load<= '1';
        wait for 50 us;
        load<= '0';
        wait for 50 ms;
    wait;
    end process;    
end architecture;