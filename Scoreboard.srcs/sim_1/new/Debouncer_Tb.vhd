library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_bit.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;
use IEEE.math_real.all;
use IEEE.math_complex.all;

entity Debouncer_Tb is
end Debouncer_Tb;

architecture Simulation of Debouncer_Tb is
    signal sClk : STD_LOGIC := '0';
    signal sInput : STD_LOGIC := '0';
    signal sSync : STD_LOGIC := '0';
    signal sDebounced : STD_LOGIC := '0';
    signal sReg : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    constant clk_period : time := 10 ns;

    component Debouncer is
    Generic(
    clock_period : time
    );
    Port ( 
           clk : in STD_LOGIC;
           input_signal : in STD_LOGIC;
           sync_signal : in STD_LOGIC;  -- Synchronized input signal
           debounced_signal : out STD_LOGIC; -- Debounced output signal
           reg_out : out STD_LOGIC_VECTOR(15 downto 0)
           );
    end component;

begin

    UUT_Debouncer: Debouncer 
    generic map(
    clock_period => clk_period
    )
    port map (
        clk => sClk,
        input_signal => sInput,
        sync_signal => sSync,
        debounced_signal => sDebounced,
        reg_out => sReg
    );

    clk_process: process
    begin                                       
        while true loop  -- Continuous clock generation
            sClk <= '0';                            
            wait for clk_period / 2;                
            sClk <= '1';                            
            wait for clk_period / 2;                
        end loop;
    end process clk_process;

    stimulus: process
    begin 
    
        for i in 1 to 9999 loop
            if i > 0 and i < 8000 then --Unstable input for 100 iterations
                sInput <= not sInput;
                wait for clk_period / 1000;
            elsif i = 8000 then
                sInput <= '1';
                wait for clk_period*50;
                sInput <= '0';
                wait for clk_period;
            end if;
        end loop;
        
                for i in 1 to 9999 loop
            if i > 0 and i < 8000 then --Unstable input for 100 iterations
                sInput <= not sInput;
                wait for clk_period / 1000;
            elsif i = 8000 then
                sInput <= '1';
                wait for clk_period*50;
                sInput <= '0';
                wait for clk_period;
            end if;
        end loop;
        
        
        wait;
    end process stimulus;
    
end Simulation;
