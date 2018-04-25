vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/lib_pkg_v1_0_2
vlib questa_lib/msim/lib_srl_fifo_v1_0_2
vlib questa_lib/msim/axi_uart16550_v2_0_17
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/interrupt_control_v3_1_4
vlib questa_lib/msim/axi_gpio_v2_0_17

vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap lib_pkg_v1_0_2 questa_lib/msim/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 questa_lib/msim/lib_srl_fifo_v1_0_2
vmap axi_uart16550_v2_0_17 questa_lib/msim/axi_uart16550_v2_0_17
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap interrupt_control_v3_1_4 questa_lib/msim/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_17 questa_lib/msim/axi_gpio_v2_0_17

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../ipstatic/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../ipstatic/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../ipstatic/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93 \
"../../../ipstatic/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uart16550_v2_0_17 -64 -93 \
"../../../ipstatic/hdl/axi_uart16550_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../Bluetooth.srcs/sources_1/ip/PmodBT2_0_1/src/PmodBT2_axi_uart16550_0_0/sim/PmodBT2_axi_uart16550_0_0.vhd" \

vcom -work interrupt_control_v3_1_4 -64 -93 \
"../../../ipstatic/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_17 -64 -93 \
"../../../ipstatic/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../Bluetooth.srcs/sources_1/ip/PmodBT2_0_1/src/PmodBT2_axi_gpio_0_0/sim/PmodBT2_axi_gpio_0_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../ipstatic/src/pmod_concat.v" \
"../../../../Bluetooth.srcs/sources_1/ip/PmodBT2_0_1/src/PmodBT2_pmod_bridge_0_0/sim/PmodBT2_pmod_bridge_0_0.v" \
"../../../ipstatic/src/PmodBT2.v" \
"../../../../Bluetooth.srcs/sources_1/ip/PmodBT2_0_1/sim/PmodBT2_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

