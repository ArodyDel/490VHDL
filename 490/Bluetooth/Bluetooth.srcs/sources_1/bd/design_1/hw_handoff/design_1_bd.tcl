
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2017.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35tcpg236-1
   set_property BOARD_PART digilentinc.com:basys3:part0:1.1 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set AXI_LITE_UART_araddr_0 [ create_bd_port -dir I -from 12 -to 0 AXI_LITE_UART_araddr_0 ]
  set AXI_LITE_UART_arready_0 [ create_bd_port -dir O AXI_LITE_UART_arready_0 ]
  set AXI_LITE_UART_arvalid_0 [ create_bd_port -dir I AXI_LITE_UART_arvalid_0 ]
  set AXI_LITE_UART_awaddr_0 [ create_bd_port -dir I -from 12 -to 0 AXI_LITE_UART_awaddr_0 ]
  set AXI_LITE_UART_awready_0 [ create_bd_port -dir O AXI_LITE_UART_awready_0 ]
  set AXI_LITE_UART_awvalid_0 [ create_bd_port -dir I AXI_LITE_UART_awvalid_0 ]
  set AXI_LITE_UART_bready_0 [ create_bd_port -dir I AXI_LITE_UART_bready_0 ]
  set AXI_LITE_UART_bresp_0 [ create_bd_port -dir O -from 1 -to 0 AXI_LITE_UART_bresp_0 ]
  set AXI_LITE_UART_bvalid_0 [ create_bd_port -dir O AXI_LITE_UART_bvalid_0 ]
  set AXI_LITE_UART_rdata_0 [ create_bd_port -dir O -from 31 -to 0 AXI_LITE_UART_rdata_0 ]
  set AXI_LITE_UART_rready_0 [ create_bd_port -dir I AXI_LITE_UART_rready_0 ]
  set AXI_LITE_UART_rresp_0 [ create_bd_port -dir O -from 1 -to 0 AXI_LITE_UART_rresp_0 ]
  set AXI_LITE_UART_rvalid_0 [ create_bd_port -dir O AXI_LITE_UART_rvalid_0 ]
  set AXI_LITE_UART_wdata_0 [ create_bd_port -dir I -from 31 -to 0 AXI_LITE_UART_wdata_0 ]
  set AXI_LITE_UART_wready_0 [ create_bd_port -dir O AXI_LITE_UART_wready_0 ]
  set AXI_LITE_UART_wstrb_0 [ create_bd_port -dir I -from 3 -to 0 AXI_LITE_UART_wstrb_0 ]
  set AXI_LITE_UART_wvalid_0 [ create_bd_port -dir I AXI_LITE_UART_wvalid_0 ]
  set s_axi_aclk_0 [ create_bd_port -dir I -type clk s_axi_aclk_0 ]
  set s_axi_aresetn_0 [ create_bd_port -dir I -type rst s_axi_aresetn_0 ]

  # Create instance: PmodBT2_0, and set properties
  set PmodBT2_0 [ create_bd_cell -type ip -vlnv digilentinc.com:IP:PmodBT2:1.0 PmodBT2_0 ]
  set_property -dict [ list \
   CONFIG.PMOD {ja} \
 ] $PmodBT2_0

  # Create port connections
  connect_bd_net -net AXI_LITE_UART_araddr_0_1 [get_bd_ports AXI_LITE_UART_araddr_0] [get_bd_pins PmodBT2_0/AXI_LITE_UART_araddr]
  connect_bd_net -net AXI_LITE_UART_arvalid_0_1 [get_bd_ports AXI_LITE_UART_arvalid_0] [get_bd_pins PmodBT2_0/AXI_LITE_UART_arvalid]
  connect_bd_net -net AXI_LITE_UART_awaddr_0_1 [get_bd_ports AXI_LITE_UART_awaddr_0] [get_bd_pins PmodBT2_0/AXI_LITE_UART_awaddr]
  connect_bd_net -net AXI_LITE_UART_awvalid_0_1 [get_bd_ports AXI_LITE_UART_awvalid_0] [get_bd_pins PmodBT2_0/AXI_LITE_UART_awvalid]
  connect_bd_net -net AXI_LITE_UART_bready_0_1 [get_bd_ports AXI_LITE_UART_bready_0] [get_bd_pins PmodBT2_0/AXI_LITE_UART_bready]
  connect_bd_net -net AXI_LITE_UART_rready_0_1 [get_bd_ports AXI_LITE_UART_rready_0] [get_bd_pins PmodBT2_0/AXI_LITE_UART_rready]
  connect_bd_net -net AXI_LITE_UART_wdata_0_1 [get_bd_ports AXI_LITE_UART_wdata_0] [get_bd_pins PmodBT2_0/AXI_LITE_UART_wdata]
  connect_bd_net -net AXI_LITE_UART_wstrb_0_1 [get_bd_ports AXI_LITE_UART_wstrb_0] [get_bd_pins PmodBT2_0/AXI_LITE_UART_wstrb]
  connect_bd_net -net AXI_LITE_UART_wvalid_0_1 [get_bd_ports AXI_LITE_UART_wvalid_0] [get_bd_pins PmodBT2_0/AXI_LITE_UART_wvalid]
  connect_bd_net -net PmodBT2_0_AXI_LITE_UART_arready [get_bd_ports AXI_LITE_UART_arready_0] [get_bd_pins PmodBT2_0/AXI_LITE_UART_arready]
  connect_bd_net -net PmodBT2_0_AXI_LITE_UART_awready [get_bd_ports AXI_LITE_UART_awready_0] [get_bd_pins PmodBT2_0/AXI_LITE_UART_awready]
  connect_bd_net -net PmodBT2_0_AXI_LITE_UART_bresp [get_bd_ports AXI_LITE_UART_bresp_0] [get_bd_pins PmodBT2_0/AXI_LITE_UART_bresp]
  connect_bd_net -net PmodBT2_0_AXI_LITE_UART_bvalid [get_bd_ports AXI_LITE_UART_bvalid_0] [get_bd_pins PmodBT2_0/AXI_LITE_UART_bvalid]
  connect_bd_net -net PmodBT2_0_AXI_LITE_UART_rdata [get_bd_ports AXI_LITE_UART_rdata_0] [get_bd_pins PmodBT2_0/AXI_LITE_UART_rdata]
  connect_bd_net -net PmodBT2_0_AXI_LITE_UART_rresp [get_bd_ports AXI_LITE_UART_rresp_0] [get_bd_pins PmodBT2_0/AXI_LITE_UART_rresp]
  connect_bd_net -net PmodBT2_0_AXI_LITE_UART_rvalid [get_bd_ports AXI_LITE_UART_rvalid_0] [get_bd_pins PmodBT2_0/AXI_LITE_UART_rvalid]
  connect_bd_net -net PmodBT2_0_AXI_LITE_UART_wready [get_bd_ports AXI_LITE_UART_wready_0] [get_bd_pins PmodBT2_0/AXI_LITE_UART_wready]
  connect_bd_net -net s_axi_aclk_0_1 [get_bd_ports s_axi_aclk_0] [get_bd_pins PmodBT2_0/s_axi_aclk]
  connect_bd_net -net s_axi_aresetn_0_1 [get_bd_ports s_axi_aresetn_0] [get_bd_pins PmodBT2_0/s_axi_aresetn]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


