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
      led : out std_logic_vector(7 downto 0);
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
      o_Rx_Byte   : out std_logic_vector(7 downto 0)
      );
  end component uart_rx;


  constant c_CLKS_PER_BIT : integer := 10416;
  constant c_BIT_PERIOD : time := 8680 ns;
 
  signal r_TX_DV     : std_logic                    := '0';
  signal r_TX_BYTE   : std_logic_vector(7 downto 0) := (others => '0');
  
  signal w_TX_DONE   : std_logic;
  signal w_RX_DV     : std_logic;
  signal w_RX_BYTE   : std_logic_vector(7 downto 0);
  

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
          o_rx_byte   => w_RX_BYTE
          );
          
process(r_CLOCK,w_TX_DONE,r_TX_DV)
     begin
     
        -- Tell the UART to send a command.

        
        if(w_TX_DONE='0') then 
            if(rising_edge(r_CLOCK) and r_TX_DV='0') then
                r_TX_DV   <= '1';
                r_TX_BYTE <= X"68";
                
            
            end if;    
       end if;
       
       led<=w_RX_BYTE;
        
      
        end process;

end Behavioral;
