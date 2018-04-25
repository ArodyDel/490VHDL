
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/14/2018 02:40:49 PM
-- Design Name: 
-- Module Name: seven_segment_display_VHDL - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity seven_segment_display_VHDL is
    Port ( clock_100Mhz : in STD_LOGIC;-- 100Mhz clock on Basys 3 FPGA board
           reset: in STD_LOGIC; -- reset
           switches: in STD_LOGIC_VECTOR(15 downto 0);
           Anode_Activate : out STD_LOGIC_VECTOR (3 downto 0);-- 4 Anode signals
           cathode : out STD_LOGIC_VECTOR (6 downto 0);-- Cathode patterns of 7-segment display
           cathode_2: out STD_LOGIC_VECTOR(15 downto 0);
           btnU: in STD_Logic
           );
end seven_segment_display_VHDL;

architecture Behavioral of seven_segment_display_VHDL is

signal one_second_enable: std_logic;

signal LED_BCD: STD_LOGIC_VECTOR (3 downto 0);
signal LED_BCD_lower: STD_LOGIC_VECTOR(3 downto 0);
signal refresh_counter: STD_LOGIC_VECTOR (20 downto 0);
signal LED_activating_counter: std_logic_vector(1 downto 0);
signal latched1: std_logic_vector(3 downto 0);
signal latched2: std_logic_vector(3 downto 0);
signal latched3: std_logic_vector(3 downto 0);
signal latched4: std_logic_vector(3 downto 0);
begin
-- VHDL code for BCD to 7-segment decoder
-- Cathode patterns of the 7-segment LED display 
process(LED_BCD)
begin
     
    case LED_BCD is
    when "0000" => cathode <= "0000001"; -- "0"     
    when "0001" => cathode <= "1001111"; -- "1" 
    when "0010" => cathode <= "0010010"; -- "2" 
    when "0011" => cathode <= "0000110"; -- "3" 
    when "0100" => cathode <= "1001100"; -- "4" 
    when "0101" => cathode <= "0100100"; -- "5" 
    when "0110" => cathode <= "0100000"; -- "6" 
    when "0111" => cathode <= "0001111"; -- "7" 
    when "1000" => cathode <= "0000000"; -- "8"     
    when "1001" => cathode <= "0000100"; -- "9" 
    when "1010" => cathode <= "0000010"; -- a
    when "1011" => cathode <= "1100000"; -- b
    when "1100" => cathode <= "0110001"; -- C
    when "1101" => cathode <= "1000010"; -- d
    when "1110" => cathode <= "0110000"; -- E
    when "1111" => cathode <= "0111000"; -- F
    end case;
end process;



process(clock_100Mhz,btnU,LED_activating_counter)
begin
    if(btnU='0') then
        elsif(rising_edge(clock_100Mhz)) then
             latched1 <= switches(15 downto 12);
             latched2 <= switches(11 downto 8);
             latched3 <= switches(7 downto 4);
             latched4 <= switches(3 downto 0);
             
    end if;
end process;

process(clock_100Mhz,reset)
begin
    if(reset='1') then
        refresh_counter <= (others => '0');
    elsif(rising_edge(clock_100Mhz)) then
        refresh_counter <= refresh_counter + 1;
    end if;
end process;

 LED_activating_counter <= refresh_counter(20 downto 19);

process(LED_activating_counter,latched1,latched2,latched3,latched4)
begin
    case LED_activating_counter is
    when "00" =>
        --if(btnsignal="01") then
        Anode_Activate <= "0111";
        LED_BCD <= latched1;
        cathode_2(15 downto 12) <= switches(15 downto 12);
        --end if;
        
    when "01" =>
        --if(btnsignal="01") then
        Anode_Activate <= "1011"; 
        LED_BCD <= latched2;
        cathode_2(11 downto 8) <= switches(11 downto 8);
        --end if;
    when "10" =>
        --if(btnsignal="01") then
        Anode_Activate <= "1101"; 
        
        LED_BCD <= latched3;
         cathode_2(7 downto 4) <= switches(7 downto 4);
         --end if;
        
    when "11" =>
        --if(btnsignal="01") then
        Anode_Activate <= "1110";
        LED_BCD <= latched4;
        cathode_2(3 downto 0) <= switches(3 downto 0);
        --end if;
            
    end case;
end process;
end Behavioral;