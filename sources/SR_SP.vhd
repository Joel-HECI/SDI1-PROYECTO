
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SR_SER_PAR is

port ( r : in std_logic;
      clk : in std_logic;
      d : in std_logic(3 downto 0);
      q_out0, q_out1 : out std_logic_vector(3 downto 0));

end entity;

architecture Behavioral of SR_SER_PAR is
    
        signal d_in: std_logic:='0';
        signal q: std_logic_vector(7 downto 0):="00000000";
        signal index_a: integer range 7 downto 0 :=7;
        signal index_b: integer range 0 to 3 :=0;
        begin

        process(clk)
        begin
            if(r='1') then
                q<="00000000";
                
            elsif(r='0' and rising_edge(clk)) then
            for i in 0 to 3 loop
              q(index_a-i)<=d(index_b+i);
            end loop;

            end if;
        end process;
        q_out0<=q(3 downto 0);
        q_out1<=q(7 downto 4);
    end architecture;