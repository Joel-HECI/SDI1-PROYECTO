library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is
end entity;

architecture behavioral of testbench is
    
    signal clk: std_logic := '0';
    signal clk_period: time := 1 sec;

    signal rst: std_logic := '1';
    signal en: std_logic := '0';
    signal load: std_logic := '0';

    signal dig_in0,dig_in1: std_logic_vector(3 downto 0) := (others => '0');
    signal data_out: std_logic_vector(6 downto 0) := (others => '0');

    signal dig0, dig1: std_logic_vector(3 downto 0) := "0000";

    begin

    pot: entity work.CONT_2DIG
        port map(
            clk => clk,
            reset => rst,
            enable => en,
            load => load,

            dig_in0 => dig_in0,
            dig_in1 => dig_in1,
            num_out => data_out,
            dig0 => dig0,
            dig1 => dig1       
        );
    
        CLK_PROC : process
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
        
        dig_in0 <= "0001";
        dig_in1 <= "0100";
        load <= '1';
        en<='1';
        wait for 4 sec;
        rst <= '0';

    wait;
    end process;    
end architecture;