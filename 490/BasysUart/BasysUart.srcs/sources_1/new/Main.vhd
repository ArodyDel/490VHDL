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
      o_buffDone :out std_logic;
      o_status: out std_logic_vector(1 downto 0)
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
  signal Mstatus: std_logic_vector(1 downto 0);
  
  type MSG is array(0 to 166) of std_logic_vector(7 downto 0);
  signal fullMSG:MSG:=(X"57", X"65", X"6c", X"63", X"6f", X"6d", X"65", X"20", X"74", X"6f", X"20", X"74", X"68", X"65", X"20", 
  X"47", X"55", X"45", X"53", X"53", X"49", X"4e", X"47", X"20", X"47", X"41", X"4d", X"45", X"0a", X"50", X"6c", X"65", X"61", 
  X"73", X"65", X"20", X"65", X"6e", X"74", X"65", X"72", X"20", X"61", X"20", X"6e", X"75", X"6d", X"62", X"65", X"72", X"20", 
  X"66", X"6f", X"72", X"20", X"79", X"6f", X"75", X"72", X"20", X"6f", X"70", X"70", X"6f", X"6e", X"65", X"6e", X"74", X"20", 
  X"74", X"6f", X"20", X"67", X"75", X"65", X"73", X"73", X"0a", X"4f", X"4e", X"4c", X"59", X"20", X"50", X"55", X"54", X"20", 
  X"4e", X"55", X"4d", X"42", X"45", X"52", X"53", X"20", X"46", X"52", X"4f", X"4d", X"20", X"30", X"20", X"54", X"4f", X"20", 
  X"39", X"39", X"39", X"39", X"0a", X"0a", X"57", X"61", X"69", X"74", X"20", X"75", X"6e", X"74", X"69", X"6c", X"20", X"62", 
  X"6f", X"74", X"68", X"20", X"70", X"6c", X"61", X"79", X"65", X"72", X"73", X"20", X"61", X"72", X"65", X"20", X"72", X"65",
  X"61", X"64", X"79", X"2c", X"68", X"69", X"74", X"20", X"73", X"65", X"6e", X"64", X"20", X"61", X"74", X"20", X"73", X"61", 
  X"6d", X"65", X"20", X"74", X"69", X"6d", X"65", X"0a");
  signal MSG_Index : integer := 0;
  
  type HIGHMSG is array(0 to 8) of std_logic_vector(7 downto 0);
  signal fullHIGH:HIGHMSG:=(X"54", X"6f", X"6f", X"20", X"48", X"49", X"47", X"48", X"0a");
  signal HIGHMSG_Index: integer :=10;
  signal highFlag:std_logic:='0';
  
  type LOWMSG is array(0 to 7) of std_logic_vector(7 downto 0);
  signal fullLOW:LOWMSG:=(X"54", X"6f", X"6f", X"20", X"4c", X"4f", X"57", X"0a");
  signal LOWMSG_Index: integer :=10;
  signal lowFlag:std_logic:='0';
  
  type WINMSG is array(0 to 8) of std_logic_vector(7 downto 0);
  signal fullWIN:WINMSG:=(X"59", X"4f", X"55", X"20", X"57", X"49", X"4e", X"21", X"0a");
  signal WINMSG_Index: integer:=10;
  signal winFlag:std_logic:='0'; 
  
  
  signal Mbuff: std_logic_vector(31 downto 0); 
  signal MledBuff:std_logic_vector(31 downto 0);
  signal ledB: std_logic_vector(31 downto 0);
  signal BlueInput: std_logic_vector(31 downto 0):=X"00000000";
  signal BlueGuess: std_logic_vector(31 downto 0);
  signal initflag:std_logic:='1';
  signal inputFlag:std_logic:='1';
  signal guessFlag:std_logic:='0'; 
  signal buffdone:std_logic;
  signal BlueInputINT : integer := 0;
  signal BlueGuessINT : integer:=0;
  signal activeFlag:integer:=0;  
  signal change :std_logic; 
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
          o_buffDone=>buffdone,
          o_status=>Mstatus
          );









          
process(initFlag,highFlag,lowFlag,winFlag,w_TX_DONE,r_TX_DV,r_RX_SERIAL)
     begin
     
        -- Tell the UART to send a command.

       -- w_TX_DONE<='1';
       if(rising_edge(r_CLOCK)) then
        Case w_TX_DONE  is 
        when '0'=>
        --r_TX_BYTE <= fullMSG(MSG_Index);
            if(initflag='1' and r_TX_DV = '0') then
                r_TX_DV   <= '1';
                --r_TX_BYTE <= X"49";
                r_TX_BYTE <= fullMSG(MSG_Index);
                end if;
             if(highFlag='1' and r_TX_DV = '0') then
                r_TX_DV   <= '1';
                r_TX_BYTE <= fullHIGH(HIGHMSG_Index); 
                end if;
             if(lowFlag='1' and r_TX_DV = '0') then
                   r_TX_DV   <= '1';
                   r_TX_BYTE <= fullLOW(LOWMSG_Index);
                   end if;
             if(winFlag='1' and r_TX_DV = '0') then
                      r_TX_DV   <= '1';
                      r_TX_BYTE <= fullWIN(WINMSG_Index);                                     
                end if;
                
           when'1'=> 
                initflag<='0';
                highFlag<='0';
                lowFlag<='0';
                winFlag<='0';            
                r_TX_DV   <= '0';
                
 
            end case;
       end if;
       if(falling_edge(r_CLOCK))then
         if(initflag ='0')then
                if(MSG_Index>=167)then                                 
                    initflag<='0';
                   
                else
                    MSG_Index<=MSG_Index+1;
                    initflag<='1';
                end if;
             end if;   
             if(highFlag='0')then
                if(HIGHMSG_Index>=9)then                                 
                 highFlag<='0';
                 if(change = '1' ) then
                    if(BlueGuessINT>BlueInputINT) then
                        HIGHMSG_Index<=0;
                        highFlag<='1';
                                                  
                    end if;
                 end if;
                else
                 HIGHMSG_Index<=HIGHMSG_Index+1;
                 highFlag<='1';
                end if; 
                end if;                  
             if(lowFlag='0')then
                   if(LOWMSG_Index>=8)then                                 
                    lowFlag<='0';
                 if(change = '1' ) then
                       if(BlueGuessINT<BlueInputINT) then
                           LOWMSG_Index<=0;
                           lowFlag<='1';
                                                     
                       end if;
                    end if;                                   
                   else
                    LOWMSG_Index<=LOWMSG_Index+1;
                    lowFlag<='1';
                   end if;
                  end if;
             if(winFlag='0')then
                      if(WINMSG_Index>=9)then                                 
                       winFlag<='0';
                 if(change = '1' ) then
                          if(BlueGuessINT=BlueInputINT) then
                              WINMSG_Index<=0;
                              winFlag<='1';
                                                        
                          end if;
                       end if;                                      
                      else
                       WINMSG_Index<=WINMSG_Index+1;
                       winFlag<='1';
                      end if;                               
            
            end if;                        
         
         
         end if;      
        end process;

process(initFLag,inputFlag)
variable GINT,IINT  : integer;
begin

       Case buffdone is
        when'1'=>
            
            

            
            if(guessFlag='0' and inputFlag='0') then
            
             if (BlueGuess /= Mbuff)then
             
             BlueGuess(31 downto 24)<=Mbuff(31 downto 24);
             BlueGuess(23 downto 16)<=Mbuff(23 downto 16);
             BlueGuess(15 downto 8)<=Mbuff(15 downto 8);
             BlueGuess(7 downto 0)<=Mbuff(7 downto 0);
             
--             BlueGuessINT<=to_integer(unsigned(BlueGuess));
            if(BlueGuess(31 downto 24)=X"00")then
             GINT :=0;
             else
                ledB(31 downto 24)<=BlueGuess(31 downto 24)-subASCII(7 downto 0);    --ones
                GINT := to_integer(unsigned(ledB(31 downto 24)));
                
                if(BlueGuess(23 downto 16)/=X"00")then                               --tens
                     GINT:=GINT*10;
                     ledB(23 downto 16)<=BlueGuess(23 downto 16)-subASCII(7 downto 0);
                     GINT :=GINT + to_integer(unsigned(ledB(23 downto 16)));
                     
                             if(BlueGuess(15 downto 8)/=X"00")then                  --hundreds
                                     GINT:=GINT*10;
                                     ledB(15 downto 8)<=BlueGuess(15 downto 8)-subASCII(7 downto 0);
                                     GINT :=GINT + to_integer(unsigned(ledB(15 downto 8)));
                                                    
                                         if(BlueGuess(7 downto 0)/=X"00")then      --thousands
                                             GINT:=GINT*10;
                                             ledB(7 downto 0)<=BlueGuess(7 downto 0)-subASCII(7 downto 0);
                                             GINT :=GINT + to_integer(unsigned(ledB(7 downto 0)));
                                             end if;
                                           end if;
                                          end if;
                                         end if;             
             BlueGuessINT<=GINT;
             change <= '1';
             
             else
             change <='0' after 1 ps ;
             end if;
             
--            BlueGuess(31 downto 24)<=Mbuff(31 downto 24);
--            BlueGuess(23 downto 16)<=Mbuff(23 downto 16);
--            BlueGuess(15 downto 8)<=Mbuff(15 downto 8);
--            BlueGuess(7 downto 0)<=Mbuff(7 downto 0);
            
            
            
            
            
            ledB(31 downto 24)<=BlueGuess(31 downto 24)-subASCII(7 downto 0);
            ledB(23 downto 16)<=BlueGuess(23 downto 16)-subASCII(7 downto 0);
            ledB(15 downto 8)<=BlueGuess(15 downto 8)-subASCII(7 downto 0);
            ledB(7 downto 0)<=BlueGuess(7 downto 0)-subASCII(7 downto 0);
            led(15 downto 12)<=ledB(27 downto 24);
            led(11 downto 8)<=ledB(19 downto 16);
            led(7 downto 4)<=ledB(11 downto 8);
            led(3 downto 0)<=ledB(3 downto 0);            
            
            elsif (initflag = '0' and inputFlag='1') then
            BlueInput(31 downto 24)<=Mbuff(31 downto 24);
            BlueInput(23 downto 16)<=Mbuff(23 downto 16);
            BlueInput(15 downto 8)<=Mbuff(15 downto 8);
            BlueInput(7 downto 0)<=Mbuff(7 downto 0);
            
            BlueGuess(31 downto 24)<=Mbuff(31 downto 24);
            BlueGuess(23 downto 16)<=Mbuff(23 downto 16);
            BlueGuess(15 downto 8)<=Mbuff(15 downto 8);
            BlueGuess(7 downto 0)<=Mbuff(7 downto 0);
            if(BlueInput(31 downto 24)=X"00")then
            IINT :=0;
            else
               ledB(31 downto 24)<=BlueInput(31 downto 24)-subASCII(7 downto 0);    --ones
               IINT := to_integer(unsigned(ledB(31 downto 24)));
               
               if(BlueInput(23 downto 16)/=X"00")then                               --tens
                    IINT:=IINT*10;
                    ledB(23 downto 16)<=BlueInput(23 downto 16)-subASCII(7 downto 0);
                    IINT :=IINT + to_integer(unsigned(ledB(23 downto 16)));
                    
                            if(BlueInput(15 downto 8)/=X"00")then                  --hundreds
                                    IINT:=IINT*10;
                                    ledB(15 downto 8)<=BlueInput(15 downto 8)-subASCII(7 downto 0);
                                    IINT :=IINT + to_integer(unsigned(ledB(15 downto 8)));
                                                   
                                        if(BlueInput(7 downto 0)/=X"00")then      --thousands
                                            IINT:=IINT*10;
                                            ledB(7 downto 0)<=BlueInput(7 downto 0)-subASCII(7 downto 0);
                                            IINT :=IINT + to_integer(unsigned(ledB(7 downto 0)));
                                            end if;
                                          end if;
                                         end if;
                                        end if; 
--            BlueInputINT<=to_integer(unsigned(BlueInput));
            ledB(31 downto 24)<=BlueInput(31 downto 24)-subASCII(7 downto 0);
            ledB(23 downto 16)<=BlueInput(23 downto 16)-subASCII(7 downto 0);
            ledB(15 downto 8)<=BlueInput(15 downto 8)-subASCII(7 downto 0);
            ledB(7 downto 0)<=BlueInput(7 downto 0)-subASCII(7 downto 0);
            led(15 downto 12)<=ledB(27 downto 24);
            led(11 downto 8)<=ledB(19 downto 16);
            led(7 downto 4)<=ledB(11 downto 8);
            led(3 downto 0)<=ledB(3 downto 0);
            inputFlag<='0';           
             BlueInputINT<=IINT;
                       
            end if;
            
            
        when others=>
                
            end case;

--ledB(31 downto 24)<=Mbuff(31 downto 24)-subASCII(7 downto 0);
--ledB(23 downto 16)<=Mbuff(23 downto 16)-subASCII(7 downto 0);
--ledB(15 downto 8)<=Mbuff(15 downto 8)-subASCII(7 downto 0);
--ledB(7 downto 0)<=Mbuff(7 downto 0)-subASCII(7 downto 0);
--led(15 downto 12)<=ledB(27 downto 24);
--led(11 downto 8)<=ledB(19 downto 16);
--led(7 downto 4)<=ledB(11 downto 8);
--led(3 downto 0)<=ledB(3 downto 0);
end process;




end Behavioral;
