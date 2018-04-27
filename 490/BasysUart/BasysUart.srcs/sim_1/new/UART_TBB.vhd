----------------------------------------------------------------------
-- File Downloaded from http://www.nandland.com
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
 
entity uart_tb is
end uart_tb;
 
architecture behave of uart_tb is
 
  component uart_tx is
    generic (
      g_CLKS_PER_BIT : integer := 115   -- Needs to be set correctly
      );
    port (
      i_clk       : in  std_logic;
      i_tx_dv     : in  std_logic;
      i_tx_byte   : in  std_logic_vector(7 downto 0);
      o_tx_active : out std_logic;
      o_tx_serial : out std_logic;
      o_tx_done   : out std_logic
      );
  end component uart_tx;
 
  component uart_rx is
    generic (
      g_CLKS_PER_BIT : integer := 115   -- Needs to be set correctly
      );
    port (
      i_clk       : in  std_logic;
      i_rx_serial : in  std_logic;
      o_rx_dv     : out std_logic;
      o_rx_byte   : out std_logic_vector(7 downto 0);
      o_buff      : out std_logic_vector(31 downto 0);
      o_ledBuff  :  out std_logic_vector(31 downto 0);
      o_buffDone :out std_logic
      );
  end component uart_rx;
 
   
  -- Test Bench uses a 10 MHz Clock
  -- Want to interface to 115200 baud UART
  -- 10000000 / 115200 = 87 Clocks Per Bit.
  constant c_CLKS_PER_BIT : integer := 87;
 
  constant c_BIT_PERIOD : time := 8680 ns;
   
  signal r_CLOCK     : std_logic                    := '0';
  signal r_TX_DV     : std_logic                    := '0';
  signal r_TX_BYTE   : std_logic_vector(7 downto 0) := (others => '0');
  signal w_TX_SERIAL : std_logic;
  signal w_TX_DONE   : std_logic;
  signal w_RX_DV     : std_logic;
  signal w_RX_BYTE   : std_logic_vector(7 downto 0);
  signal r_RX_SERIAL : std_logic := '1';
   signal Mbuff: std_logic_vector(31 downto 0); 
  signal MledBuff:std_logic_vector(31 downto 0);
  signal i_data_in       : std_logic_vector(7 downto 0):=X"39";
  signal flag_buff :std_logic;
  signal initflag:std_logic:='1';
  
    type MSG is array(0 to 165) of std_logic_vector(7 downto 0);
  signal fullMSG:MSG:=(X"57", X"65", X"6c", X"63", X"6f", X"6d", X"65", X"20", X"74", X"6f", X"20", X"74", X"68", X"65", X"20", 
  X"47", X"55", X"45", X"53", X"53", X"49", X"4e", X"47", X"20", X"47", X"41", X"4d", X"45", X"0a", X"50", X"6c", X"65", X"61", 
  X"73", X"65", X"20", X"65", X"6e", X"74", X"65", X"72", X"20", X"61", X"20", X"6e", X"75", X"6d", X"62", X"65", X"72", X"20", 
  X"66", X"6f", X"72", X"20", X"79", X"6f", X"75", X"72", X"20", X"6f", X"70", X"70", X"6f", X"6e", X"65", X"6e", X"74", X"20", 
  X"74", X"6f", X"20", X"67", X"75", X"65", X"73", X"73", X"0a", X"4f", X"4e", X"4c", X"59", X"20", X"50", X"55", X"54", X"20", 
  X"4e", X"55", X"4d", X"42", X"45", X"52", X"53", X"20", X"46", X"52", X"4f", X"4d", X"20", X"30", X"20", X"54", X"4f", X"20", 
  X"39", X"39", X"39", X"0a", X"0a", X"57", X"61", X"69", X"74", X"20", X"75", X"6e", X"74", X"69", X"6c", X"20", X"62", X"6f", 
  X"74", X"68", X"20", X"70", X"6c", X"61", X"79", X"65", X"72", X"73", X"20", X"61", X"72", X"65", X"20", X"72", X"65", X"61", 
  X"64", X"79", X"2c", X"68", X"69", X"74", X"20", X"73", X"65", X"6e", X"64", X"20", X"61", X"74", X"20", X"73", X"61", X"6d", 
  X"65", X"20", X"74", X"69", X"6d", X"65", X"0a");
  signal MSG_Index : integer range 0 to 166 := 0;
   
  -- Low-level byte-write
  
 
   
begin
 
  -- Instantiate UART transmitter
  UART_TX_INST : uart_tx
    generic map (
      g_CLKS_PER_BIT => c_CLKS_PER_BIT
      )
    port map (
      i_clk       => r_CLOCK,
      i_tx_dv     => r_TX_DV,
      i_tx_byte   => r_TX_BYTE,
      o_tx_active => open,
      o_tx_serial => w_TX_SERIAL,
      o_tx_done   => w_TX_DONE
      );
 
  -- Instantiate UART Receiver
   UART_RX_INST : uart_rx
       generic map (
         g_CLKS_PER_BIT => c_CLKS_PER_BIT
         )
       port map (
         i_clk       => r_CLOCK,
         i_rx_serial => r_RX_SERIAL,
         o_rx_dv     => w_RX_DV,
         o_rx_byte   => w_RX_BYTE,
         o_buff=>Mbuff,
         o_ledbuff=>MledBuff,
         o_buffDone=>flag_buff
         );

  r_CLOCK <= not r_CLOCK after 50 ns;
   
  process is
  begin
 
    -- Tell the UART to send a command.
    wait until rising_edge(r_CLOCK);
        if(w_TX_DONE='0'and r_TX_DV/='1') then 
        if(initflag='1') then
            r_TX_DV   <= '1';
            r_TX_BYTE <=fullMSG(MSG_Index);
            --r_TX_DV   <= '0'; 
            end if;
        end if;
        wait until rising_edge(r_CLOCK);
        if( w_TX_DONE ='1') then
            if(MSG_Index=10) then
            initflag<='0';
            end if;
         r_TX_DV   <= '0';
         MSG_Index<=MSG_Index+1;
         
        end if;
 
     
    -- Send a command to the UART
    wait until rising_edge(r_CLOCK);
    
    
         r_RX_SERIAL <= '0';
        wait for c_BIT_PERIOD;
     
        -- Send Data Byte
        for index in 0 to 7 loop
          r_RX_SERIAL <= i_data_in(index);
          wait for c_BIT_PERIOD;
        end loop;  -- ii
     
        -- Send Stop Bit
        r_RX_SERIAL <= '1';
        wait for c_BIT_PERIOD;
 wait until rising_edge(r_CLOCK);
 i_data_in<=X"0A";
 wait until rising_edge(r_CLOCK);
 
 
      r_RX_SERIAL <= '0';
     wait for c_BIT_PERIOD;
  
     -- Send Data Byte
     for index in 0 to 7 loop
       r_RX_SERIAL <= i_data_in(index);
       wait for c_BIT_PERIOD;
     end loop;  -- ii
  
     -- Send Stop Bit
     r_RX_SERIAL <= '1';
     wait for c_BIT_PERIOD;
wait until rising_edge(r_CLOCK);
    -- Check that the correct command was received
   -- if w_RX_BYTE = X"3F" then
     -- report "Test Passed - Correct Byte Received" severity note;
   -- else
     -- report "Test Failed - Incorrect Byte Received" severity note;
   -- end if;
 
   -- assert false report "Tests Complete" severity failure;
     
  end process;
   
end behave;