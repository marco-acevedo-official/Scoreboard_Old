ibrary IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Synchronizer is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           async_signal : in STD_LOGIC;  -- Asynchronous input signal
           synced_signal : out STD_LOGIC -- Synchronized output signal
           );
end Synchronizer;

architecture Behavioral of Synchronizer is
    signal synch0, synch1 : STD_LOGIC := '0';
begin
    -- Synchronization process
    process(clk, rst)
    begin
        if rst = '1' then
            synch0 <= '0';
            synch1 <= '0';
        elsif rising_edge(clk) then
            synch0 <= async_signal; -- First flip-flop
            synch1 <= synch0;      -- Second flip-flop
        end if;
    end process;
    
    -- Output the synchronized signal
    synced_signal <= synch1;
end Behavioral;