--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
--Date        : Fri Mar 30 22:56:40 2018
--Host        : arody-PC running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
  port (
    AXI_LITE_UART_araddr_0 : in STD_LOGIC_VECTOR ( 12 downto 0 );
    AXI_LITE_UART_arready_0 : out STD_LOGIC;
    AXI_LITE_UART_arvalid_0 : in STD_LOGIC;
    AXI_LITE_UART_awaddr_0 : in STD_LOGIC_VECTOR ( 12 downto 0 );
    AXI_LITE_UART_awready_0 : out STD_LOGIC;
    AXI_LITE_UART_awvalid_0 : in STD_LOGIC;
    AXI_LITE_UART_bready_0 : in STD_LOGIC;
    AXI_LITE_UART_bresp_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_LITE_UART_bvalid_0 : out STD_LOGIC;
    AXI_LITE_UART_rdata_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_LITE_UART_rready_0 : in STD_LOGIC;
    AXI_LITE_UART_rresp_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_LITE_UART_rvalid_0 : out STD_LOGIC;
    AXI_LITE_UART_wdata_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_LITE_UART_wready_0 : out STD_LOGIC;
    AXI_LITE_UART_wstrb_0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_LITE_UART_wvalid_0 : in STD_LOGIC;
    s_axi_aclk_0 : in STD_LOGIC;
    s_axi_aresetn_0 : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_PmodBT2_0_1 is
  port (
    AXI_LITE_GPIO_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    AXI_LITE_GPIO_arready : out STD_LOGIC;
    AXI_LITE_GPIO_arvalid : in STD_LOGIC;
    AXI_LITE_GPIO_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    AXI_LITE_GPIO_awready : out STD_LOGIC;
    AXI_LITE_GPIO_awvalid : in STD_LOGIC;
    AXI_LITE_GPIO_bready : in STD_LOGIC;
    AXI_LITE_GPIO_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_LITE_GPIO_bvalid : out STD_LOGIC;
    AXI_LITE_GPIO_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_LITE_GPIO_rready : in STD_LOGIC;
    AXI_LITE_GPIO_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_LITE_GPIO_rvalid : out STD_LOGIC;
    AXI_LITE_GPIO_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_LITE_GPIO_wready : out STD_LOGIC;
    AXI_LITE_GPIO_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_LITE_GPIO_wvalid : in STD_LOGIC;
    AXI_LITE_UART_araddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    AXI_LITE_UART_arready : out STD_LOGIC;
    AXI_LITE_UART_arvalid : in STD_LOGIC;
    AXI_LITE_UART_awaddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    AXI_LITE_UART_awready : out STD_LOGIC;
    AXI_LITE_UART_awvalid : in STD_LOGIC;
    AXI_LITE_UART_bready : in STD_LOGIC;
    AXI_LITE_UART_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_LITE_UART_bvalid : out STD_LOGIC;
    AXI_LITE_UART_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_LITE_UART_rready : in STD_LOGIC;
    AXI_LITE_UART_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_LITE_UART_rvalid : out STD_LOGIC;
    AXI_LITE_UART_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_LITE_UART_wready : out STD_LOGIC;
    AXI_LITE_UART_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_LITE_UART_wvalid : in STD_LOGIC;
    Pmod_out_pin10_i : in STD_LOGIC;
    Pmod_out_pin10_o : out STD_LOGIC;
    Pmod_out_pin10_t : out STD_LOGIC;
    Pmod_out_pin1_i : in STD_LOGIC;
    Pmod_out_pin1_o : out STD_LOGIC;
    Pmod_out_pin1_t : out STD_LOGIC;
    Pmod_out_pin2_i : in STD_LOGIC;
    Pmod_out_pin2_o : out STD_LOGIC;
    Pmod_out_pin2_t : out STD_LOGIC;
    Pmod_out_pin3_i : in STD_LOGIC;
    Pmod_out_pin3_o : out STD_LOGIC;
    Pmod_out_pin3_t : out STD_LOGIC;
    Pmod_out_pin4_i : in STD_LOGIC;
    Pmod_out_pin4_o : out STD_LOGIC;
    Pmod_out_pin4_t : out STD_LOGIC;
    Pmod_out_pin7_i : in STD_LOGIC;
    Pmod_out_pin7_o : out STD_LOGIC;
    Pmod_out_pin7_t : out STD_LOGIC;
    Pmod_out_pin8_i : in STD_LOGIC;
    Pmod_out_pin8_o : out STD_LOGIC;
    Pmod_out_pin8_t : out STD_LOGIC;
    Pmod_out_pin9_i : in STD_LOGIC;
    Pmod_out_pin9_o : out STD_LOGIC;
    Pmod_out_pin9_t : out STD_LOGIC;
    BT2_uart_interrupt : out STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC
  );
  end component design_1_PmodBT2_0_1;
  signal AXI_LITE_UART_araddr_0_1 : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal AXI_LITE_UART_arvalid_0_1 : STD_LOGIC;
  signal AXI_LITE_UART_awaddr_0_1 : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal AXI_LITE_UART_awvalid_0_1 : STD_LOGIC;
  signal AXI_LITE_UART_bready_0_1 : STD_LOGIC;
  signal AXI_LITE_UART_rready_0_1 : STD_LOGIC;
  signal AXI_LITE_UART_wdata_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AXI_LITE_UART_wstrb_0_1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal AXI_LITE_UART_wvalid_0_1 : STD_LOGIC;
  signal PmodBT2_0_AXI_LITE_UART_arready : STD_LOGIC;
  signal PmodBT2_0_AXI_LITE_UART_awready : STD_LOGIC;
  signal PmodBT2_0_AXI_LITE_UART_bresp : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PmodBT2_0_AXI_LITE_UART_bvalid : STD_LOGIC;
  signal PmodBT2_0_AXI_LITE_UART_rdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PmodBT2_0_AXI_LITE_UART_rresp : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PmodBT2_0_AXI_LITE_UART_rvalid : STD_LOGIC;
  signal PmodBT2_0_AXI_LITE_UART_wready : STD_LOGIC;
  signal s_axi_aclk_0_1 : STD_LOGIC;
  signal s_axi_aresetn_0_1 : STD_LOGIC;
  signal NLW_PmodBT2_0_AXI_LITE_GPIO_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_PmodBT2_0_AXI_LITE_GPIO_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_PmodBT2_0_AXI_LITE_GPIO_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_PmodBT2_0_AXI_LITE_GPIO_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_PmodBT2_0_AXI_LITE_GPIO_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_PmodBT2_0_BT2_uart_interrupt_UNCONNECTED : STD_LOGIC;
  signal NLW_PmodBT2_0_Pmod_out_pin10_o_UNCONNECTED : STD_LOGIC;
  signal NLW_PmodBT2_0_Pmod_out_pin10_t_UNCONNECTED : STD_LOGIC;
  signal NLW_PmodBT2_0_Pmod_out_pin1_o_UNCONNECTED : STD_LOGIC;
  signal NLW_PmodBT2_0_Pmod_out_pin1_t_UNCONNECTED : STD_LOGIC;
  signal NLW_PmodBT2_0_Pmod_out_pin2_o_UNCONNECTED : STD_LOGIC;
  signal NLW_PmodBT2_0_Pmod_out_pin2_t_UNCONNECTED : STD_LOGIC;
  signal NLW_PmodBT2_0_Pmod_out_pin3_o_UNCONNECTED : STD_LOGIC;
  signal NLW_PmodBT2_0_Pmod_out_pin3_t_UNCONNECTED : STD_LOGIC;
  signal NLW_PmodBT2_0_Pmod_out_pin4_o_UNCONNECTED : STD_LOGIC;
  signal NLW_PmodBT2_0_Pmod_out_pin4_t_UNCONNECTED : STD_LOGIC;
  signal NLW_PmodBT2_0_Pmod_out_pin7_o_UNCONNECTED : STD_LOGIC;
  signal NLW_PmodBT2_0_Pmod_out_pin7_t_UNCONNECTED : STD_LOGIC;
  signal NLW_PmodBT2_0_Pmod_out_pin8_o_UNCONNECTED : STD_LOGIC;
  signal NLW_PmodBT2_0_Pmod_out_pin8_t_UNCONNECTED : STD_LOGIC;
  signal NLW_PmodBT2_0_Pmod_out_pin9_o_UNCONNECTED : STD_LOGIC;
  signal NLW_PmodBT2_0_Pmod_out_pin9_t_UNCONNECTED : STD_LOGIC;
  signal NLW_PmodBT2_0_AXI_LITE_GPIO_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_PmodBT2_0_AXI_LITE_GPIO_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_PmodBT2_0_AXI_LITE_GPIO_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s_axi_aclk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.S_AXI_ACLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s_axi_aclk_0 : signal is "XIL_INTERFACENAME CLK.S_AXI_ACLK_0, ASSOCIATED_RESET s_axi_aresetn_0, CLK_DOMAIN design_1_s_axi_aclk_0, FREQ_HZ 100000000, PHASE 0.000";
  attribute X_INTERFACE_INFO of s_axi_aresetn_0 : signal is "xilinx.com:signal:reset:1.0 RST.S_AXI_ARESETN_0 RST";
  attribute X_INTERFACE_PARAMETER of s_axi_aresetn_0 : signal is "XIL_INTERFACENAME RST.S_AXI_ARESETN_0, POLARITY ACTIVE_LOW";
begin
  AXI_LITE_UART_araddr_0_1(12 downto 0) <= AXI_LITE_UART_araddr_0(12 downto 0);
  AXI_LITE_UART_arready_0 <= PmodBT2_0_AXI_LITE_UART_arready;
  AXI_LITE_UART_arvalid_0_1 <= AXI_LITE_UART_arvalid_0;
  AXI_LITE_UART_awaddr_0_1(12 downto 0) <= AXI_LITE_UART_awaddr_0(12 downto 0);
  AXI_LITE_UART_awready_0 <= PmodBT2_0_AXI_LITE_UART_awready;
  AXI_LITE_UART_awvalid_0_1 <= AXI_LITE_UART_awvalid_0;
  AXI_LITE_UART_bready_0_1 <= AXI_LITE_UART_bready_0;
  AXI_LITE_UART_bresp_0(1 downto 0) <= PmodBT2_0_AXI_LITE_UART_bresp(1 downto 0);
  AXI_LITE_UART_bvalid_0 <= PmodBT2_0_AXI_LITE_UART_bvalid;
  AXI_LITE_UART_rdata_0(31 downto 0) <= PmodBT2_0_AXI_LITE_UART_rdata(31 downto 0);
  AXI_LITE_UART_rready_0_1 <= AXI_LITE_UART_rready_0;
  AXI_LITE_UART_rresp_0(1 downto 0) <= PmodBT2_0_AXI_LITE_UART_rresp(1 downto 0);
  AXI_LITE_UART_rvalid_0 <= PmodBT2_0_AXI_LITE_UART_rvalid;
  AXI_LITE_UART_wdata_0_1(31 downto 0) <= AXI_LITE_UART_wdata_0(31 downto 0);
  AXI_LITE_UART_wready_0 <= PmodBT2_0_AXI_LITE_UART_wready;
  AXI_LITE_UART_wstrb_0_1(3 downto 0) <= AXI_LITE_UART_wstrb_0(3 downto 0);
  AXI_LITE_UART_wvalid_0_1 <= AXI_LITE_UART_wvalid_0;
  s_axi_aclk_0_1 <= s_axi_aclk_0;
  s_axi_aresetn_0_1 <= s_axi_aresetn_0;
PmodBT2_0: component design_1_PmodBT2_0_1
     port map (
      AXI_LITE_GPIO_araddr(8 downto 0) => B"000000000",
      AXI_LITE_GPIO_arready => NLW_PmodBT2_0_AXI_LITE_GPIO_arready_UNCONNECTED,
      AXI_LITE_GPIO_arvalid => '0',
      AXI_LITE_GPIO_awaddr(8 downto 0) => B"000000000",
      AXI_LITE_GPIO_awready => NLW_PmodBT2_0_AXI_LITE_GPIO_awready_UNCONNECTED,
      AXI_LITE_GPIO_awvalid => '0',
      AXI_LITE_GPIO_bready => '0',
      AXI_LITE_GPIO_bresp(1 downto 0) => NLW_PmodBT2_0_AXI_LITE_GPIO_bresp_UNCONNECTED(1 downto 0),
      AXI_LITE_GPIO_bvalid => NLW_PmodBT2_0_AXI_LITE_GPIO_bvalid_UNCONNECTED,
      AXI_LITE_GPIO_rdata(31 downto 0) => NLW_PmodBT2_0_AXI_LITE_GPIO_rdata_UNCONNECTED(31 downto 0),
      AXI_LITE_GPIO_rready => '0',
      AXI_LITE_GPIO_rresp(1 downto 0) => NLW_PmodBT2_0_AXI_LITE_GPIO_rresp_UNCONNECTED(1 downto 0),
      AXI_LITE_GPIO_rvalid => NLW_PmodBT2_0_AXI_LITE_GPIO_rvalid_UNCONNECTED,
      AXI_LITE_GPIO_wdata(31 downto 0) => B"00000000000000000000000000000000",
      AXI_LITE_GPIO_wready => NLW_PmodBT2_0_AXI_LITE_GPIO_wready_UNCONNECTED,
      AXI_LITE_GPIO_wstrb(3 downto 0) => B"1111",
      AXI_LITE_GPIO_wvalid => '0',
      AXI_LITE_UART_araddr(12 downto 0) => AXI_LITE_UART_araddr_0_1(12 downto 0),
      AXI_LITE_UART_arready => PmodBT2_0_AXI_LITE_UART_arready,
      AXI_LITE_UART_arvalid => AXI_LITE_UART_arvalid_0_1,
      AXI_LITE_UART_awaddr(12 downto 0) => AXI_LITE_UART_awaddr_0_1(12 downto 0),
      AXI_LITE_UART_awready => PmodBT2_0_AXI_LITE_UART_awready,
      AXI_LITE_UART_awvalid => AXI_LITE_UART_awvalid_0_1,
      AXI_LITE_UART_bready => AXI_LITE_UART_bready_0_1,
      AXI_LITE_UART_bresp(1 downto 0) => PmodBT2_0_AXI_LITE_UART_bresp(1 downto 0),
      AXI_LITE_UART_bvalid => PmodBT2_0_AXI_LITE_UART_bvalid,
      AXI_LITE_UART_rdata(31 downto 0) => PmodBT2_0_AXI_LITE_UART_rdata(31 downto 0),
      AXI_LITE_UART_rready => AXI_LITE_UART_rready_0_1,
      AXI_LITE_UART_rresp(1 downto 0) => PmodBT2_0_AXI_LITE_UART_rresp(1 downto 0),
      AXI_LITE_UART_rvalid => PmodBT2_0_AXI_LITE_UART_rvalid,
      AXI_LITE_UART_wdata(31 downto 0) => AXI_LITE_UART_wdata_0_1(31 downto 0),
      AXI_LITE_UART_wready => PmodBT2_0_AXI_LITE_UART_wready,
      AXI_LITE_UART_wstrb(3 downto 0) => AXI_LITE_UART_wstrb_0_1(3 downto 0),
      AXI_LITE_UART_wvalid => AXI_LITE_UART_wvalid_0_1,
      BT2_uart_interrupt => NLW_PmodBT2_0_BT2_uart_interrupt_UNCONNECTED,
      Pmod_out_pin10_i => '0',
      Pmod_out_pin10_o => NLW_PmodBT2_0_Pmod_out_pin10_o_UNCONNECTED,
      Pmod_out_pin10_t => NLW_PmodBT2_0_Pmod_out_pin10_t_UNCONNECTED,
      Pmod_out_pin1_i => '0',
      Pmod_out_pin1_o => NLW_PmodBT2_0_Pmod_out_pin1_o_UNCONNECTED,
      Pmod_out_pin1_t => NLW_PmodBT2_0_Pmod_out_pin1_t_UNCONNECTED,
      Pmod_out_pin2_i => '0',
      Pmod_out_pin2_o => NLW_PmodBT2_0_Pmod_out_pin2_o_UNCONNECTED,
      Pmod_out_pin2_t => NLW_PmodBT2_0_Pmod_out_pin2_t_UNCONNECTED,
      Pmod_out_pin3_i => '0',
      Pmod_out_pin3_o => NLW_PmodBT2_0_Pmod_out_pin3_o_UNCONNECTED,
      Pmod_out_pin3_t => NLW_PmodBT2_0_Pmod_out_pin3_t_UNCONNECTED,
      Pmod_out_pin4_i => '0',
      Pmod_out_pin4_o => NLW_PmodBT2_0_Pmod_out_pin4_o_UNCONNECTED,
      Pmod_out_pin4_t => NLW_PmodBT2_0_Pmod_out_pin4_t_UNCONNECTED,
      Pmod_out_pin7_i => '0',
      Pmod_out_pin7_o => NLW_PmodBT2_0_Pmod_out_pin7_o_UNCONNECTED,
      Pmod_out_pin7_t => NLW_PmodBT2_0_Pmod_out_pin7_t_UNCONNECTED,
      Pmod_out_pin8_i => '0',
      Pmod_out_pin8_o => NLW_PmodBT2_0_Pmod_out_pin8_o_UNCONNECTED,
      Pmod_out_pin8_t => NLW_PmodBT2_0_Pmod_out_pin8_t_UNCONNECTED,
      Pmod_out_pin9_i => '0',
      Pmod_out_pin9_o => NLW_PmodBT2_0_Pmod_out_pin9_o_UNCONNECTED,
      Pmod_out_pin9_t => NLW_PmodBT2_0_Pmod_out_pin9_t_UNCONNECTED,
      s_axi_aclk => s_axi_aclk_0_1,
      s_axi_aresetn => s_axi_aresetn_0_1
    );
end STRUCTURE;
