library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CONT_2DIG is
    
    port(
        clk: in std_logic;
        reset: in std_logic;
        enable: in std_logic;
      
           sr_r: out std_logic;
        dig_in0, dig_in1: in std_logic_vector(3 downto 0);
        num_out: out std_logic_vector(6 downto 0);
        dig0, dig1: out std_logic_vector(3 downto 0)
        
    );

    end entity;

architecture Behavioral of CONT_2DIG is
    
    signal count: integer range 90 downto 0 := 0;
    signal dig0_s,dig1_s: unsigned(3 downto 0) := (others => '0');
    signal r_s: std_logic:='0';

    begin

    process(clk, enable, count,r_s)
    begin
    
     if enable='0' then
   
        count <= to_integer(unsigned(dig_in1))*10 + to_integer(unsigned(dig_in0));
            dig0_s <= unsigned(dig_in0); 
            dig1_s <= unsigned(dig_in1);

      
    elsif enable='1' then    
         
        if rising_edge(clk) and count>0 then

            count <= count - 1;
            if dig0_s=0 then
                dig0_s <= to_unsigned(9,4);
                dig1_s <= dig1_s - 1;
            else 
                dig0_s <= dig0_s - 1;
            end if;
            
--            if count-1 = 0 then
--            sr_r<='1';
--            else
--            sr_r<='0';
--            end if;
            
        end if;         
     end if;

    end process;
    
    dig0 <= std_logic_vector(dig0_s);
    dig1 <= std_logic_vector(dig1_s);
    
  
    num_out <= std_logic_vector(to_unsigned(count,7));
    end architecture;