library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity Scoreboard_Final is
    Generic (
        clock_period : time := 10 ns;
        reg_width : integer := 16
    );
    Port (
        clk, rst, inc, dec: in std_logic;
        seg7disp1, seg7disp0: out unsigned(6 downto 0);
        bcd1_out, bcd0_out : out std_logic_vector(3 downto 0);--Debug
        reg_out_inc : out STD_LOGIC_VECTOR(reg_width-1 downto 0);
        reg_out_dec : out STD_LOGIC_VECTOR(reg_width-1 downto 0)
    );
end Scoreboard_Final;
architecture Connections of Scoreboard_Final is
signal inc_f, dec_f : std_logic := '0';
begin
INCREASE : entity work.Button_Filter
generic map(clock_period => clock_period, reg_width => reg_width )
port map(
        clockin => clk,
        resetin => rst,
        raw_input => inc,
        clean_output => inc_f,
        deb_reg_out => reg_out_inc
);
DECREASE : entity work.Button_Filter
generic map(clock_period => clock_period, reg_width => reg_width )
port map(
        clockin => clk,
        resetin => rst,
        raw_input => dec,
        clean_output => dec_f,
        deb_reg_out => reg_out_dec
);
SCORE : entity work.Scoreboard
generic map(clock_period => clock_period, reg_width => reg_width )
port map(
        clk => clk,
        rst => rst,
        inc => inc_f,
        dec => dec_f,
        seg7disp1 => seg7disp1,
        seg7disp0 => seg7disp0,
        bcd1_out => bcd1_out,
        bcd0_out => bcd0_out
);
end Connections;
