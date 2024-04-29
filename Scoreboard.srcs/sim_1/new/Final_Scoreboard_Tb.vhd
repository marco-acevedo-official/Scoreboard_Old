library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_bit.all;
use IEEE.numeric_std.all;

entity Final_Scoreboard_Tb is
end Final_Scoreboard_Tb;

architecture Behavioral of Final_Scoreboard_Tb is
    signal add_score : std_logic := '0';
    signal sub       : std_logic := '0';
    signal RESET     : std_logic := '0';
    signal LCD_BCD_0 : std_logic_vector(3 downto 0) := (others => '0');
    signal LCD_BCD_1 : std_logic_vector(3 downto 0) := (others => '0');
    signal Display0  : unsigned(6 downto 0) := (others => '0');
    signal Display1  : unsigned(6 downto 0) := (others => '0');

    -- Clock signal (example)
    signal clk : std_logic := '0';

    Component Final_Scoreboard is 
    Port (
        f_rst, f_inc, f_dec: in std_logic;
        f_bcd1_out, f_bcd0_out : out std_logic_vector(3 downto 0);
        f_seg7disp1, f_seg7disp0: out unsigned(6 downto 0)
    );
    end component;

begin
    -- Instantiate Final_Scoreboard component
    UUT: Final_Scoreboard port map (
        f_rst => RESET,
        f_inc => add_score,
        f_dec => sub,
        f_bcd1_out => LCD_BCD_1,
        f_bcd0_out => LCD_BCD_0,
        f_seg7disp1 => Display1,
        f_seg7disp0 => Display0
    );

    -- Clock process (example)
    process
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;

    -- Stimulus process (example)
    stimulus: process
    begin
        RESET <= '1'; -- Reset active
        wait for 50 ns;
        RESET <= '0'; -- Release reset

        -- Simulate adding score
        add_score <= '1';
        wait for 40 ns;
        add_score <= '0';
        wait for 40 ns;

        -- Simulate subtracting score
        sub <= '1';
        wait for 40 ns;
        sub <= '0';
        wait for 40 ns;

        -- Additional test cases can be added here
    end process stimulus;

end Behavioral;
