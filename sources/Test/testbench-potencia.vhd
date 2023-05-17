library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is
end entity;

architecture behavioral of testbench is
    
    signal w: std_logic := '0';
    signal w0, w1 : std_logic_vector(3 downto 0) := (others => '0');

    begin

    pot: entity work.potencia
        port map(
            w_in => w,
            w_out_0 => w0,
            w_out_1 => w1
        );
    
    process
    begin
        w <= '0';
        wait for 10 ns;
        w <= '1';
        wait for 10 ns;
        w <= '0';
        wait for 10 ns;
        w <= '1';
        wait for 10 ns;
        w <= '0';
        wait for 10 ns;
        w <= '1';
        wait for 10 ns;
        w <= '0';
        wait for 10 ns;
        w <= '1';
        wait for 10 ns;
        w <= '0';
        wait for 10 ns;
        w <= '1';
        wait for 10 ns;
        w <= '0';
        wait for 10 ns;
        w <= '1';
        wait for 10 ns;
        w <= '0';
        wait for 10 ns;
        w <= '1';
        wait for 10 ns;
        w <= '0';
        wait for 10 ns;
        w <= '1';
        wait for 10 ns;
        w <= '0';
        wait for 10 ns;
        w <= '1';
        wait;
    end process;

end architecture;