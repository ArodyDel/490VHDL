----------------------------------------------------------------------
-- File Downloaded from http://www.nandland.com
----------------------------------------------------------------------
-- This file contains the UART Receiver.  This receiver is able to
-- receive 8 bits of serial data, one start bit, one stop bit,
-- and no parity bit.  When receive is complete o_rx_dv will be
-- driven high for one clock cycle.
-- 
-- Set Generic g_CLKS_PER_BIT as follows:
-- g_CLKS_PER_BIT = (Frequency of i_Clk)/(Frequency of UART)
-- Example: 10 MHz Clock, 115200 baud UART
-- (10000000)/(115200) = 87
--
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
 
entity UART_RX is
  generic (
    g_CLKS_PER_BIT : integer := 10416     -- Needs to be set correctly
    );
  port (
    i_Clk       : in  std_logic;
    i_RX_Serial : in  std_logic;
    o_RX_DV     : out std_logic;
    o_RX_Byte   : out std_logic_vector(7 downto 0);
    o_buff      : out std_logic_vector(31 downto 0);
    o_ledBuff  :  out std_logic_vector(31 downto 0);
    o_buffDone :out std_logic;
    o_status: out std_logic_vector(1 downto 0)
    
    );
end UART_RX;
 
 
architecture rtl of UART_RX is
 
  
  type t_SM_Main is (s_Idle, s_RX_Start_Bit, s_RX_Data_Bits,
                     s_RX_Stop_Bit, s_Cleanup);
  signal r_SM_Main : t_SM_Main := s_Idle;
 
  signal r_RX_Data_R : std_logic := '0';
  signal r_RX_Data   : std_logic := '0';
   
  signal r_Clk_Count : integer range 0 to g_CLKS_PER_BIT-1 := 0;
  signal r_Bit_Index : integer range 0 to 7 := 0;  -- 8 Bits Total
  signal r_RX_Byte   : std_logic_vector(7 downto 0) := (others => '0');
  signal r_RX_DV     : std_logic := '0';
  
   signal state       : integer range 0 to 10:=0;
   signal buff: std_logic_vector(31 downto 0); 
   signal ledBuff:std_logic_vector(31 downto 0);
   signal subASCII : std_logic_vector(7 downto 0):="00110000";
   signal buffDone:std_logic:='0';
   signal status:std_logic_vector(1 downto 0):="00";
   signal BlueIN:std_logic_vector(31 downto 0);
   signal first: std_logic:='0'; 
   
begin
 
  -- Purpose: Double-register the incoming data.
  -- This allows it to be used in the UART RX Clock Domain.
  -- (It removes problems caused by metastabiliy)
  p_SAMPLE : process (i_Clk)
  begin
    if rising_edge(i_Clk) then
      r_RX_Data_R <= i_RX_Serial;
      r_RX_Data   <= r_RX_Data_R;
    end if;
  end process p_SAMPLE;
   
 
  -- Purpose: Control RX state machine
  p_UART_RX : process (i_Clk)
  begin
    if rising_edge(i_Clk) then
         
      case r_SM_Main is
        
        when s_Idle =>
          r_RX_DV     <= '0';
          r_Clk_Count <= 0;
          r_Bit_Index <= 0;          
          buffDone<='0';
 
          if r_RX_Data = '0' then       -- Start bit detected
            r_SM_Main <= s_RX_Start_Bit;
          else
            r_SM_Main <= s_Idle;
          end if;
 
           
        -- Check middle of start bit to make sure it's still low
        when s_RX_Start_Bit =>
          if r_Clk_Count = (g_CLKS_PER_BIT-1)/2 then
            if r_RX_Data = '0' then
              r_Clk_Count <= 0;  -- reset counter since we found the middle
              r_SM_Main   <= s_RX_Data_Bits;
            else
              r_SM_Main   <= s_Idle;
            end if;
          else
            r_Clk_Count <= r_Clk_Count + 1;
            r_SM_Main   <= s_RX_Start_Bit;
          end if;
 
           
        -- Wait g_CLKS_PER_BIT-1 clock cycles to sample serial data
        when s_RX_Data_Bits =>
          if r_Clk_Count < g_CLKS_PER_BIT-1 then
            r_Clk_Count <= r_Clk_Count + 1;
            r_SM_Main   <= s_RX_Data_Bits;
          else
            r_Clk_Count            <= 0;
            r_RX_Byte(r_Bit_Index) <= r_RX_Data;
             
            -- Check if we have sent out all bits
            if r_Bit_Index < 7 then
              r_Bit_Index <= r_Bit_Index + 1;
              r_SM_Main   <= s_RX_Data_Bits;
            else
              r_Bit_Index <= 0;
              r_SM_Main   <= s_RX_Stop_Bit;
           if(r_RX_Byte=X"0A" )then
                  if(state=0) then
                  buff(31 downto 24)<=X"00";
                  ledBuff(31 downto 24)<=buff(23 downto 24);
                  buff(23 downto 16)<=X"00";
                  ledBuff(23 downto 16)<=buff(23 downto 16);
                  buff(15 downto 8)<=X"00";
                  ledBuff(15 downto 8)<=buff(15 downto 8);
                  buff(7 downto 0)<=X"00";
                  ledBuff(7 downto 0)<=buff(7 downto 0);                                
                 
                        if(first='0') then
           BlueIN<=buff;
           
           else
               if(BlueIN<buff)then
               status<="01";
               elsif(BlueIN>buff) then
               status<="10";
               elsif(BlueIN=buff) then
               status<="11";
               else
               status<="00";
               end if;
          end if;                 
                 
                 
                  elsif (state=1) then
                  buff(23 downto 16)<=X"00";
                  ledBuff(23 downto 16)<=buff(23 downto 16);
                  buff(15 downto 8)<=X"00";
                  ledBuff(15 downto 8)<=buff(15 downto 8);
                  buff(7 downto 0)<=X"00";
                  ledBuff(7 downto 0)<=buff(7 downto 0);
                        if(first='0') then
           BlueIN<=buff;
           
           else
               if(BlueIN<buff)then
               status<="01";
               elsif(BlueIN>buff) then
               status<="10";
               elsif(BlueIN=buff) then
               status<="11";
               else
               status<="00";
               end if;
          end if;     
                   
                   elsif (state=2) then
                   buff(15 downto 8)<=X"00";
                   ledBuff(15 downto 8)<=buff(15 downto 8 );
                  buff(7 downto 0)<=X"00";
                  ledBuff(7 downto 0)<=buff(7 downto 0);
                                
                        if(first='0') then
           BlueIN<=buff;
           
           else
               if(BlueIN<buff)then
               status<="01";
               elsif(BlueIN>buff) then
               status<="10";
               elsif(BlueIN=buff) then
               status<="11";
               else
               status<="00";
               end if;
          end if;
                 elsif (state=3) then
                        if(first='0') then
                 BlueIN<=buff;
                 
                 else
                     if(BlueIN<buff)then
                     status<="01";
                     elsif(BlueIN>buff) then
                     status<="10";
                     elsif(BlueIN=buff) then
                     status<="11";
                     else
                     status<="00";
                     end if;
                end if;  
                  
                  end if;                
             state<=0;
             first<='1';
             buffDone<='1';
             end if;
             if(r_RX_Byte/=X"0A") then
                  if(state=0) then
               buff(31 downto 24)<=r_RX_Byte;                                     
               --ledBuff(31 downto 24)<=X"00";
               ledBuff(31 downto 24)<=buff(31 downto 24)-subASCII(7 downto 0);
               buffDone<='0'; 
               elsif (state=1) then
               buff(23 downto 16)<=r_RX_Byte;
               --ledBuff(23 downto 16)<=X"00";
               ledBuff(23 downto 16)<=buff(23 downto 16)-subASCII(7 downto 0);
               elsif(state=2) then
               buff(15 downto 8)<=r_RX_Byte;
               --ledBuff(15 downto 8)<=X"00";
               ledBuff(15 downto 8)<=buff(15 downto 8)-subASCII(7 downto 0);
               elsif (state=3) then
               buff(7 downto 0)<=r_RX_Byte;
               --ledBuff(7 downto 0)<=X"00";
               ledBuff(7 downto 0)<=buff(7 downto 0)-subASCII(7 downto 0);
   
               end if;
               state<=state+1;
                         
          end if;
              
            end if;
          end if;
 
 
        -- Receive Stop bit.  Stop bit = 1
        when s_RX_Stop_Bit =>
          -- Wait g_CLKS_PER_BIT-1 clock cycles for Stop bit to finish
          if r_Clk_Count < g_CLKS_PER_BIT-1 then
            r_Clk_Count <= r_Clk_Count + 1;
            r_SM_Main   <= s_RX_Stop_Bit;
          else
            r_RX_DV     <= '1';
            r_Clk_Count <= 0;
            r_SM_Main   <= s_Cleanup;        
            
            
          end if;
 
                   
        -- Stay here 1 clock
        when s_Cleanup =>
          r_SM_Main <= s_Idle;
          r_RX_DV   <= '0';
          
           
        
        when others =>
          r_SM_Main <= s_Idle;
          
 
      end case;
    end if;
  end process p_UART_RX;
 
  o_RX_DV   <= r_RX_DV;
  o_RX_Byte <= r_RX_Byte;
  o_buff<=buff;
  o_buffDone<=buffDone;
  o_ledbuff<=ledbuff;
  o_status<=status;
   
end rtl;