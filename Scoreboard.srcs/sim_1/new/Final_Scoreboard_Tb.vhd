library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Final_Scoreboard_Tb is
--  Port ( );
end Final_Scoreboard_Tb;

architecture Behavioral of Final_Scoreboard_Tb is
signal add: STD_LOGIC := '0';
signal sub: STD_LOGIC := '0';
signal RESET: STD_LOGIC := '0';
signal LCD_BCD_0 : std_logic_vector(3 downto 0) := (others => '0');
signal LCD_BCD_1 : std_logic_vector(3 downto 0) := (others => '0');
signal Display0 : unsigned(6 downto 0) := "0000000";
signal Display1 : unsigned(6 downto 0) := "0000000";

component Final_Scoreboard is
    port (
        f_rst, f_inc, f_dec: in std_logic; -- BUTTON INPUTS
        f_bcd1_out, f_bcd0_out : out std_logic_vector(3 downto 0);--Debug, ACTUAL BCD VALUE
        f_seg7disp1, f_seg7disp0: out unsigned(6 downto 0) --OUTPUTS OF THE 7 SEGMENT DISPLAY
    );


begin
 UUT:Final_Scoreboard port map (
   f_rst => RESET,
   f_inc => add,
   f_dec => sub,
   f_bcd1_out => LCD_BCD_1,
   f_bcd0_out => LCD_BCD_0,
   f_seg7disp1 => Display1,
   f_seg7disp0 => Display0
 );
stimulus: process
begin
    add <= '1';
wait for 40 ns;
    add <= '0';
wait for 40 ns;
wait;
end process stimulus;
end Behavioral;
