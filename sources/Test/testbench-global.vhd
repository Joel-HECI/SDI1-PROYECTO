library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is
end entity;

architecture Behavioral of testbench is
    
    signal rst,start, stopin, door, en: std_logic:='0';
    signal tin0,tin1,win: std_logic_vector(3 downto 0):="0000";

    begin
    glb:entity work.global port map(
   
    rst => rst,
        start => start,
        stop_in => stopin,
        door => door,
        enable_out => en,
        t_in0 => tin0,
        t_in1 => tin1,
        w_in => win
    );

    process
    begin

        wait for 10 ms;

        stopin <= '0';
        door <= '0';
        tin0 <= "0000";
        tin1 <= "0011";
        win <= "0001";
        wait for 10 ms;

        start <= '1';
        wait for 10 us;
        start <= '0';

        wait for 10 ms;
        door <= '1';
        wait for 10 ms;
        door <= '0';

        start <= '1';
        wait for 10 us;
        start <= '0';

        wait for 20 ms;
        stopin <= '1';
        wait for 10 us;
        stopin <= '0';

        wait for 10 ms;
        
        tin0 <= "0001";
        tin1 <= "0101";
        win <= "1000";

        wait for 10 ms;
        start <= '1';
        wait for 10 us;
        start <= '0';

        wait for 10 ms;
    wait;
    end process;

    end architecture;