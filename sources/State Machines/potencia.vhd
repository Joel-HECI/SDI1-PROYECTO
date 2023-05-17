library IEEE;
use IEEE.std_logic_1164.all;

entity potencia is
    port(
    --clk: in std_logic;
    w_in: in std_logic;
    en: in std_logic;
    w_out_0: out STD_LOGIC_VECTOR(3 downto 0);
    w_out_1: out STD_LOGIC_VECTOR(3 downto 0)
    );
end entity;

architecture Behavioral of potencia is
    type states is (W1,W2,W3,W4,W5,W6,W7,W8);
    signal prev_state, next_state: states;
    signal w_out_0_s: STD_LOGIC_VECTOR(3 downto 0):="0000";
    begin

    process(w_in,en)
    begin
        if rising_edge(w_in) and en='0' then
            prev_state <= next_state;
        end if;
    end process;


    process(prev_state)
    begin
        case prev_state is
            when W1 => 
                w_out_1 <= "0001";
                next_state<=W2;
            when W2 => 
                w_out_1 <= "0010";
                next_state<=W3;
            when W3 => 
                w_out_1 <= "0011";
                next_state<=W4;
            when W4 => 
                w_out_1 <= "0100";
                next_state<=W5;
            when W5 => 
                w_out_1 <= "0101";
                next_state<=W6;
            when W6 => 
                w_out_1 <= "0110";
                next_state<=W7;
            when W7 =>
                w_out_1 <= "0111"; 
                next_state<=W8;
            when W8 =>
                w_out_1 <= "1000";
                next_state<=W1;
        end case;
    end process;

    w_out_0 <= w_out_0_s;
    end Behavioral;