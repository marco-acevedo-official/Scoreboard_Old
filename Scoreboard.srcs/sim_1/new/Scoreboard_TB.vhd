library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Scoreboard_TB is
end Scoreboard_TB;

architecture Simulation of Scoreboard_TB is
    constant clock_period : time := 10 ns;
    constant Debouncer_Register_Size : integer := 16;
    signal clock : std_logic := '0';
    signal reset_button : std_logic := '0';
    signal increase_button, inc_deb_to_sync, inc_sync_to_sc : std_logic := '0';
    signal decrease_button : std_logic := '0';
    signal Display_0 : unsigned(6 downto 0) := (others => '0');
    signal Display_1 : unsigned(6 downto 0) := (others => '0');
    signal BCD_0 : std_logic_vector(3 downto 0) := (others => '0');
    signal BCD_1 : std_logic_vector(3 downto 0) := (others => '0');
    
    component Debouncer is
    generic(
        clock_period : time;
        reg_width : integer
    );
    port(
       clk : in STD_LOGIC;
       input_signal : in STD_LOGIC;
       debounced_signal : out STD_LOGIC; -- Debounced output signal
       reg_out : out STD_LOGIC_VECTOR(reg_width-1 downto 0)
    );
    end component;
    
    component synchronizer  is
    generic(
        clock_period : time
    );
    port(
        rst      : in std_logic;
        clk      : in std_logic;
        data_in  : in std_logic;
        data_out : out std_logic
    );
    end component;
    
    component  Scoreboard is
    port(
        clk, rst, inc, dec: in std_logic;
        seg7disp1, seg7disp0: out unsigned(6 downto 0);
        bcd1_out, bcd0_out : out std_logic_vector(3 downto 0)--Debug
    );
    end component;

    begin
    
    deb_inc : Debouncer
    generic map(
    clock_period => clock_period,
    reg_width => Debouncer_Register_Size
    )
    port map(
        clk => clock,
        input_signal => increase_button,
        debounced_signal => inc_deb_to_sync
    );
    
    
    sync_inc: Synchronizer 
    generic map(
        clock_period => clock_period
    )
    port map (
        rst => reset_button,
        clk => clock,
        data_in => inc_deb_to_sync,
        data_out => inc_sync_to_sc
    );
    
    sc : Scoreboard
    port map(
        clk => clock,
        rst => reset_button,
        inc => inc_sync_to_sc,
        dec => decrease_button,
        seg7disp1 => Display_1,
        seg7disp0 => Display_0,
        bcd1_out => BCD_1,
        bcd0_out => BCD_0
    );
    
    process
    begin
        while true loop
            clock <= '1';
            wait for clock_period / 2;
            clock <= '0';
            wait for clock_period / 2;
        end loop;
    end process;
    
    
    process
    begin
        input_button <= '1';
        wait for 10 * clock_period;
        input_button <= '0';
        wait;
    end process;
    
end architecture Simulation;