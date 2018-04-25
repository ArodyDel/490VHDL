vlib work
vlib riviera

vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/lib_cdc_v1_0_2
vlib riviera/lib_pkg_v1_0_2
vlib riviera/lib_srl_fifo_v1_0_2
vlib riviera/axi_uart16550_v2_0_17
vlib riviera/xil_defaultlib
vlib riviera/interrupt_control_v3_1_4
vlib riviera/axi_gpio_v2_0_17

vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap lib_pkg_v1_0_2 riviera/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 riviera/lib_srl_fifo_v1_0_2
vmap axi_uart16550_v2_0_17 riviera/axi_uart16550_v2_0_17
vmap xil_defaultlib riviera/xil_defaultlib
vmap interrupt_control_v3_1_4 riviera/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_17 riviera/axi_gpio_v2_0_17

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../ipstatic/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../ipstatic/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../ipstatic/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../ipstatic/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uart16550_v2_0_17 -93 \
"../../../ipstatic/hdl/axi_uart16550_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../Bluetooth.srcs/sources_1/ip/PmodBT2_0_1/src/PmodBT2_axi_uart16550_0_0/sim/PmodBT2_axi_uart16550_0_0.vhd" \

vcom -work interrupt_control_v3_1_4 -93 \
"../../../ipstatic/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_17 -93 \
"../../../ipstatic/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../Bluetooth.srcs/sources_1/ip/PmodBT2_0_1/src/PmodBT2_axi_gpio_0_0/sim/PmodBT2_axi_gpio_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../ipstatic/src/pmod_concat.v" \
"../../../../Bluetooth.srcs/sources_1/ip/PmodBT2_0_1/src/PmodBT2_pmod_bridge_0_0/sim/PmodBT2_pmod_bridge_0_0.v" \
"../../../ipstatic/src/PmodBT2.v" \
"../../../../Bluetooth.srcs/sources_1/ip/PmodBT2_0_1/sim/PmodBT2_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

