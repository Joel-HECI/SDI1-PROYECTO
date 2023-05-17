library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is
end entity;

architecture behavioral of testbench is
    
    signal clk: std_logic := '0';
    signal clk_period: time := 1 sec;

    signal rst: std_logic := '0';
   

    --signal data_in: std_logic_vector(3 downto 0) := (others => '0');
    signal data_in: std_logic:='0';
    signal data_out: std_logic_vector(3 downto 0) := (others => '0');



    begin

    sr: entity work.SR_SER_PAR
        port map(
            clk => clk,
            r => rst,
            d => data_in,
            q => data_out
      
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
        wait for 1 sec;
        data_in <= '1';
        wait for 5 sec;
        data_in <= '0';



    wait;
    end process;    
end architecture;