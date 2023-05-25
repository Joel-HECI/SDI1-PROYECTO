library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is
end entity;

architecture behavioral of testbench is
    
    signal clk: std_logic := '0';
    signal clk_period: time := 1 sec;


    signal load,t,w,door,start,stop_in,en: std_logic := '0';

    begin

    main: entity work.mainT
        port map(
            clk1hz => clk,
            load => load,
            t_in => t,
            w=> w,
            door => door,
            start => start,
            stop_in => stop_in,
            en => en

        );
    
        CLK_1HZ : process
    begin
    wait for clk_period / 2;
    if clk = '1' then
        clk <= '0';
    else
        clk <= '1';
    end if;
    end process;

    process
    begin

        wait for 2 sec;
        for i in 0 to 2 loop
        t<= '1';
        wait for 1 sec;
        t<= '0';    
        wait for 1 sec;
        end loop;

        wait for 2 sec;

        load <= '1';
        wait for 1 sec;
        load <= '0';

        wait for 2 sec;

        for i in 0 to 3 loop
        t<= '1';
        wait for 1 sec;
        t<= '0';    
        wait for 1 sec;
        end loop;

        wait for 2 sec;

        load <= '1';
        wait for 1 sec;
        load <= '0';

        wait for 2 sec;

        start <= '1';
        wait for 1 sec;
        start <= '0';


        wait for 2 sec;

        load <= '1';
        wait for 1 sec;
        load <= '0';


        wait for 2 sec;

        t <= '1';
        wait for 1 sec;
        t <= '0';


        wait for 2 sec;

        w <= '1';
        wait for 1 sec;
        w <= '0';


        wait for 2 sec;

        door <= '1';
        wait for 2 sec;
        door <= '0';
        
        wait for 2 sec;

        start <= '1';
        wait for 1 sec;
        start <= '0';

        wait for 2 sec;

        stop_in <= '1';
        wait for 1 sec;
        stop_in <= '0';

    wait;
    end process;    
end architecture;