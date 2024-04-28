library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--
entity Final_Scoreboard is
    Port (
        f_rst, f_inc, f_dec: in std_logic;
        f_bcd1_out, f_bcd0_out : out std_logic_vector(3 downto 0);
        f_seg7disp1, f_seg7disp0: out unsigned(6 downto 0)
    );
end Final_Scoreboard;
--
architecture Behavioral of Final_Scoreboard is
constant clock_period : time := 20ns;
constant Debounce_Reg_Width : integer := 16;
--SIGNALS
signal clock_bus : STD_LOGIC := '0';
signal RST_Deb_Reg_O : STD_LOGIC_VECTOR(Debounce_Reg_Width-1 downto 0) := (others => '0'); -- Registers for de Reset Button Debouncer
signal INC_Deb_Reg_O : STD_LOGIC_VECTOR(Debounce_Reg_Width-1 downto 0) := (others => '0'); -- Registers for de Increase Button Debouncer
signal DEC_Deb_Reg_O : STD_LOGIC_VECTOR(Debounce_Reg_Width-1 downto 0) := (others => '0'); -- Registers for de Decrease Button Debouncer
signal RST_Debounced_O : STD_LOGIC := '0'; -- Reset Signal After Debouncing
signal INC_Debounced_O : STD_LOGIC := '0'; -- Increase Signal After Debouncing
signal DEC_Debounced_O : STD_LOGIC := '0'; -- Decrease Signal After Debouncing
signal INC_Sync_O : STD_LOGIC := '0'; -- Increase Signal After Debouncing And Synchronizing
signal DEC_Sync_O : STD_LOGIC := '0'; -- Decrease Signal After Debouncing And Synchronizing
--signal RST_Sync_O : STD_LOGIC := '0';

    component Scoreboard is
    port(
        clk, rst, inc, dec: in std_logic;
        bcd1_out, bcd0_out : out std_logic_vector(3 downto 0);
        seg7disp1, seg7disp0: out unsigned(6 downto 0)
    );
    component Debouncer is
    Generic(
        clock_period : time;
        reg_width : integer
    );
    Port ( 
       clk : in STD_LOGIC;
       input_signal : in STD_LOGIC;
       debounced_signal : out STD_LOGIC; -- Debounced output signal
       reg_out : out STD_LOGIC_VECTOR(15 downto 0)
       );
    end component;
    component Synchronizer is
    Generic(
        clock_period : time
    );
    Port ( 
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        data_in  : in std_logic;
        data_out : out std_logic
    );
    end component;

begin
    RST_Debouncer: Debouncer
    generic map(
    reg_width => Debounce_Reg_Width,
    clock_period => clock_period
    )
    port map (
        clk => clock_bus,
        input_signal => f_rst,
        debounced_signal => RST_Debounced_O,
        reg_out => RST_Deb_Reg_O
    );
    --
    DEC_Debouncer: Debouncer 
    generic map(
        reg_width => Debounce_Reg_Width,
        clock_period => clock_period
    )
    port map (
        clk => clock_bus,
        input_signal => f_dec,
        debounced_signal => DEC_Debounced_O,
        reg_out => DEC_Deb_Reg_O
    );
    --
    INC_Debouncer: Debouncer 
    generic map(
        reg_width => Debounce_Reg_Width,
        clock_period => clock_period
    )
    port map (
        clk => clock_bus,
        input_signal => f_inc,
        debounced_signal => INC_Debounced_O,
        reg_out => INC_Deb_Reg_O
    );
    --
    INC_Sync : Synchronizer
        generic map(
    clock_period => clock_period
    )
    port map (
    rst => RST_Debounced_O,
    clk => clock_bus,
    data_in => INC_Debounced_O,
    data_out => INC_Sync_O
    );
    DEC_Sync : Synchronizer
    generic map(
    clock_period => clock_period
    )
    port map (
    rst => RST_Debounced_O,
    clk => clock_bus,
    data_in => DEC_Debounced_O,
    data_out => DEC_Sync_O
    );
    --
    Score: Scoreboard port map(
        clk => clock_bus,
        rst => RST_Debounced_O,
        inc => INC_Sync_O,
        dec => DEC_Sync_O,
        bcd1_out => f_bcd1_out,
        bcd0_out => f_bcd0_out,
        seg7disp1 => f_seg7disp1,
        seg7disp0 => f_seg7disp0
    );
end Behavioral;
