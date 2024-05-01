library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Debouncer_Tb is
end Debouncer_Tb;

architecture Simulation of Debouncer_Tb is
    signal sClk : STD_LOGIC := '0';
    signal sInput : STD_LOGIC := '0';
    signal rst : STD_LOGIC := '0';
    signal sDebounced : STD_LOGIC := '0';
    signal sReg : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal sync_deb : STD_LOGIC := '0';
    constant clk_period : time := 10 ns;
    constant Debounce_Reg_Width : integer := 16;

    component Debouncer is
    Generic(
        clock_period : time;
        reg_width : integer
    );
    Port ( 
        clk : in STD_LOGIC;
        input_signal : in STD_LOGIC;
        debounced_signal : out STD_LOGIC; -- Debounced output signal
        reg_out : out STD_LOGIC_VECTOR(Debounce_Reg_Width-1 downto 0)
    );
    end component;
    
    component Synchronizer is
    generic (
        clock_period : time
    );
    port(
        rst      : in std_logic;
        clk      : in std_logic;
        data_in  : in std_logic;
        data_out : out std_logic
    );
    end component;

begin

    UUT_Debouncer: Debouncer 
    generic map(
        reg_width => Debounce_Reg_Width,
        clock_period => clk_period
    )
    port map (
        clk => sClk,
        input_signal => sInput,
        debounced_signal => sDebounced,
        reg_out => sReg
    );
    
    
    UUT_Synchronizer: Synchronizer 
    generic map(
        clock_period => clk_period
    )
    port map (
        rst => rst,
        clk => sClk,
        data_in => sDebounced,
        data_out => sync_deb
    );

    clk_process: process
    begin                                       
        while true loop
            sClk <= '0';                            
            wait for clk_period / 2;                
            sClk <= '1';                            
            wait for clk_period / 2;                
        end loop;
    end process clk_process;

    stimulus: process
    begin 
    
        for i in 1 to 1000 loop
                sInput <= not sInput;
                wait for clk_period / 10000;
        end loop;
        sInput <= '1';
        wait for clk_period*50;
        sInput <= '0';
        wait for clk_period;
        wait;
    end process stimulus;
    
end Simulation;
