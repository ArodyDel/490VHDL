--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
--Date        : Fri Mar 30 23:32:28 2018
--Host        : arody-PC running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target UART_wrapper.bd
--Design      : UART_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity UART_wrapper is
  port (
    rx_0 : in STD_LOGIC;
    s_axi_aclk_0 : in STD_LOGIC;
    s_axi_aresetn_0 : in STD_LOGIC;
    s_axi_rdata_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    tx_0 : out STD_LOGIC
  );
end UART_wrapper;

architecture STRUCTURE of UART_wrapper is
  component UART is
  port (
    tx_0 : out STD_LOGIC;
    rx_0 : in STD_LOGIC;
    s_axi_aclk_0 : in STD_LOGIC;
    s_axi_aresetn_0 : in STD_LOGIC;
    s_axi_rdata_0 : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component UART;
begin
UART_i: component UART
     port map (
      rx_0 => rx_0,
      s_axi_aclk_0 => s_axi_aclk_0,
      s_axi_aresetn_0 => s_axi_aresetn_0,
      s_axi_rdata_0(31 downto 0) => s_axi_rdata_0(31 downto 0),
      tx_0 => tx_0
    );
end STRUCTURE;
