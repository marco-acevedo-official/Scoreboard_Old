library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Scoreboard_TB is
end Scoreboard_TB;

architecture Simulation of Scoreboard_TB is
    signal wClk : std_logic := '0';
    signal wRst : std_logic := '0';
    signal wInc : std_logic := '0';
    signal wDec : std_logic := '0';
    signal wBcd0 : std_logic_vector(3 downto 0) := "0000";
    signal wBcd1 : std_logic_vector(3 downto 0) := "0000";
    signal wSd1 : unsigned(6 downto 0) := "0000000";
    signal wSd0 : unsigned(6 downto 0) := "0000000";
    constant clk_period : time := 10ns;

    component Scoreboard is
        port(
        clk, rst, inc, dec: in std_logic;
        bcd1_out, bcd0_out : out std_logic_vector(3 downto 0);--Debug
        seg7disp1, seg7disp0: out unsigned(6 downto 0)
        );
    end component;

begin

    uut: Scoreboard port map
    (
        clk => wClk,
        rst => wRst,
        inc => wInc,
        dec => wDec,
        bcd1_out => wBcd1,
        bcd0_out => wBcd0,
        seg7disp1 => wSd1,
        seg7disp0 => wSd0
    );

    clk_process: process
    begin                                       
        wClk <= '0';                            
        wait for clk_period / 2;                
        wClk <= '1';                            
        wait for clk_period / 2;                
    end process clk_process; 

stimulus: process
begin

        wRst <= '1';  -- Assert reset
        wait for clk_period;  -- Wait for a few clock cycles
        
        wRst <= '0';  -- De-assert reset
        wait for clk_period;  -- Wait for a few clock cycles

    -- Loop 9 times
    for i in 1 to 99 loop
        -- Toggle inc and dec to simulate some input changes
        wInc <= '1';
        wait for clk_period;
        wInc <= '0';
        wait for clk_period;
    end loop;
    
    
        for i in 1 to 99 loop
        -- Toggle inc and dec to simulate some input changes
        wDec <= '1';
        wait for clk_period;
        wDec <= '0';
        wait for clk_period;
    end loop;
    
    wait;
    
end process stimulus;


end architecture Simulation;
