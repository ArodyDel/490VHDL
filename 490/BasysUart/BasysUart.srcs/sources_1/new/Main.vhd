----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2018 06:43:55 PM
-- Design Name: 
-- Module Name: Main - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Main is
port (
      r_CLOCK       : in  std_logic;
      w_TX_SERIAL : out std_logic;
      led : out std_logic_vector(15 downto 0);
      r_RX_SERIAL : in  std_logic
      );
--  Port ( );
end Main;



architecture Behavioral of Main is

 
component UART_TX is
generic (
    g_CLKS_PER_BIT : integer := 10416     -- Needs to be set correctly
    );
  port (
    i_Clk       : in  std_logic;
    i_TX_DV     : in  std_logic;
    i_TX_Byte   : in  std_logic_vector(7 downto 0);
    o_TX_Active : out std_logic;
    o_TX_Serial : out std_logic;
    o_TX_Done   : out std_logic
    );
end component UART_TX;
  
  component uart_rx is
    generic (
      g_CLKS_PER_BIT : integer := 10416   -- Needs to be set correctly
      );
    port (
      i_Clk       : in  std_logic;
      i_Rx_Serial : in  std_logic;
      o_Rx_dv     : out std_logic;
      o_Rx_Byte   : out std_logic_vector(7 downto 0);
      o_buff      : out std_logic_vector(31 downto 0);
      o_ledBuff  :  out std_logic_vector(31 downto 0);
      o_buffDone :out std_logic
      );
  end component uart_rx;


  constant c_CLKS_PER_BIT : integer := 10416;
  constant c_BIT_PERIOD : time := 8680 ns;
 
  signal r_TX_DV     : std_logic                    := '0';
  signal r_TX_BYTE   : std_logic_vector(7 downto 0) := (others => '0');
  signal subASCII : std_logic_vector(7 downto 0):="00110000";
  signal w_TX_DONE   : std_logic;
  signal w_RX_DV     : std_logic;
  signal w_RX_BYTE   : std_logic_vector(7 downto 0);
  
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
  signal Mbuff: std_logic_vector(31 downto 0); 
  signal MledBuff:std_logic_vector(31 downto 0);
  signal ledB: std_logic_vector(31 downto 0);
  signal initflag:std_logic:='1';  
  signal buffdone:std_logic;  

begin

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
          o_buffDone=>buffdone
          );

          
process(initFlag,w_TX_DONE,r_TX_DV,r_RX_SERIAL)
     begin
     
        -- Tell the UART to send a command.

       -- w_TX_DONE<='1';
        if(w_TX_DONE='0'and r_TX_DV/='1') then 
            if(initflag='1') then
                r_TX_DV   <= '1';
                r_TX_BYTE <= fullMSG(MSG_Index);
                --r_TX_DV   <= '0'; 
                end if;
            end if;
            if( w_TX_DONE ='1') then
                if(MSG_Index=166) then
                initflag<='0';
                end if;
             r_TX_DV   <= '0';
             MSG_Index<=MSG_Index+1;
             
            end if;   
       --end if;
       
       
       
       ledB(31 downto 24)<=Mbuff(31 downto 24)-subASCII(7 downto 0);
       ledB(23 downto 16)<=Mbuff(23 downto 16)-subASCII(7 downto 0);
       ledB(15 downto 8)<=Mbuff(15 downto 8)-subASCII(7 downto 0);
       ledB(7 downto 0)<=Mbuff(7 downto 0)-subASCII(7 downto 0);
       led(15 downto 12)<=ledB(27 downto 24);
       led(11 downto 8)<=ledB(19 downto 16);
       led(7 downto 4)<=ledB(11 downto 8);
       led(3 downto 0)<=ledB(3 downto 0);


        
       
       
             
        
        end process;

end Behavioral;
