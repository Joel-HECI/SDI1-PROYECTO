library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity global is
    port(

        rst: in std_logic;
        start, stop_in : in std_logic;
        door: in std_logic;
        t_in0: in std_logic_vector(3 downto 0);
        t_in1: in std_logic_vector(3 downto 0);

        w_in: in std_logic_vector(3 downto 0);

        enable_out: out std_logic

    );
end entity;

architecture Behavioral of global is
    type states is (running, stopped);
    signal prev_state: states:=stopped;
    signal next_state: states;
    signal t,w,safety: integer:=0;
    begin
    
    process(t_in0, t_in1, w_in,rst)
    begin
        if rising_edge(rst) then
            t<=0;
            w<=0;
            safety<=0;
        else
        t<= to_integer(unsigned(t_in1))*10 + to_integer(unsigned(t_in0));
        w<= to_integer(unsigned(w_in)*10);
        safety<=to_integer(unsigned(t_in1))*10 + to_integer(unsigned(t_in0))+to_integer(unsigned(w_in)*10);
        end if;
        
    end process;
    
    process(prev_state, start, stop_in, door, t,w,safety)

    begin
        if prev_state=running and (door='1' or rising_edge(stop_in)) then
            prev_state<=next_state;

        elsif prev_state=stopped and (rising_edge(start) and (t>0) and (safety<100) and (door='0')) then
            prev_state<=next_state;
        end if;

    end process;

    process(prev_state)
    begin
        case prev_state is
            when stopped =>
                next_state <= running;
            when running =>
                next_state <= stopped;
            end case;
    end process;

    enable_out <= '1' when prev_state=running else '0';
    end architecture;