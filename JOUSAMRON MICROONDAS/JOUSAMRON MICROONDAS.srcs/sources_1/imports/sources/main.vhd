library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity main is
    port(
        clk : in std_logic;
        t_in, load, door,w : in std_logic;
        en: out std_logic;
        start,stop_in: in std_logic;
        SAL_7SEG : out std_logic_vector(6 downto 0);
        ANODOS: out std_logic_vector(3 downto 0);
        LED:out std_logic_vector(7 downto 0)
    );
end entity;

architecture Behavioral of main is

    signal t_in_s,t_in0, t_in1: std_logic_vector(3 downto 0);
    signal clk1hz, clk200khz: std_logic;
    signal sr_r: std_logic; 
    signal w_1, w_0: std_logic_vector(3 downto 0);
    signal dig0_out, dig1_out: std_logic_vector(3 downto 0);
    signal BCD1, BCD2, BCD3, BCD4: std_logic_vector(3 downto 0);
    
    signal enable: std_logic;
    begin 
    

    
    clk1: entity work.DIV_1HZ
        port map(
            clk => clk,
            CLK_o => clk1hz
        );

    clk200k: entity work.DIV_VD
        port map(
            clk => clk,
            CLK_o => clk200khz
        );

    cont0a9: entity work.contador0a9 
        port map(
            t_in => t_in,
            
            start=>start,
            load=>load,
            rst => stop_in,
            en=>enable,
            
            t_out => t_in_s
        );

        sr: entity work.SR_SER_PAR
        port map(
            r => stop_in,
            sr_r=>sr_r,
            en=>enable,
            clk=> load,
            d=> t_in_s,
            q_out0=> t_in0,
            q_out1=> t_in1
        );

    cont_des: entity  work.CONT_2DIG
        port map(
            clk => clk1hz,
            reset => stop_in,
            enable => enable,

            dig_in0 => t_in0,
            dig_in1 => t_in1,

            num_out => open,

            dig0 => dig0_out,
            dig1 => dig1_out
        );

    global: entity work.global
        port map(

           
            start => start,
            stop_in => stop_in,
            door => door,
            
            w_in => w_1,
            
            t_in0 => dig0_out,
            t_in1 => dig1_out,

            enable_out => enable
        );
    
    pot: entity work.potencia
        port map(

            w_in => w,
            en=> enable,
            w_out_0 => w_0,
            w_out_1 => w_1,
            pot_out=> LED
        );

        VD: entity work.VIS_DIN_4DIG
        
        port map(
        clk=> clk200khz,
        ANODS=> ANODOS,
        SAL7SEG=> SAL_7SEG,
        BCD1=>dig1_out,
        BCD2=>dig0_out,
        BCD3=>w_1,
        BCD4=>w_0
        );
        en<=enable;
end architecture;
