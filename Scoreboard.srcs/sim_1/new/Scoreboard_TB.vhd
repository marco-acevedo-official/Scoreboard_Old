library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Scoreboard_TB is
end Scoreboard_TB;

architecture Simulation of Scoreboard_TB is
    constant clock_period : time := 5 ns;
    constant Debouncer_Register_Size : integer := 4;
    signal clock : std_logic := '0';
    signal reset_button : std_logic := '0';
    signal increase_button, decrease_button : std_logic := '0';
    signal Display_0 : unsigned(6 downto 0) := (others => '0');
    signal Display_1 : unsigned(6 downto 0) := (others => '0');
    signal BCD_0 : std_logic_vector(3 downto 0) := (others => '0');
    signal BCD_1 : std_logic_vector(3 downto 0) := (others => '0');
    signal register_inc, register_dec : STD_LOGIC_VECTOR(Debouncer_Register_Size-1 downto 0);
  
    begin
    
    SCORE : entity work.Scoreboard_Final
    generic map(clock_period => clock_period, reg_width => Debouncer_Register_Size )
    port map(
        clk => clock,
        rst => reset_button,
        inc => increase_button,
        dec => decrease_button,
        seg7disp1 => Display_1,
        seg7disp0 => Display_0,
        bcd1_out => BCD_1,
        bcd0_out => BCD_0,
        reg_out_inc => register_inc,
        reg_out_dec => register_dec
    );
    
    clock_process : process
    begin
        while true loop
            clock <= '1';
            wait for clock_period / 2;
            clock <= '0';
            wait for clock_period / 2;
        end loop;
        wait;
    end process clock_process;
    
    
    normal_press : process
    begin
    for i in 1 to 10 loop
        increase_button <= '0' ;
        wait for clock_period * 5;
        increase_button <= '1' ;
        wait for clock_period * 15;
    end loop;
    increase_button <= '0' ;
    wait;
    end process normal_press;

end architecture Simulation;
