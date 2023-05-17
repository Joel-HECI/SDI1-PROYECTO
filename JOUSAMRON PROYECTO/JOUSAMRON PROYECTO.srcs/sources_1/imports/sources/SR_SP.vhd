
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SR_SER_PAR is

port ( r : in std_logic;
      clk : in std_logic;
      d : in std_logic;
      q : out std_logic_vector(3 downto 0));

end entity;

architecture Behavioral of SR_SER_PAR is
    
        signal d_in, q_2, q_1, q_0: std_logic:='0';
        signal index: integer range 0 to 3 :=0;
        begin

      --   process (clk , d)
      --   begin
            
      --       if rising_edge(clk) then
                
      --           for i in 0 to 3 loop
      --               d_in <= d(index);
      --           end loop;
                

      --       end if;


      --   end process;

        q3: entity work.FLIP_FLOP_D port map (
        d => d_in,
        ebl => '1',
        rst=>r,
        clk => clk,
        q => q_2,
        nq=>open);

        q2: entity work.FLIP_FLOP_D port map (
        d => q_2,
        ebl => '1',
        rst=>r,
        clk => clk,
        q => q_1,
        nq=>open);

        q1: entity work.FLIP_FLOP_D port map (
        d => q_1,
        ebl => '1',
        rst=>r,
        clk => clk,
        q => q_0,
        nq=>open);

        q0: entity work.FLIP_FLOP_D port map (
        d => q_0,
        ebl => '1',
        rst=>r,
        clk => clk,
        q => q(0),
        nq=>open);

        q(3)<=q_2;
        q(2)<=q_1;
        q(1)<=q_0;
        
    end architecture;