--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
--Date        : Fri Mar 30 22:56:40 2018
--Host        : arody-PC running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
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
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    AXI_LITE_UART_rvalid_0 : out STD_LOGIC;
    AXI_LITE_UART_bresp_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_LITE_UART_bready_0 : in STD_LOGIC;
    AXI_LITE_UART_arready_0 : out STD_LOGIC;
    AXI_LITE_UART_rdata_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_LITE_UART_araddr_0 : in STD_LOGIC_VECTOR ( 12 downto 0 );
    AXI_LITE_UART_bvalid_0 : out STD_LOGIC;
    AXI_LITE_UART_wstrb_0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_LITE_UART_awaddr_0 : in STD_LOGIC_VECTOR ( 12 downto 0 );
    AXI_LITE_UART_wready_0 : out STD_LOGIC;
    AXI_LITE_UART_rresp_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    AXI_LITE_UART_arvalid_0 : in STD_LOGIC;
    AXI_LITE_UART_rready_0 : in STD_LOGIC;
    AXI_LITE_UART_awvalid_0 : in STD_LOGIC;
    AXI_LITE_UART_wvalid_0 : in STD_LOGIC;
    AXI_LITE_UART_wdata_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_LITE_UART_awready_0 : out STD_LOGIC;
    s_axi_aclk_0 : in STD_LOGIC;
    s_axi_aresetn_0 : in STD_LOGIC
  );
  end component design_1;
begin
design_1_i: component design_1
     port map (
      AXI_LITE_UART_araddr_0(12 downto 0) => AXI_LITE_UART_araddr_0(12 downto 0),
      AXI_LITE_UART_arready_0 => AXI_LITE_UART_arready_0,
      AXI_LITE_UART_arvalid_0 => AXI_LITE_UART_arvalid_0,
      AXI_LITE_UART_awaddr_0(12 downto 0) => AXI_LITE_UART_awaddr_0(12 downto 0),
      AXI_LITE_UART_awready_0 => AXI_LITE_UART_awready_0,
      AXI_LITE_UART_awvalid_0 => AXI_LITE_UART_awvalid_0,
      AXI_LITE_UART_bready_0 => AXI_LITE_UART_bready_0,
      AXI_LITE_UART_bresp_0(1 downto 0) => AXI_LITE_UART_bresp_0(1 downto 0),
      AXI_LITE_UART_bvalid_0 => AXI_LITE_UART_bvalid_0,
      AXI_LITE_UART_rdata_0(31 downto 0) => AXI_LITE_UART_rdata_0(31 downto 0),
      AXI_LITE_UART_rready_0 => AXI_LITE_UART_rready_0,
      AXI_LITE_UART_rresp_0(1 downto 0) => AXI_LITE_UART_rresp_0(1 downto 0),
      AXI_LITE_UART_rvalid_0 => AXI_LITE_UART_rvalid_0,
      AXI_LITE_UART_wdata_0(31 downto 0) => AXI_LITE_UART_wdata_0(31 downto 0),
      AXI_LITE_UART_wready_0 => AXI_LITE_UART_wready_0,
      AXI_LITE_UART_wstrb_0(3 downto 0) => AXI_LITE_UART_wstrb_0(3 downto 0),
      AXI_LITE_UART_wvalid_0 => AXI_LITE_UART_wvalid_0,
      s_axi_aclk_0 => s_axi_aclk_0,
      s_axi_aresetn_0 => s_axi_aresetn_0
    );
end STRUCTURE;
