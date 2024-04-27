library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_bit.all;
use IEEE.numeric_std.all;

entity Debouncer is
    Generic (
    clock_period : time := 10 ns
    );
    Port ( 
           clk : in STD_LOGIC;
           input_signal : in STD_LOGIC;
           sync_signal : in STD_LOGIC;  -- Synchronized input signal
           debounced_signal : out STD_LOGIC; -- Debounced output signal
           reg_out : out STD_LOGIC_VECTOR(15 downto 0)
           );
end Debouncer;

architecture Behavioral of Debouncer is
    constant reg_width : integer := 16;
    signal debounce_reg : STD_LOGIC_VECTOR(reg_width-1 downto 0) := (others => '0');
    --signal debounced_sync_out : STD_LOGIC := '0';
    signal asdf : STD_LOGIC := '0';
    
begin
    process(input_signal,clk)
    begin
        for i in 0 to reg_width-1 loop
            if i < reg_width-1 then
                debounce_reg(i) <= debounce_reg(i+1);
            else
                debounce_reg(i) <= input_signal;
            end if;
        end loop;
        ----------------------------------------------------
        if debounce_reg = (debounce_reg'range => '1') then
          debounced_signal <= '1';
        else
            asdf <= '0'; 
            debounced_signal <= '0';
        end if;
        reg_out <= debounce_reg; --For debugging
        
    end process;
    ---------------------------------


    
end Behavioral;