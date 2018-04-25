--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
--Date        : Fri Mar 30 23:32:28 2018
--Host        : arody-PC running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target UART.bd
--Design      : UART
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity UART is
  port (
    rx_0 : in STD_LOGIC;
    s_axi_aclk_0 : in STD_LOGIC;
    s_axi_aresetn_0 : in STD_LOGIC;
    s_axi_rdata_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    tx_0 : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of UART : entity is "UART,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=UART,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of UART : entity is "UART.hwdef";
end UART;

architecture STRUCTURE of UART is
  component UART_axi_uartlite_0_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    rx : in STD_LOGIC;
    tx : out STD_LOGIC
  );
  end component UART_axi_uartlite_0_0;
  signal axi_uartlite_0_s_axi_rdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_uartlite_0_tx : STD_LOGIC;
  signal rx_0_1 : STD_LOGIC;
  signal s_axi_aclk_0_1 : STD_LOGIC;
  signal s_axi_aresetn_0_1 : STD_LOGIC;
  signal NLW_axi_uartlite_0_interrupt_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_uartlite_0_s_axi_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_uartlite_0_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_uartlite_0_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_uartlite_0_s_axi_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_uartlite_0_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_uartlite_0_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_axi_uartlite_0_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s_axi_aclk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.S_AXI_ACLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s_axi_aclk_0 : signal is "XIL_INTERFACENAME CLK.S_AXI_ACLK_0, ASSOCIATED_RESET s_axi_aresetn_0, CLK_DOMAIN UART_s_axi_aclk_0, FREQ_HZ 100000000, PHASE 0.000";
  attribute X_INTERFACE_INFO of s_axi_aresetn_0 : signal is "xilinx.com:signal:reset:1.0 RST.S_AXI_ARESETN_0 RST";
  attribute X_INTERFACE_PARAMETER of s_axi_aresetn_0 : signal is "XIL_INTERFACENAME RST.S_AXI_ARESETN_0, POLARITY ACTIVE_LOW";
begin
  rx_0_1 <= rx_0;
  s_axi_aclk_0_1 <= s_axi_aclk_0;
  s_axi_aresetn_0_1 <= s_axi_aresetn_0;
  s_axi_rdata_0(31 downto 0) <= axi_uartlite_0_s_axi_rdata(31 downto 0);
  tx_0 <= axi_uartlite_0_tx;
axi_uartlite_0: component UART_axi_uartlite_0_0
     port map (
      interrupt => NLW_axi_uartlite_0_interrupt_UNCONNECTED,
      rx => rx_0_1,
      s_axi_aclk => s_axi_aclk_0_1,
      s_axi_araddr(3 downto 0) => B"0000",
      s_axi_aresetn => s_axi_aresetn_0_1,
      s_axi_arready => NLW_axi_uartlite_0_s_axi_arready_UNCONNECTED,
      s_axi_arvalid => '0',
      s_axi_awaddr(3 downto 0) => B"0000",
      s_axi_awready => NLW_axi_uartlite_0_s_axi_awready_UNCONNECTED,
      s_axi_awvalid => '0',
      s_axi_bready => '0',
      s_axi_bresp(1 downto 0) => NLW_axi_uartlite_0_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_bvalid => NLW_axi_uartlite_0_s_axi_bvalid_UNCONNECTED,
      s_axi_rdata(31 downto 0) => axi_uartlite_0_s_axi_rdata(31 downto 0),
      s_axi_rready => '0',
      s_axi_rresp(1 downto 0) => NLW_axi_uartlite_0_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_rvalid => NLW_axi_uartlite_0_s_axi_rvalid_UNCONNECTED,
      s_axi_wdata(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_wready => NLW_axi_uartlite_0_s_axi_wready_UNCONNECTED,
      s_axi_wstrb(3 downto 0) => B"1111",
      s_axi_wvalid => '0',
      tx => axi_uartlite_0_tx
    );
end STRUCTURE;
