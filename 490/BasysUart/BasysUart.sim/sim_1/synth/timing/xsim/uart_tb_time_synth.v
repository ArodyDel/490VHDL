// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
// Date        : Fri Apr 27 03:03:45 2018
// Host        : arody-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/arody/Documents/GitHub/490VHDL/490/BasysUart/BasysUart.sim/sim_1/synth/timing/xsim/uart_tb_time_synth.v
// Design      : Main
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* NotValidForBitStream *)
module Main
   (r_CLOCK,
    w_TX_SERIAL,
    led,
    r_RX_SERIAL);
  input r_CLOCK;
  output w_TX_SERIAL;
  output [15:0]led;
  input r_RX_SERIAL;

  wire [15:0]led;
  wire [15:0]led_OBUF;
  wire r_CLOCK;
  wire r_CLOCK_IBUF;
  wire r_CLOCK_IBUF_BUFG;
  wire r_RX_SERIAL;
  wire r_RX_SERIAL_IBUF;
  wire w_TX_SERIAL;
  wire w_TX_SERIAL_OBUF;

initial begin
 $sdf_annotate("uart_tb_time_synth.sdf",,,,"tool_control");
end
  UART_RX UART_RX_INST
       (.Q(led_OBUF),
        .r_CLOCK_IBUF_BUFG(r_CLOCK_IBUF_BUFG),
        .r_RX_SERIAL_IBUF(r_RX_SERIAL_IBUF));
  UART_TX UART_TX_INST
       (.r_CLOCK_IBUF_BUFG(r_CLOCK_IBUF_BUFG),
        .w_TX_SERIAL_OBUF(w_TX_SERIAL_OBUF));
  OBUF \led_OBUF[0]_inst 
       (.I(led_OBUF[0]),
        .O(led[0]));
  OBUF \led_OBUF[10]_inst 
       (.I(led_OBUF[10]),
        .O(led[10]));
  OBUF \led_OBUF[11]_inst 
       (.I(led_OBUF[11]),
        .O(led[11]));
  OBUF \led_OBUF[12]_inst 
       (.I(led_OBUF[12]),
        .O(led[12]));
  OBUF \led_OBUF[13]_inst 
       (.I(led_OBUF[13]),
        .O(led[13]));
  OBUF \led_OBUF[14]_inst 
       (.I(led_OBUF[14]),
        .O(led[14]));
  OBUF \led_OBUF[15]_inst 
       (.I(led_OBUF[15]),
        .O(led[15]));
  OBUF \led_OBUF[1]_inst 
       (.I(led_OBUF[1]),
        .O(led[1]));
  OBUF \led_OBUF[2]_inst 
       (.I(led_OBUF[2]),
        .O(led[2]));
  OBUF \led_OBUF[3]_inst 
       (.I(led_OBUF[3]),
        .O(led[3]));
  OBUF \led_OBUF[4]_inst 
       (.I(led_OBUF[4]),
        .O(led[4]));
  OBUF \led_OBUF[5]_inst 
       (.I(led_OBUF[5]),
        .O(led[5]));
  OBUF \led_OBUF[6]_inst 
       (.I(led_OBUF[6]),
        .O(led[6]));
  OBUF \led_OBUF[7]_inst 
       (.I(led_OBUF[7]),
        .O(led[7]));
  OBUF \led_OBUF[8]_inst 
       (.I(led_OBUF[8]),
        .O(led[8]));
  OBUF \led_OBUF[9]_inst 
       (.I(led_OBUF[9]),
        .O(led[9]));
  BUFG r_CLOCK_IBUF_BUFG_inst
       (.I(r_CLOCK_IBUF),
        .O(r_CLOCK_IBUF_BUFG));
  IBUF r_CLOCK_IBUF_inst
       (.I(r_CLOCK),
        .O(r_CLOCK_IBUF));
  IBUF r_RX_SERIAL_IBUF_inst
       (.I(r_RX_SERIAL),
        .O(r_RX_SERIAL_IBUF));
  OBUF w_TX_SERIAL_OBUF_inst
       (.I(w_TX_SERIAL_OBUF),
        .O(w_TX_SERIAL));
endmodule

module UART_RX
   (Q,
    r_RX_SERIAL_IBUF,
    r_CLOCK_IBUF_BUFG);
  output [15:0]Q;
  input r_RX_SERIAL_IBUF;
  input r_CLOCK_IBUF_BUFG;

  wire \FSM_sequential_r_SM_Main[0]_i_1_n_0 ;
  wire \FSM_sequential_r_SM_Main[0]_i_2_n_0 ;
  wire \FSM_sequential_r_SM_Main[0]_i_3_n_0 ;
  wire \FSM_sequential_r_SM_Main[0]_i_4_n_0 ;
  wire \FSM_sequential_r_SM_Main[0]_i_5_n_0 ;
  wire \FSM_sequential_r_SM_Main[0]_i_6_n_0 ;
  wire \FSM_sequential_r_SM_Main[0]_i_7_n_0 ;
  wire \FSM_sequential_r_SM_Main[1]_i_1_n_0 ;
  wire \FSM_sequential_r_SM_Main[1]_i_2_n_0 ;
  wire \FSM_sequential_r_SM_Main[1]_i_3_n_0 ;
  wire \FSM_sequential_r_SM_Main[1]_i_4_n_0 ;
  wire \FSM_sequential_r_SM_Main[2]_i_1_n_0 ;
  wire \FSM_sequential_r_SM_Main[2]_i_2_n_0 ;
  wire \FSM_sequential_r_SM_Main[2]_i_3_n_0 ;
  wire \FSM_sequential_r_SM_Main[2]_i_4_n_0 ;
  wire [11:8]L;
  wire [15:0]Q;
  wire \buff[0]_i_1_n_0 ;
  wire \buff[11]_i_1_n_0 ;
  wire \buff[11]_i_2_n_0 ;
  wire \buff[19]_i_1_n_0 ;
  wire \buff[19]_i_2_n_0 ;
  wire \buff[19]_i_3_n_0 ;
  wire \buff[1]_i_1_n_0 ;
  wire \buff[27]_i_1_n_0 ;
  wire \buff[2]_i_1_n_0 ;
  wire \buff[3]_i_1_n_0 ;
  wire \buff[3]_i_2_n_0 ;
  wire \buff[3]_i_3_n_0 ;
  wire \buff[3]_i_4_n_0 ;
  wire \buff[3]_i_5_n_0 ;
  wire \buff[3]_i_6_n_0 ;
  wire \buff[3]_i_7_n_0 ;
  wire \buff_reg_n_0_[0] ;
  wire \buff_reg_n_0_[16] ;
  wire \buff_reg_n_0_[17] ;
  wire \buff_reg_n_0_[18] ;
  wire \buff_reg_n_0_[19] ;
  wire \buff_reg_n_0_[1] ;
  wire \buff_reg_n_0_[24] ;
  wire \buff_reg_n_0_[25] ;
  wire \buff_reg_n_0_[26] ;
  wire \buff_reg_n_0_[27] ;
  wire \buff_reg_n_0_[2] ;
  wire \buff_reg_n_0_[3] ;
  wire \ledBuff_reg_n_0_[0] ;
  wire \ledBuff_reg_n_0_[10] ;
  wire \ledBuff_reg_n_0_[11] ;
  wire \ledBuff_reg_n_0_[16] ;
  wire \ledBuff_reg_n_0_[17] ;
  wire \ledBuff_reg_n_0_[18] ;
  wire \ledBuff_reg_n_0_[19] ;
  wire \ledBuff_reg_n_0_[1] ;
  wire \ledBuff_reg_n_0_[24] ;
  wire \ledBuff_reg_n_0_[25] ;
  wire \ledBuff_reg_n_0_[26] ;
  wire \ledBuff_reg_n_0_[27] ;
  wire \ledBuff_reg_n_0_[2] ;
  wire \ledBuff_reg_n_0_[3] ;
  wire \ledBuff_reg_n_0_[8] ;
  wire \ledBuff_reg_n_0_[9] ;
  wire \o_ledBuff[27]_i_1_n_0 ;
  wire [3:0]p_0_in;
  wire p_0_in0;
  wire [2:0]r_Bit_Index;
  wire \r_Bit_Index[0]_i_1_n_0 ;
  wire \r_Bit_Index[1]_i_1_n_0 ;
  wire \r_Bit_Index[2]_i_1_n_0 ;
  wire \r_Bit_Index[2]_i_2_n_0 ;
  wire r_CLOCK_IBUF_BUFG;
  wire [13:0]r_Clk_Count;
  wire \r_Clk_Count[0]_i_2_n_0 ;
  wire \r_Clk_Count[0]_i_3_n_0 ;
  wire \r_Clk_Count[13]_i_1__0_n_0 ;
  wire \r_Clk_Count[13]_i_3_n_0 ;
  wire \r_Clk_Count[13]_i_5_n_0 ;
  wire \r_Clk_Count[13]_i_6_n_0 ;
  wire \r_Clk_Count[13]_i_7_n_0 ;
  wire \r_Clk_Count_reg[12]_i_2_n_0 ;
  wire \r_Clk_Count_reg[12]_i_2_n_1 ;
  wire \r_Clk_Count_reg[12]_i_2_n_2 ;
  wire \r_Clk_Count_reg[12]_i_2_n_3 ;
  wire \r_Clk_Count_reg[12]_i_2_n_4 ;
  wire \r_Clk_Count_reg[12]_i_2_n_5 ;
  wire \r_Clk_Count_reg[12]_i_2_n_6 ;
  wire \r_Clk_Count_reg[12]_i_2_n_7 ;
  wire \r_Clk_Count_reg[13]_i_4_n_7 ;
  wire \r_Clk_Count_reg[4]_i_2_n_0 ;
  wire \r_Clk_Count_reg[4]_i_2_n_1 ;
  wire \r_Clk_Count_reg[4]_i_2_n_2 ;
  wire \r_Clk_Count_reg[4]_i_2_n_3 ;
  wire \r_Clk_Count_reg[4]_i_2_n_4 ;
  wire \r_Clk_Count_reg[4]_i_2_n_5 ;
  wire \r_Clk_Count_reg[4]_i_2_n_6 ;
  wire \r_Clk_Count_reg[4]_i_2_n_7 ;
  wire \r_Clk_Count_reg[8]_i_2_n_0 ;
  wire \r_Clk_Count_reg[8]_i_2_n_1 ;
  wire \r_Clk_Count_reg[8]_i_2_n_2 ;
  wire \r_Clk_Count_reg[8]_i_2_n_3 ;
  wire \r_Clk_Count_reg[8]_i_2_n_4 ;
  wire \r_Clk_Count_reg[8]_i_2_n_5 ;
  wire \r_Clk_Count_reg[8]_i_2_n_6 ;
  wire \r_Clk_Count_reg[8]_i_2_n_7 ;
  wire \r_Clk_Count_reg_n_0_[0] ;
  wire \r_Clk_Count_reg_n_0_[10] ;
  wire \r_Clk_Count_reg_n_0_[11] ;
  wire \r_Clk_Count_reg_n_0_[12] ;
  wire \r_Clk_Count_reg_n_0_[13] ;
  wire \r_Clk_Count_reg_n_0_[1] ;
  wire \r_Clk_Count_reg_n_0_[2] ;
  wire \r_Clk_Count_reg_n_0_[3] ;
  wire \r_Clk_Count_reg_n_0_[4] ;
  wire \r_Clk_Count_reg_n_0_[5] ;
  wire \r_Clk_Count_reg_n_0_[6] ;
  wire \r_Clk_Count_reg_n_0_[7] ;
  wire \r_Clk_Count_reg_n_0_[8] ;
  wire \r_Clk_Count_reg_n_0_[9] ;
  wire [7:7]r_RX_Byte;
  wire \r_RX_Byte[0]_i_1_n_0 ;
  wire \r_RX_Byte[1]_i_1_n_0 ;
  wire \r_RX_Byte[2]_i_1_n_0 ;
  wire \r_RX_Byte[3]_i_1_n_0 ;
  wire \r_RX_Byte[4]_i_1_n_0 ;
  wire \r_RX_Byte[4]_i_2_n_0 ;
  wire \r_RX_Byte[5]_i_1_n_0 ;
  wire \r_RX_Byte[5]_i_2_n_0 ;
  wire \r_RX_Byte[6]_i_1_n_0 ;
  wire \r_RX_Byte[6]_i_2_n_0 ;
  wire \r_RX_Byte[6]_i_3_n_0 ;
  wire \r_RX_Byte_reg_n_0_[0] ;
  wire \r_RX_Byte_reg_n_0_[1] ;
  wire \r_RX_Byte_reg_n_0_[2] ;
  wire \r_RX_Byte_reg_n_0_[3] ;
  wire \r_RX_Byte_reg_n_0_[4] ;
  wire \r_RX_Byte_reg_n_0_[5] ;
  wire \r_RX_Byte_reg_n_0_[6] ;
  wire \r_RX_Byte_reg_n_0_[7] ;
  wire r_RX_Data;
  wire r_RX_Data_R;
  wire r_RX_SERIAL_IBUF;
  (* RTL_KEEP = "yes" *) wire [2:0]r_SM_Main;
  wire \state_reg_n_0_[0] ;
  wire \state_reg_n_0_[1] ;
  wire \state_reg_n_0_[2] ;
  wire [3:0]\NLW_r_Clk_Count_reg[13]_i_4_CO_UNCONNECTED ;
  wire [3:1]\NLW_r_Clk_Count_reg[13]_i_4_O_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF0828)) 
    \FSM_sequential_r_SM_Main[0]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[0]_i_2_n_0 ),
        .I1(r_SM_Main[0]),
        .I2(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I3(\FSM_sequential_r_SM_Main[0]_i_3_n_0 ),
        .I4(\FSM_sequential_r_SM_Main[0]_i_4_n_0 ),
        .I5(\FSM_sequential_r_SM_Main[0]_i_5_n_0 ),
        .O(\FSM_sequential_r_SM_Main[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_r_SM_Main[0]_i_2 
       (.I0(r_SM_Main[1]),
        .I1(r_SM_Main[2]),
        .O(\FSM_sequential_r_SM_Main[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \FSM_sequential_r_SM_Main[0]_i_3 
       (.I0(r_Bit_Index[1]),
        .I1(r_Bit_Index[0]),
        .I2(r_Bit_Index[2]),
        .O(\FSM_sequential_r_SM_Main[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_r_SM_Main[0]_i_4 
       (.I0(r_SM_Main[0]),
        .I1(r_RX_Data),
        .I2(r_SM_Main[2]),
        .I3(r_SM_Main[1]),
        .O(\FSM_sequential_r_SM_Main[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFFF00000000)) 
    \FSM_sequential_r_SM_Main[0]_i_5 
       (.I0(\FSM_sequential_r_SM_Main[1]_i_4_n_0 ),
        .I1(\FSM_sequential_r_SM_Main[0]_i_6_n_0 ),
        .I2(\FSM_sequential_r_SM_Main[0]_i_7_n_0 ),
        .I3(\r_Clk_Count_reg_n_0_[7] ),
        .I4(\r_Clk_Count_reg_n_0_[6] ),
        .I5(\r_Clk_Count[13]_i_5_n_0 ),
        .O(\FSM_sequential_r_SM_Main[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \FSM_sequential_r_SM_Main[0]_i_6 
       (.I0(\r_Clk_Count_reg_n_0_[2] ),
        .I1(\r_Clk_Count_reg_n_0_[3] ),
        .I2(\r_Clk_Count_reg_n_0_[4] ),
        .I3(\r_Clk_Count_reg_n_0_[5] ),
        .O(\FSM_sequential_r_SM_Main[0]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_sequential_r_SM_Main[0]_i_7 
       (.I0(\r_Clk_Count_reg_n_0_[8] ),
        .I1(\r_Clk_Count_reg_n_0_[9] ),
        .O(\FSM_sequential_r_SM_Main[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h00005F0000005F30)) 
    \FSM_sequential_r_SM_Main[1]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(\FSM_sequential_r_SM_Main[1]_i_2_n_0 ),
        .I2(r_SM_Main[0]),
        .I3(r_SM_Main[1]),
        .I4(r_SM_Main[2]),
        .I5(r_RX_Data),
        .O(\FSM_sequential_r_SM_Main[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFBFF)) 
    \FSM_sequential_r_SM_Main[1]_i_2 
       (.I0(\FSM_sequential_r_SM_Main[1]_i_3_n_0 ),
        .I1(\r_Clk_Count_reg_n_0_[2] ),
        .I2(\r_Clk_Count_reg_n_0_[3] ),
        .I3(\r_Clk_Count_reg_n_0_[4] ),
        .I4(\r_Clk_Count_reg_n_0_[5] ),
        .I5(\FSM_sequential_r_SM_Main[1]_i_4_n_0 ),
        .O(\FSM_sequential_r_SM_Main[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFFD)) 
    \FSM_sequential_r_SM_Main[1]_i_3 
       (.I0(\r_Clk_Count_reg_n_0_[6] ),
        .I1(\r_Clk_Count_reg_n_0_[7] ),
        .I2(\r_Clk_Count_reg_n_0_[9] ),
        .I3(\r_Clk_Count_reg_n_0_[8] ),
        .O(\FSM_sequential_r_SM_Main[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFBFFFFFFFFFFFFFF)) 
    \FSM_sequential_r_SM_Main[1]_i_4 
       (.I0(\r_Clk_Count_reg_n_0_[13] ),
        .I1(\r_Clk_Count_reg_n_0_[12] ),
        .I2(\r_Clk_Count_reg_n_0_[11] ),
        .I3(\r_Clk_Count_reg_n_0_[10] ),
        .I4(\r_Clk_Count_reg_n_0_[0] ),
        .I5(\r_Clk_Count_reg_n_0_[1] ),
        .O(\FSM_sequential_r_SM_Main[1]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0800)) 
    \FSM_sequential_r_SM_Main[2]_i_1 
       (.I0(r_SM_Main[0]),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I2(r_SM_Main[2]),
        .I3(r_SM_Main[1]),
        .O(\FSM_sequential_r_SM_Main[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEAAAAAAAAAAAAAA)) 
    \FSM_sequential_r_SM_Main[2]_i_2 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_3_n_0 ),
        .I1(\FSM_sequential_r_SM_Main[2]_i_4_n_0 ),
        .I2(\r_Clk_Count_reg_n_0_[6] ),
        .I3(\r_Clk_Count_reg_n_0_[13] ),
        .I4(\r_Clk_Count_reg_n_0_[11] ),
        .I5(\r_Clk_Count_reg_n_0_[7] ),
        .O(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEAAAA00000000)) 
    \FSM_sequential_r_SM_Main[2]_i_3 
       (.I0(\r_Clk_Count_reg_n_0_[12] ),
        .I1(\r_Clk_Count_reg_n_0_[9] ),
        .I2(\r_Clk_Count_reg_n_0_[8] ),
        .I3(\r_Clk_Count_reg_n_0_[10] ),
        .I4(\r_Clk_Count_reg_n_0_[11] ),
        .I5(\r_Clk_Count_reg_n_0_[13] ),
        .O(\FSM_sequential_r_SM_Main[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAA00000000)) 
    \FSM_sequential_r_SM_Main[2]_i_4 
       (.I0(\r_Clk_Count_reg_n_0_[4] ),
        .I1(\r_Clk_Count_reg_n_0_[1] ),
        .I2(\r_Clk_Count_reg_n_0_[0] ),
        .I3(\r_Clk_Count_reg_n_0_[3] ),
        .I4(\r_Clk_Count_reg_n_0_[2] ),
        .I5(\r_Clk_Count_reg_n_0_[5] ),
        .O(\FSM_sequential_r_SM_Main[2]_i_4_n_0 ));
  (* FSM_ENCODED_STATES = "s_idle:000,s_rx_start_bit:001,s_rx_data_bits:010,s_rx_stop_bit:011,s_cleanup:100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_r_SM_Main_reg[0] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_r_SM_Main[0]_i_1_n_0 ),
        .Q(r_SM_Main[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "s_idle:000,s_rx_start_bit:001,s_rx_data_bits:010,s_rx_stop_bit:011,s_cleanup:100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_r_SM_Main_reg[1] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_r_SM_Main[1]_i_1_n_0 ),
        .Q(r_SM_Main[1]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "s_idle:000,s_rx_start_bit:001,s_rx_data_bits:010,s_rx_stop_bit:011,s_cleanup:100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_r_SM_Main_reg[2] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_r_SM_Main[2]_i_1_n_0 ),
        .Q(r_SM_Main[2]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \buff[0]_i_1 
       (.I0(\r_RX_Byte_reg_n_0_[0] ),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .O(\buff[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000080)) 
    \buff[11]_i_1 
       (.I0(\buff[3]_i_5_n_0 ),
        .I1(\r_RX_Byte[6]_i_2_n_0 ),
        .I2(\buff[3]_i_3_n_0 ),
        .I3(\buff[19]_i_3_n_0 ),
        .I4(\state_reg_n_0_[1] ),
        .O(\buff[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0008000000080080)) 
    \buff[11]_i_2 
       (.I0(\r_RX_Byte[6]_i_2_n_0 ),
        .I1(\buff[3]_i_5_n_0 ),
        .I2(\state_reg_n_0_[1] ),
        .I3(\buff[19]_i_3_n_0 ),
        .I4(\buff[3]_i_3_n_0 ),
        .I5(\state_reg_n_0_[0] ),
        .O(\buff[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000800)) 
    \buff[19]_i_1 
       (.I0(\buff[3]_i_5_n_0 ),
        .I1(\r_RX_Byte[6]_i_2_n_0 ),
        .I2(\buff[19]_i_3_n_0 ),
        .I3(\buff[3]_i_3_n_0 ),
        .I4(\state_reg_n_0_[0] ),
        .I5(\state_reg_n_0_[1] ),
        .O(\buff[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000880)) 
    \buff[19]_i_2 
       (.I0(\r_RX_Byte[6]_i_2_n_0 ),
        .I1(\buff[3]_i_5_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\buff[3]_i_3_n_0 ),
        .I4(\buff[19]_i_3_n_0 ),
        .I5(\state_reg_n_0_[1] ),
        .O(\buff[19]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \buff[19]_i_3 
       (.I0(\state_reg_n_0_[2] ),
        .I1(p_0_in0),
        .O(\buff[19]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \buff[1]_i_1 
       (.I0(\r_RX_Byte_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\buff[3]_i_3_n_0 ),
        .O(\buff[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \buff[27]_i_1 
       (.I0(\r_RX_Byte[6]_i_2_n_0 ),
        .I1(\buff[3]_i_5_n_0 ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .I4(\buff[19]_i_3_n_0 ),
        .I5(\buff[3]_i_3_n_0 ),
        .O(\buff[27]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \buff[2]_i_1 
       (.I0(\r_RX_Byte_reg_n_0_[2] ),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .O(\buff[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002020000000000)) 
    \buff[3]_i_1 
       (.I0(\r_RX_Byte[6]_i_2_n_0 ),
        .I1(p_0_in0),
        .I2(\state_reg_n_0_[2] ),
        .I3(\buff[3]_i_3_n_0 ),
        .I4(\buff[3]_i_4_n_0 ),
        .I5(\buff[3]_i_5_n_0 ),
        .O(\buff[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \buff[3]_i_2 
       (.I0(\r_RX_Byte_reg_n_0_[3] ),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\buff[3]_i_3_n_0 ),
        .O(\buff[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \buff[3]_i_3 
       (.I0(\r_RX_Byte_reg_n_0_[4] ),
        .I1(\r_RX_Byte_reg_n_0_[5] ),
        .I2(\r_RX_Byte_reg_n_0_[6] ),
        .I3(\r_RX_Byte_reg_n_0_[7] ),
        .I4(\buff[3]_i_6_n_0 ),
        .O(\buff[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \buff[3]_i_4 
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[0] ),
        .O(\buff[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FEAA0000)) 
    \buff[3]_i_5 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_3_n_0 ),
        .I1(\FSM_sequential_r_SM_Main[2]_i_4_n_0 ),
        .I2(\r_Clk_Count_reg_n_0_[6] ),
        .I3(\buff[3]_i_7_n_0 ),
        .I4(r_Bit_Index[2]),
        .I5(\r_Bit_Index[2]_i_2_n_0 ),
        .O(\buff[3]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0400)) 
    \buff[3]_i_6 
       (.I0(\r_RX_Byte_reg_n_0_[0] ),
        .I1(\r_RX_Byte_reg_n_0_[1] ),
        .I2(\r_RX_Byte_reg_n_0_[2] ),
        .I3(\r_RX_Byte_reg_n_0_[3] ),
        .O(\buff[3]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \buff[3]_i_7 
       (.I0(\r_Clk_Count_reg_n_0_[13] ),
        .I1(\r_Clk_Count_reg_n_0_[11] ),
        .I2(\r_Clk_Count_reg_n_0_[7] ),
        .O(\buff[3]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \buff_reg[0] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[3]_i_1_n_0 ),
        .D(\buff[0]_i_1_n_0 ),
        .Q(\buff_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buff_reg[10] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[11]_i_2_n_0 ),
        .D(\r_RX_Byte_reg_n_0_[2] ),
        .Q(L[10]),
        .R(\buff[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \buff_reg[11] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[11]_i_2_n_0 ),
        .D(\r_RX_Byte_reg_n_0_[3] ),
        .Q(L[11]),
        .R(\buff[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \buff_reg[16] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[19]_i_2_n_0 ),
        .D(\r_RX_Byte_reg_n_0_[0] ),
        .Q(\buff_reg_n_0_[16] ),
        .R(\buff[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \buff_reg[17] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[19]_i_2_n_0 ),
        .D(\r_RX_Byte_reg_n_0_[1] ),
        .Q(\buff_reg_n_0_[17] ),
        .R(\buff[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \buff_reg[18] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[19]_i_2_n_0 ),
        .D(\r_RX_Byte_reg_n_0_[2] ),
        .Q(\buff_reg_n_0_[18] ),
        .R(\buff[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \buff_reg[19] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[19]_i_2_n_0 ),
        .D(\r_RX_Byte_reg_n_0_[3] ),
        .Q(\buff_reg_n_0_[19] ),
        .R(\buff[19]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \buff_reg[1] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[3]_i_1_n_0 ),
        .D(\buff[1]_i_1_n_0 ),
        .Q(\buff_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buff_reg[24] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[27]_i_1_n_0 ),
        .D(\r_RX_Byte_reg_n_0_[0] ),
        .Q(\buff_reg_n_0_[24] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buff_reg[25] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[27]_i_1_n_0 ),
        .D(\r_RX_Byte_reg_n_0_[1] ),
        .Q(\buff_reg_n_0_[25] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buff_reg[26] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[27]_i_1_n_0 ),
        .D(\r_RX_Byte_reg_n_0_[2] ),
        .Q(\buff_reg_n_0_[26] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buff_reg[27] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[27]_i_1_n_0 ),
        .D(\r_RX_Byte_reg_n_0_[3] ),
        .Q(\buff_reg_n_0_[27] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buff_reg[2] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[3]_i_1_n_0 ),
        .D(\buff[2]_i_1_n_0 ),
        .Q(\buff_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buff_reg[3] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[3]_i_1_n_0 ),
        .D(\buff[3]_i_2_n_0 ),
        .Q(\buff_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buff_reg[8] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[11]_i_2_n_0 ),
        .D(\r_RX_Byte_reg_n_0_[0] ),
        .Q(L[8]),
        .R(\buff[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \buff_reg[9] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[11]_i_2_n_0 ),
        .D(\r_RX_Byte_reg_n_0_[1] ),
        .Q(L[9]),
        .R(\buff[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ledBuff_reg[0] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[3]_i_1_n_0 ),
        .D(\buff_reg_n_0_[0] ),
        .Q(\ledBuff_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ledBuff_reg[10] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[11]_i_2_n_0 ),
        .D(L[10]),
        .Q(\ledBuff_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ledBuff_reg[11] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[11]_i_2_n_0 ),
        .D(L[11]),
        .Q(\ledBuff_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ledBuff_reg[16] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[19]_i_2_n_0 ),
        .D(\buff_reg_n_0_[16] ),
        .Q(\ledBuff_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ledBuff_reg[17] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[19]_i_2_n_0 ),
        .D(\buff_reg_n_0_[17] ),
        .Q(\ledBuff_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ledBuff_reg[18] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[19]_i_2_n_0 ),
        .D(\buff_reg_n_0_[18] ),
        .Q(\ledBuff_reg_n_0_[18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ledBuff_reg[19] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[19]_i_2_n_0 ),
        .D(\buff_reg_n_0_[19] ),
        .Q(\ledBuff_reg_n_0_[19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ledBuff_reg[1] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[3]_i_1_n_0 ),
        .D(\buff_reg_n_0_[1] ),
        .Q(\ledBuff_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ledBuff_reg[24] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[27]_i_1_n_0 ),
        .D(\buff_reg_n_0_[24] ),
        .Q(\ledBuff_reg_n_0_[24] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ledBuff_reg[25] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[27]_i_1_n_0 ),
        .D(\buff_reg_n_0_[25] ),
        .Q(\ledBuff_reg_n_0_[25] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ledBuff_reg[26] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[27]_i_1_n_0 ),
        .D(\buff_reg_n_0_[26] ),
        .Q(\ledBuff_reg_n_0_[26] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ledBuff_reg[27] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[27]_i_1_n_0 ),
        .D(\buff_reg_n_0_[27] ),
        .Q(\ledBuff_reg_n_0_[27] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ledBuff_reg[2] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[3]_i_1_n_0 ),
        .D(\buff_reg_n_0_[2] ),
        .Q(\ledBuff_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ledBuff_reg[3] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[3]_i_1_n_0 ),
        .D(\buff_reg_n_0_[3] ),
        .Q(\ledBuff_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ledBuff_reg[8] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[11]_i_2_n_0 ),
        .D(L[8]),
        .Q(\ledBuff_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ledBuff_reg[9] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\buff[11]_i_2_n_0 ),
        .D(L[9]),
        .Q(\ledBuff_reg_n_0_[9] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h2000000000000000)) 
    \o_ledBuff[27]_i_1 
       (.I0(\r_RX_Byte[6]_i_2_n_0 ),
        .I1(\buff[3]_i_3_n_0 ),
        .I2(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I3(r_Bit_Index[2]),
        .I4(r_Bit_Index[1]),
        .I5(r_Bit_Index[0]),
        .O(\o_ledBuff[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \o_ledBuff_reg[0] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\o_ledBuff[27]_i_1_n_0 ),
        .D(\ledBuff_reg_n_0_[0] ),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \o_ledBuff_reg[10] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\o_ledBuff[27]_i_1_n_0 ),
        .D(\ledBuff_reg_n_0_[10] ),
        .Q(Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \o_ledBuff_reg[11] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\o_ledBuff[27]_i_1_n_0 ),
        .D(\ledBuff_reg_n_0_[11] ),
        .Q(Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \o_ledBuff_reg[16] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\o_ledBuff[27]_i_1_n_0 ),
        .D(\ledBuff_reg_n_0_[16] ),
        .Q(Q[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \o_ledBuff_reg[17] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\o_ledBuff[27]_i_1_n_0 ),
        .D(\ledBuff_reg_n_0_[17] ),
        .Q(Q[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \o_ledBuff_reg[18] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\o_ledBuff[27]_i_1_n_0 ),
        .D(\ledBuff_reg_n_0_[18] ),
        .Q(Q[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \o_ledBuff_reg[19] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\o_ledBuff[27]_i_1_n_0 ),
        .D(\ledBuff_reg_n_0_[19] ),
        .Q(Q[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \o_ledBuff_reg[1] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\o_ledBuff[27]_i_1_n_0 ),
        .D(\ledBuff_reg_n_0_[1] ),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \o_ledBuff_reg[24] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\o_ledBuff[27]_i_1_n_0 ),
        .D(\ledBuff_reg_n_0_[24] ),
        .Q(Q[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \o_ledBuff_reg[25] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\o_ledBuff[27]_i_1_n_0 ),
        .D(\ledBuff_reg_n_0_[25] ),
        .Q(Q[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \o_ledBuff_reg[26] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\o_ledBuff[27]_i_1_n_0 ),
        .D(\ledBuff_reg_n_0_[26] ),
        .Q(Q[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \o_ledBuff_reg[27] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\o_ledBuff[27]_i_1_n_0 ),
        .D(\ledBuff_reg_n_0_[27] ),
        .Q(Q[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \o_ledBuff_reg[2] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\o_ledBuff[27]_i_1_n_0 ),
        .D(\ledBuff_reg_n_0_[2] ),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \o_ledBuff_reg[3] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\o_ledBuff[27]_i_1_n_0 ),
        .D(\ledBuff_reg_n_0_[3] ),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \o_ledBuff_reg[8] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\o_ledBuff[27]_i_1_n_0 ),
        .D(\ledBuff_reg_n_0_[8] ),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \o_ledBuff_reg[9] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\o_ledBuff[27]_i_1_n_0 ),
        .D(\ledBuff_reg_n_0_[9] ),
        .Q(Q[5]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFFDC0020)) 
    \r_Bit_Index[0]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(r_SM_Main[0]),
        .I2(r_SM_Main[1]),
        .I3(r_SM_Main[2]),
        .I4(r_Bit_Index[0]),
        .O(\r_Bit_Index[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF7F000000800)) 
    \r_Bit_Index[1]_i_1 
       (.I0(r_Bit_Index[0]),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I2(r_SM_Main[0]),
        .I3(r_SM_Main[1]),
        .I4(r_SM_Main[2]),
        .I5(r_Bit_Index[1]),
        .O(\r_Bit_Index[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFBF000000400)) 
    \r_Bit_Index[2]_i_1 
       (.I0(\r_Bit_Index[2]_i_2_n_0 ),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I2(r_SM_Main[0]),
        .I3(r_SM_Main[1]),
        .I4(r_SM_Main[2]),
        .I5(r_Bit_Index[2]),
        .O(\r_Bit_Index[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \r_Bit_Index[2]_i_2 
       (.I0(r_Bit_Index[0]),
        .I1(r_Bit_Index[1]),
        .O(\r_Bit_Index[2]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_Bit_Index_reg[0] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_Bit_Index[0]_i_1_n_0 ),
        .Q(r_Bit_Index[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Bit_Index_reg[1] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_Bit_Index[1]_i_1_n_0 ),
        .Q(r_Bit_Index[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Bit_Index_reg[2] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_Bit_Index[2]_i_1_n_0 ),
        .Q(r_Bit_Index[2]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h053F0500)) 
    \r_Clk_Count[0]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(\r_Clk_Count[0]_i_2_n_0 ),
        .I2(\r_Clk_Count_reg_n_0_[0] ),
        .I3(r_SM_Main[1]),
        .I4(r_SM_Main[0]),
        .O(r_Clk_Count[0]));
  LUT6 #(
    .INIT(64'hFF7FFFFFFFFFFFFF)) 
    \r_Clk_Count[0]_i_2 
       (.I0(r_RX_Data),
        .I1(\r_Clk_Count[13]_i_7_n_0 ),
        .I2(\r_Clk_Count_reg_n_0_[2] ),
        .I3(\r_Clk_Count_reg_n_0_[3] ),
        .I4(\r_Clk_Count[0]_i_3_n_0 ),
        .I5(\r_Clk_Count[13]_i_6_n_0 ),
        .O(\r_Clk_Count[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \r_Clk_Count[0]_i_3 
       (.I0(\r_Clk_Count_reg_n_0_[0] ),
        .I1(\r_Clk_Count_reg_n_0_[1] ),
        .O(\r_Clk_Count[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFF040F040404040)) 
    \r_Clk_Count[10]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(\FSM_sequential_r_SM_Main[0]_i_2_n_0 ),
        .I2(\r_Clk_Count_reg[12]_i_2_n_6 ),
        .I3(\r_Clk_Count[13]_i_3_n_0 ),
        .I4(r_RX_Data),
        .I5(\r_Clk_Count[13]_i_5_n_0 ),
        .O(r_Clk_Count[10]));
  LUT6 #(
    .INIT(64'hFFF040F040404040)) 
    \r_Clk_Count[11]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(\FSM_sequential_r_SM_Main[0]_i_2_n_0 ),
        .I2(\r_Clk_Count_reg[12]_i_2_n_5 ),
        .I3(\r_Clk_Count[13]_i_3_n_0 ),
        .I4(r_RX_Data),
        .I5(\r_Clk_Count[13]_i_5_n_0 ),
        .O(r_Clk_Count[11]));
  LUT6 #(
    .INIT(64'hFFF040F040404040)) 
    \r_Clk_Count[12]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(\FSM_sequential_r_SM_Main[0]_i_2_n_0 ),
        .I2(\r_Clk_Count_reg[12]_i_2_n_4 ),
        .I3(\r_Clk_Count[13]_i_3_n_0 ),
        .I4(r_RX_Data),
        .I5(\r_Clk_Count[13]_i_5_n_0 ),
        .O(r_Clk_Count[12]));
  LUT5 #(
    .INIT(32'h0B0F0F0F)) 
    \r_Clk_Count[13]_i_1__0 
       (.I0(r_SM_Main[1]),
        .I1(r_SM_Main[0]),
        .I2(r_SM_Main[2]),
        .I3(r_RX_Data),
        .I4(\r_Clk_Count[13]_i_3_n_0 ),
        .O(\r_Clk_Count[13]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFF040F040404040)) 
    \r_Clk_Count[13]_i_2 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(\FSM_sequential_r_SM_Main[0]_i_2_n_0 ),
        .I2(\r_Clk_Count_reg[13]_i_4_n_7 ),
        .I3(\r_Clk_Count[13]_i_3_n_0 ),
        .I4(r_RX_Data),
        .I5(\r_Clk_Count[13]_i_5_n_0 ),
        .O(r_Clk_Count[13]));
  LUT6 #(
    .INIT(64'h0080000000000000)) 
    \r_Clk_Count[13]_i_3 
       (.I0(\r_Clk_Count[13]_i_6_n_0 ),
        .I1(\r_Clk_Count_reg_n_0_[1] ),
        .I2(\r_Clk_Count_reg_n_0_[0] ),
        .I3(\r_Clk_Count_reg_n_0_[3] ),
        .I4(\r_Clk_Count_reg_n_0_[2] ),
        .I5(\r_Clk_Count[13]_i_7_n_0 ),
        .O(\r_Clk_Count[13]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h10)) 
    \r_Clk_Count[13]_i_5 
       (.I0(r_SM_Main[2]),
        .I1(r_SM_Main[1]),
        .I2(r_SM_Main[0]),
        .O(\r_Clk_Count[13]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0400)) 
    \r_Clk_Count[13]_i_6 
       (.I0(\r_Clk_Count_reg_n_0_[7] ),
        .I1(\r_Clk_Count_reg_n_0_[6] ),
        .I2(\r_Clk_Count_reg_n_0_[5] ),
        .I3(\r_Clk_Count_reg_n_0_[4] ),
        .O(\r_Clk_Count[13]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \r_Clk_Count[13]_i_7 
       (.I0(\r_Clk_Count_reg_n_0_[10] ),
        .I1(\r_Clk_Count_reg_n_0_[11] ),
        .I2(\r_Clk_Count_reg_n_0_[12] ),
        .I3(\r_Clk_Count_reg_n_0_[13] ),
        .I4(\r_Clk_Count_reg_n_0_[9] ),
        .I5(\r_Clk_Count_reg_n_0_[8] ),
        .O(\r_Clk_Count[13]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFF040F040404040)) 
    \r_Clk_Count[1]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(\FSM_sequential_r_SM_Main[0]_i_2_n_0 ),
        .I2(\r_Clk_Count_reg[4]_i_2_n_7 ),
        .I3(\r_Clk_Count[13]_i_3_n_0 ),
        .I4(r_RX_Data),
        .I5(\r_Clk_Count[13]_i_5_n_0 ),
        .O(r_Clk_Count[1]));
  LUT6 #(
    .INIT(64'hFFF040F040404040)) 
    \r_Clk_Count[2]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(\FSM_sequential_r_SM_Main[0]_i_2_n_0 ),
        .I2(\r_Clk_Count_reg[4]_i_2_n_6 ),
        .I3(\r_Clk_Count[13]_i_3_n_0 ),
        .I4(r_RX_Data),
        .I5(\r_Clk_Count[13]_i_5_n_0 ),
        .O(r_Clk_Count[2]));
  LUT6 #(
    .INIT(64'hFFF040F040404040)) 
    \r_Clk_Count[3]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(\FSM_sequential_r_SM_Main[0]_i_2_n_0 ),
        .I2(\r_Clk_Count_reg[4]_i_2_n_5 ),
        .I3(\r_Clk_Count[13]_i_3_n_0 ),
        .I4(r_RX_Data),
        .I5(\r_Clk_Count[13]_i_5_n_0 ),
        .O(r_Clk_Count[3]));
  LUT6 #(
    .INIT(64'hFFF040F040404040)) 
    \r_Clk_Count[4]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(\FSM_sequential_r_SM_Main[0]_i_2_n_0 ),
        .I2(\r_Clk_Count_reg[4]_i_2_n_4 ),
        .I3(\r_Clk_Count[13]_i_3_n_0 ),
        .I4(r_RX_Data),
        .I5(\r_Clk_Count[13]_i_5_n_0 ),
        .O(r_Clk_Count[4]));
  LUT6 #(
    .INIT(64'hFFF040F040404040)) 
    \r_Clk_Count[5]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(\FSM_sequential_r_SM_Main[0]_i_2_n_0 ),
        .I2(\r_Clk_Count_reg[8]_i_2_n_7 ),
        .I3(\r_Clk_Count[13]_i_3_n_0 ),
        .I4(r_RX_Data),
        .I5(\r_Clk_Count[13]_i_5_n_0 ),
        .O(r_Clk_Count[5]));
  LUT6 #(
    .INIT(64'hFFF040F040404040)) 
    \r_Clk_Count[6]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(\FSM_sequential_r_SM_Main[0]_i_2_n_0 ),
        .I2(\r_Clk_Count_reg[8]_i_2_n_6 ),
        .I3(\r_Clk_Count[13]_i_3_n_0 ),
        .I4(r_RX_Data),
        .I5(\r_Clk_Count[13]_i_5_n_0 ),
        .O(r_Clk_Count[6]));
  LUT6 #(
    .INIT(64'hFFF040F040404040)) 
    \r_Clk_Count[7]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(\FSM_sequential_r_SM_Main[0]_i_2_n_0 ),
        .I2(\r_Clk_Count_reg[8]_i_2_n_5 ),
        .I3(\r_Clk_Count[13]_i_3_n_0 ),
        .I4(r_RX_Data),
        .I5(\r_Clk_Count[13]_i_5_n_0 ),
        .O(r_Clk_Count[7]));
  LUT6 #(
    .INIT(64'hFFF040F040404040)) 
    \r_Clk_Count[8]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(\FSM_sequential_r_SM_Main[0]_i_2_n_0 ),
        .I2(\r_Clk_Count_reg[8]_i_2_n_4 ),
        .I3(\r_Clk_Count[13]_i_3_n_0 ),
        .I4(r_RX_Data),
        .I5(\r_Clk_Count[13]_i_5_n_0 ),
        .O(r_Clk_Count[8]));
  LUT6 #(
    .INIT(64'hFFF040F040404040)) 
    \r_Clk_Count[9]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(\FSM_sequential_r_SM_Main[0]_i_2_n_0 ),
        .I2(\r_Clk_Count_reg[12]_i_2_n_7 ),
        .I3(\r_Clk_Count[13]_i_3_n_0 ),
        .I4(r_RX_Data),
        .I5(\r_Clk_Count[13]_i_5_n_0 ),
        .O(r_Clk_Count[9]));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[0] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1__0_n_0 ),
        .D(r_Clk_Count[0]),
        .Q(\r_Clk_Count_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[10] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1__0_n_0 ),
        .D(r_Clk_Count[10]),
        .Q(\r_Clk_Count_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[11] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1__0_n_0 ),
        .D(r_Clk_Count[11]),
        .Q(\r_Clk_Count_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[12] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1__0_n_0 ),
        .D(r_Clk_Count[12]),
        .Q(\r_Clk_Count_reg_n_0_[12] ),
        .R(1'b0));
  CARRY4 \r_Clk_Count_reg[12]_i_2 
       (.CI(\r_Clk_Count_reg[8]_i_2_n_0 ),
        .CO({\r_Clk_Count_reg[12]_i_2_n_0 ,\r_Clk_Count_reg[12]_i_2_n_1 ,\r_Clk_Count_reg[12]_i_2_n_2 ,\r_Clk_Count_reg[12]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\r_Clk_Count_reg[12]_i_2_n_4 ,\r_Clk_Count_reg[12]_i_2_n_5 ,\r_Clk_Count_reg[12]_i_2_n_6 ,\r_Clk_Count_reg[12]_i_2_n_7 }),
        .S({\r_Clk_Count_reg_n_0_[12] ,\r_Clk_Count_reg_n_0_[11] ,\r_Clk_Count_reg_n_0_[10] ,\r_Clk_Count_reg_n_0_[9] }));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[13] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1__0_n_0 ),
        .D(r_Clk_Count[13]),
        .Q(\r_Clk_Count_reg_n_0_[13] ),
        .R(1'b0));
  CARRY4 \r_Clk_Count_reg[13]_i_4 
       (.CI(\r_Clk_Count_reg[12]_i_2_n_0 ),
        .CO(\NLW_r_Clk_Count_reg[13]_i_4_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_r_Clk_Count_reg[13]_i_4_O_UNCONNECTED [3:1],\r_Clk_Count_reg[13]_i_4_n_7 }),
        .S({1'b0,1'b0,1'b0,\r_Clk_Count_reg_n_0_[13] }));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[1] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1__0_n_0 ),
        .D(r_Clk_Count[1]),
        .Q(\r_Clk_Count_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[2] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1__0_n_0 ),
        .D(r_Clk_Count[2]),
        .Q(\r_Clk_Count_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[3] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1__0_n_0 ),
        .D(r_Clk_Count[3]),
        .Q(\r_Clk_Count_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[4] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1__0_n_0 ),
        .D(r_Clk_Count[4]),
        .Q(\r_Clk_Count_reg_n_0_[4] ),
        .R(1'b0));
  CARRY4 \r_Clk_Count_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\r_Clk_Count_reg[4]_i_2_n_0 ,\r_Clk_Count_reg[4]_i_2_n_1 ,\r_Clk_Count_reg[4]_i_2_n_2 ,\r_Clk_Count_reg[4]_i_2_n_3 }),
        .CYINIT(\r_Clk_Count_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\r_Clk_Count_reg[4]_i_2_n_4 ,\r_Clk_Count_reg[4]_i_2_n_5 ,\r_Clk_Count_reg[4]_i_2_n_6 ,\r_Clk_Count_reg[4]_i_2_n_7 }),
        .S({\r_Clk_Count_reg_n_0_[4] ,\r_Clk_Count_reg_n_0_[3] ,\r_Clk_Count_reg_n_0_[2] ,\r_Clk_Count_reg_n_0_[1] }));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[5] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1__0_n_0 ),
        .D(r_Clk_Count[5]),
        .Q(\r_Clk_Count_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[6] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1__0_n_0 ),
        .D(r_Clk_Count[6]),
        .Q(\r_Clk_Count_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[7] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1__0_n_0 ),
        .D(r_Clk_Count[7]),
        .Q(\r_Clk_Count_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[8] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1__0_n_0 ),
        .D(r_Clk_Count[8]),
        .Q(\r_Clk_Count_reg_n_0_[8] ),
        .R(1'b0));
  CARRY4 \r_Clk_Count_reg[8]_i_2 
       (.CI(\r_Clk_Count_reg[4]_i_2_n_0 ),
        .CO({\r_Clk_Count_reg[8]_i_2_n_0 ,\r_Clk_Count_reg[8]_i_2_n_1 ,\r_Clk_Count_reg[8]_i_2_n_2 ,\r_Clk_Count_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\r_Clk_Count_reg[8]_i_2_n_4 ,\r_Clk_Count_reg[8]_i_2_n_5 ,\r_Clk_Count_reg[8]_i_2_n_6 ,\r_Clk_Count_reg[8]_i_2_n_7 }),
        .S({\r_Clk_Count_reg_n_0_[8] ,\r_Clk_Count_reg_n_0_[7] ,\r_Clk_Count_reg_n_0_[6] ,\r_Clk_Count_reg_n_0_[5] }));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[9] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1__0_n_0 ),
        .D(r_Clk_Count[9]),
        .Q(\r_Clk_Count_reg_n_0_[9] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000)) 
    \r_RX_Byte[0]_i_1 
       (.I0(r_RX_Data),
        .I1(\r_RX_Byte[6]_i_2_n_0 ),
        .I2(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I3(r_Bit_Index[2]),
        .I4(\r_RX_Byte[4]_i_2_n_0 ),
        .I5(\r_RX_Byte_reg_n_0_[0] ),
        .O(\r_RX_Byte[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000)) 
    \r_RX_Byte[1]_i_1 
       (.I0(r_RX_Data),
        .I1(\r_RX_Byte[6]_i_2_n_0 ),
        .I2(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I3(r_Bit_Index[2]),
        .I4(\r_RX_Byte[5]_i_2_n_0 ),
        .I5(\r_RX_Byte_reg_n_0_[1] ),
        .O(\r_RX_Byte[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000)) 
    \r_RX_Byte[2]_i_1 
       (.I0(r_RX_Data),
        .I1(\r_RX_Byte[6]_i_2_n_0 ),
        .I2(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I3(r_Bit_Index[2]),
        .I4(\r_RX_Byte[6]_i_3_n_0 ),
        .I5(\r_RX_Byte_reg_n_0_[2] ),
        .O(\r_RX_Byte[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFBFF00000800)) 
    \r_RX_Byte[3]_i_1 
       (.I0(r_RX_Data),
        .I1(\r_RX_Byte[6]_i_2_n_0 ),
        .I2(\r_Bit_Index[2]_i_2_n_0 ),
        .I3(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I4(r_Bit_Index[2]),
        .I5(\r_RX_Byte_reg_n_0_[3] ),
        .O(\r_RX_Byte[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFFFFF80000000)) 
    \r_RX_Byte[4]_i_1 
       (.I0(r_RX_Data),
        .I1(\r_RX_Byte[6]_i_2_n_0 ),
        .I2(r_Bit_Index[2]),
        .I3(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I4(\r_RX_Byte[4]_i_2_n_0 ),
        .I5(\r_RX_Byte_reg_n_0_[4] ),
        .O(\r_RX_Byte[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \r_RX_Byte[4]_i_2 
       (.I0(r_Bit_Index[0]),
        .I1(r_Bit_Index[1]),
        .O(\r_RX_Byte[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFFFFF80000000)) 
    \r_RX_Byte[5]_i_1 
       (.I0(r_RX_Data),
        .I1(\r_RX_Byte[6]_i_2_n_0 ),
        .I2(r_Bit_Index[2]),
        .I3(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I4(\r_RX_Byte[5]_i_2_n_0 ),
        .I5(\r_RX_Byte_reg_n_0_[5] ),
        .O(\r_RX_Byte[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \r_RX_Byte[5]_i_2 
       (.I0(r_Bit_Index[0]),
        .I1(r_Bit_Index[1]),
        .O(\r_RX_Byte[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFFFFF80000000)) 
    \r_RX_Byte[6]_i_1 
       (.I0(r_RX_Data),
        .I1(\r_RX_Byte[6]_i_2_n_0 ),
        .I2(r_Bit_Index[2]),
        .I3(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I4(\r_RX_Byte[6]_i_3_n_0 ),
        .I5(\r_RX_Byte_reg_n_0_[6] ),
        .O(\r_RX_Byte[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \r_RX_Byte[6]_i_2 
       (.I0(r_SM_Main[2]),
        .I1(r_SM_Main[1]),
        .I2(r_SM_Main[0]),
        .O(\r_RX_Byte[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \r_RX_Byte[6]_i_3 
       (.I0(r_Bit_Index[1]),
        .I1(r_Bit_Index[0]),
        .O(\r_RX_Byte[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    \r_RX_Byte[7]_i_1 
       (.I0(r_SM_Main[0]),
        .I1(\FSM_sequential_r_SM_Main[0]_i_2_n_0 ),
        .I2(r_Bit_Index[0]),
        .I3(r_Bit_Index[1]),
        .I4(r_Bit_Index[2]),
        .I5(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .O(r_RX_Byte));
  FDRE #(
    .INIT(1'b0)) 
    \r_RX_Byte_reg[0] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_RX_Byte[0]_i_1_n_0 ),
        .Q(\r_RX_Byte_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_RX_Byte_reg[1] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_RX_Byte[1]_i_1_n_0 ),
        .Q(\r_RX_Byte_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_RX_Byte_reg[2] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_RX_Byte[2]_i_1_n_0 ),
        .Q(\r_RX_Byte_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_RX_Byte_reg[3] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_RX_Byte[3]_i_1_n_0 ),
        .Q(\r_RX_Byte_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_RX_Byte_reg[4] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_RX_Byte[4]_i_1_n_0 ),
        .Q(\r_RX_Byte_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_RX_Byte_reg[5] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_RX_Byte[5]_i_1_n_0 ),
        .Q(\r_RX_Byte_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_RX_Byte_reg[6] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_RX_Byte[6]_i_1_n_0 ),
        .Q(\r_RX_Byte_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_RX_Byte_reg[7] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(r_RX_Byte),
        .D(r_RX_Data),
        .Q(\r_RX_Byte_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    r_RX_Data_R_reg
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(r_RX_SERIAL_IBUF),
        .Q(r_RX_Data_R),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    r_RX_Data_reg
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(r_RX_Data_R),
        .Q(r_RX_Data),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \state[0]_i_1 
       (.I0(\buff[3]_i_3_n_0 ),
        .I1(\state_reg_n_0_[0] ),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h14)) 
    \state[1]_i_1 
       (.I0(\buff[3]_i_3_n_0 ),
        .I1(\state_reg_n_0_[0] ),
        .I2(\state_reg_n_0_[1] ),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h1444)) 
    \state[2]_i_1 
       (.I0(\buff[3]_i_3_n_0 ),
        .I1(\state_reg_n_0_[2] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h15554000)) 
    \state[3]_i_1 
       (.I0(\buff[3]_i_3_n_0 ),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[2] ),
        .I4(p_0_in0),
        .O(p_0_in[3]));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(r_RX_Byte),
        .D(p_0_in[0]),
        .Q(\state_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(r_RX_Byte),
        .D(p_0_in[1]),
        .Q(\state_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[2] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(r_RX_Byte),
        .D(p_0_in[2]),
        .Q(\state_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[3] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(r_RX_Byte),
        .D(p_0_in[3]),
        .Q(p_0_in0),
        .R(1'b0));
endmodule

module UART_TX
   (w_TX_SERIAL_OBUF,
    r_CLOCK_IBUF_BUFG);
  output w_TX_SERIAL_OBUF;
  input r_CLOCK_IBUF_BUFG;

  wire \/FSM_sequential_r_SM_Main[0]_i_1_n_0 ;
  wire \/FSM_sequential_r_SM_Main[2]_i_1_n_0 ;
  wire \FSM_sequential_r_SM_Main[1]_i_1__0_n_0 ;
  wire \FSM_sequential_r_SM_Main[2]_i_2__0_n_0 ;
  wire \FSM_sequential_r_SM_Main[2]_i_3__0_n_0 ;
  wire \FSM_sequential_r_SM_Main[2]_i_4__0_n_0 ;
  wire \FSM_sequential_r_SM_Main[2]_i_5_n_0 ;
  wire \FSM_sequential_r_SM_Main[2]_i_6_n_0 ;
  wire \__0/i__n_0 ;
  wire o_TX_Active_i_1_n_0;
  (* DONT_TOUCH *) wire o_TX_Active_reg_n_0;
  wire o_TX_Serial_i_1_n_0;
  wire [2:2]r_Bit_Index;
  wire r_Bit_Index1_n_0;
  wire \r_Bit_Index[0]_i_1_n_0 ;
  wire \r_Bit_Index[1]_i_1_n_0 ;
  wire \r_Bit_Index[2]_i_1_n_0 ;
  wire \r_Bit_Index_reg_n_0_[0] ;
  wire \r_Bit_Index_reg_n_0_[1] ;
  wire \r_Bit_Index_reg_n_0_[2] ;
  wire r_CLOCK_IBUF_BUFG;
  wire [13:0]r_Clk_Count;
  wire \r_Clk_Count[0]_i_1_n_0 ;
  wire \r_Clk_Count[10]_i_1_n_0 ;
  wire \r_Clk_Count[11]_i_1_n_0 ;
  wire \r_Clk_Count[12]_i_1_n_0 ;
  wire \r_Clk_Count[13]_i_1_n_0 ;
  wire \r_Clk_Count[13]_i_2_n_0 ;
  wire \r_Clk_Count[1]_i_1_n_0 ;
  wire \r_Clk_Count[2]_i_1_n_0 ;
  wire \r_Clk_Count[3]_i_1_n_0 ;
  wire \r_Clk_Count[4]_i_1_n_0 ;
  wire \r_Clk_Count[5]_i_1_n_0 ;
  wire \r_Clk_Count[6]_i_1_n_0 ;
  wire \r_Clk_Count[7]_i_1_n_0 ;
  wire \r_Clk_Count[8]_i_1_n_0 ;
  wire \r_Clk_Count[9]_i_1_n_0 ;
  wire \r_Clk_Count_reg[12]_i_2__0_n_0 ;
  wire \r_Clk_Count_reg[12]_i_2__0_n_1 ;
  wire \r_Clk_Count_reg[12]_i_2__0_n_2 ;
  wire \r_Clk_Count_reg[12]_i_2__0_n_3 ;
  wire \r_Clk_Count_reg[12]_i_2__0_n_4 ;
  wire \r_Clk_Count_reg[12]_i_2__0_n_5 ;
  wire \r_Clk_Count_reg[12]_i_2__0_n_6 ;
  wire \r_Clk_Count_reg[12]_i_2__0_n_7 ;
  wire \r_Clk_Count_reg[13]_i_3_n_7 ;
  wire \r_Clk_Count_reg[4]_i_2__0_n_0 ;
  wire \r_Clk_Count_reg[4]_i_2__0_n_1 ;
  wire \r_Clk_Count_reg[4]_i_2__0_n_2 ;
  wire \r_Clk_Count_reg[4]_i_2__0_n_3 ;
  wire \r_Clk_Count_reg[4]_i_2__0_n_4 ;
  wire \r_Clk_Count_reg[4]_i_2__0_n_5 ;
  wire \r_Clk_Count_reg[4]_i_2__0_n_6 ;
  wire \r_Clk_Count_reg[4]_i_2__0_n_7 ;
  wire \r_Clk_Count_reg[8]_i_2__0_n_0 ;
  wire \r_Clk_Count_reg[8]_i_2__0_n_1 ;
  wire \r_Clk_Count_reg[8]_i_2__0_n_2 ;
  wire \r_Clk_Count_reg[8]_i_2__0_n_3 ;
  wire \r_Clk_Count_reg[8]_i_2__0_n_4 ;
  wire \r_Clk_Count_reg[8]_i_2__0_n_5 ;
  wire \r_Clk_Count_reg[8]_i_2__0_n_6 ;
  wire \r_Clk_Count_reg[8]_i_2__0_n_7 ;
  (* RTL_KEEP = "yes" *) wire [2:0]r_SM_Main;
  wire w_TX_SERIAL_OBUF;
  wire [3:0]\NLW_r_Clk_Count_reg[13]_i_3_CO_UNCONNECTED ;
  wire [3:1]\NLW_r_Clk_Count_reg[13]_i_3_O_UNCONNECTED ;

  LUT5 #(
    .INIT(32'h30300100)) 
    \/FSM_sequential_r_SM_Main[0]_i_1 
       (.I0(r_Bit_Index1_n_0),
        .I1(r_SM_Main[2]),
        .I2(r_SM_Main[0]),
        .I3(r_SM_Main[1]),
        .I4(\FSM_sequential_r_SM_Main[2]_i_2__0_n_0 ),
        .O(\/FSM_sequential_r_SM_Main[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h1000)) 
    \/FSM_sequential_r_SM_Main[2]_i_1 
       (.I0(r_SM_Main[2]),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2__0_n_0 ),
        .I2(r_SM_Main[0]),
        .I3(r_SM_Main[1]),
        .O(\/FSM_sequential_r_SM_Main[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00A6)) 
    \FSM_sequential_r_SM_Main[1]_i_1__0 
       (.I0(r_SM_Main[1]),
        .I1(r_SM_Main[0]),
        .I2(\FSM_sequential_r_SM_Main[2]_i_2__0_n_0 ),
        .I3(r_SM_Main[2]),
        .O(\FSM_sequential_r_SM_Main[1]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h5D000000)) 
    \FSM_sequential_r_SM_Main[2]_i_2__0 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_3__0_n_0 ),
        .I1(\FSM_sequential_r_SM_Main[2]_i_4__0_n_0 ),
        .I2(r_Clk_Count[4]),
        .I3(\FSM_sequential_r_SM_Main[2]_i_5_n_0 ),
        .I4(\FSM_sequential_r_SM_Main[2]_i_6_n_0 ),
        .O(\FSM_sequential_r_SM_Main[2]_i_2__0_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \FSM_sequential_r_SM_Main[2]_i_3__0 
       (.I0(r_Clk_Count[5]),
        .I1(r_Clk_Count[11]),
        .I2(r_Clk_Count[7]),
        .I3(r_Clk_Count[13]),
        .O(\FSM_sequential_r_SM_Main[2]_i_3__0_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \FSM_sequential_r_SM_Main[2]_i_4__0 
       (.I0(r_Clk_Count[1]),
        .I1(r_Clk_Count[0]),
        .I2(r_Clk_Count[3]),
        .I3(r_Clk_Count[2]),
        .O(\FSM_sequential_r_SM_Main[2]_i_4__0_n_0 ));
  LUT5 #(
    .INIT(32'h7777777F)) 
    \FSM_sequential_r_SM_Main[2]_i_5 
       (.I0(r_Clk_Count[11]),
        .I1(r_Clk_Count[13]),
        .I2(r_Clk_Count[8]),
        .I3(r_Clk_Count[10]),
        .I4(r_Clk_Count[9]),
        .O(\FSM_sequential_r_SM_Main[2]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h37777777)) 
    \FSM_sequential_r_SM_Main[2]_i_6 
       (.I0(r_Clk_Count[12]),
        .I1(r_Clk_Count[13]),
        .I2(r_Clk_Count[7]),
        .I3(r_Clk_Count[11]),
        .I4(r_Clk_Count[6]),
        .O(\FSM_sequential_r_SM_Main[2]_i_6_n_0 ));
  (* FSM_ENCODED_STATES = "s_idle:000,s_tx_start_bit:001,s_tx_data_bits:010,s_tx_stop_bit:011,s_cleanup:100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_r_SM_Main_reg[0] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(\/FSM_sequential_r_SM_Main[0]_i_1_n_0 ),
        .Q(r_SM_Main[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "s_idle:000,s_tx_start_bit:001,s_tx_data_bits:010,s_tx_stop_bit:011,s_cleanup:100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_r_SM_Main_reg[1] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_r_SM_Main[1]_i_1__0_n_0 ),
        .Q(r_SM_Main[1]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "s_idle:000,s_tx_start_bit:001,s_tx_data_bits:010,s_tx_stop_bit:011,s_cleanup:100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_r_SM_Main_reg[2] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(\/FSM_sequential_r_SM_Main[2]_i_1_n_0 ),
        .Q(r_SM_Main[2]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h15)) 
    \__0/i_ 
       (.I0(r_SM_Main[1]),
        .I1(r_SM_Main[2]),
        .I2(r_SM_Main[0]),
        .O(\__0/i__n_0 ));
  LUT5 #(
    .INIT(32'h04404040)) 
    \__2/i_ 
       (.I0(r_SM_Main[2]),
        .I1(r_SM_Main[1]),
        .I2(\r_Bit_Index_reg_n_0_[2] ),
        .I3(\r_Bit_Index_reg_n_0_[1] ),
        .I4(\r_Bit_Index_reg_n_0_[0] ),
        .O(r_Bit_Index));
  LUT2 #(
    .INIT(4'h2)) 
    o_TX_Active_i_1
       (.I0(r_SM_Main[0]),
        .I1(r_SM_Main[2]),
        .O(o_TX_Active_i_1_n_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    o_TX_Active_reg
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\__0/i__n_0 ),
        .D(o_TX_Active_i_1_n_0),
        .Q(o_TX_Active_reg_n_0),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    o_TX_Serial_i_1
       (.I0(r_SM_Main[1]),
        .I1(r_SM_Main[0]),
        .O(o_TX_Serial_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    o_TX_Serial_reg
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1_n_0 ),
        .D(o_TX_Serial_i_1_n_0),
        .Q(w_TX_SERIAL_OBUF),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h7F)) 
    r_Bit_Index1
       (.I0(\r_Bit_Index_reg_n_0_[2] ),
        .I1(\r_Bit_Index_reg_n_0_[0] ),
        .I2(\r_Bit_Index_reg_n_0_[1] ),
        .O(r_Bit_Index1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFC000000020)) 
    \r_Bit_Index[0]_i_1 
       (.I0(r_Bit_Index1_n_0),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2__0_n_0 ),
        .I2(r_SM_Main[1]),
        .I3(r_SM_Main[2]),
        .I4(r_SM_Main[0]),
        .I5(\r_Bit_Index_reg_n_0_[0] ),
        .O(\r_Bit_Index[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0F0F0F0E0E0A4E0)) 
    \r_Bit_Index[1]_i_1 
       (.I0(r_SM_Main[2]),
        .I1(r_SM_Main[1]),
        .I2(\r_Bit_Index_reg_n_0_[1] ),
        .I3(\r_Bit_Index_reg_n_0_[0] ),
        .I4(\FSM_sequential_r_SM_Main[2]_i_2__0_n_0 ),
        .I5(r_SM_Main[0]),
        .O(\r_Bit_Index[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFEA0000002A)) 
    \r_Bit_Index[2]_i_1 
       (.I0(r_Bit_Index),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2__0_n_0 ),
        .I2(r_SM_Main[1]),
        .I3(r_SM_Main[2]),
        .I4(r_SM_Main[0]),
        .I5(\r_Bit_Index_reg_n_0_[2] ),
        .O(\r_Bit_Index[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_Bit_Index_reg[0] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_Bit_Index[0]_i_1_n_0 ),
        .Q(\r_Bit_Index_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Bit_Index_reg[1] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_Bit_Index[1]_i_1_n_0 ),
        .Q(\r_Bit_Index_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Bit_Index_reg[2] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_Bit_Index[2]_i_1_n_0 ),
        .Q(\r_Bit_Index_reg_n_0_[2] ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h4440)) 
    \r_Clk_Count[0]_i_1 
       (.I0(r_Clk_Count[0]),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2__0_n_0 ),
        .I2(r_SM_Main[0]),
        .I3(r_SM_Main[1]),
        .O(\r_Clk_Count[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8880)) 
    \r_Clk_Count[10]_i_1 
       (.I0(\r_Clk_Count_reg[12]_i_2__0_n_6 ),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2__0_n_0 ),
        .I2(r_SM_Main[0]),
        .I3(r_SM_Main[1]),
        .O(\r_Clk_Count[10]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8880)) 
    \r_Clk_Count[11]_i_1 
       (.I0(\r_Clk_Count_reg[12]_i_2__0_n_5 ),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2__0_n_0 ),
        .I2(r_SM_Main[0]),
        .I3(r_SM_Main[1]),
        .O(\r_Clk_Count[11]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8880)) 
    \r_Clk_Count[12]_i_1 
       (.I0(\r_Clk_Count_reg[12]_i_2__0_n_4 ),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2__0_n_0 ),
        .I2(r_SM_Main[0]),
        .I3(r_SM_Main[1]),
        .O(\r_Clk_Count[12]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \r_Clk_Count[13]_i_1 
       (.I0(r_SM_Main[2]),
        .O(\r_Clk_Count[13]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8880)) 
    \r_Clk_Count[13]_i_2 
       (.I0(\r_Clk_Count_reg[13]_i_3_n_7 ),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2__0_n_0 ),
        .I2(r_SM_Main[0]),
        .I3(r_SM_Main[1]),
        .O(\r_Clk_Count[13]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h8880)) 
    \r_Clk_Count[1]_i_1 
       (.I0(\r_Clk_Count_reg[4]_i_2__0_n_7 ),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2__0_n_0 ),
        .I2(r_SM_Main[0]),
        .I3(r_SM_Main[1]),
        .O(\r_Clk_Count[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8880)) 
    \r_Clk_Count[2]_i_1 
       (.I0(\r_Clk_Count_reg[4]_i_2__0_n_6 ),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2__0_n_0 ),
        .I2(r_SM_Main[0]),
        .I3(r_SM_Main[1]),
        .O(\r_Clk_Count[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8880)) 
    \r_Clk_Count[3]_i_1 
       (.I0(\r_Clk_Count_reg[4]_i_2__0_n_5 ),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2__0_n_0 ),
        .I2(r_SM_Main[0]),
        .I3(r_SM_Main[1]),
        .O(\r_Clk_Count[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8880)) 
    \r_Clk_Count[4]_i_1 
       (.I0(\r_Clk_Count_reg[4]_i_2__0_n_4 ),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2__0_n_0 ),
        .I2(r_SM_Main[0]),
        .I3(r_SM_Main[1]),
        .O(\r_Clk_Count[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8880)) 
    \r_Clk_Count[5]_i_1 
       (.I0(\r_Clk_Count_reg[8]_i_2__0_n_7 ),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2__0_n_0 ),
        .I2(r_SM_Main[0]),
        .I3(r_SM_Main[1]),
        .O(\r_Clk_Count[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8880)) 
    \r_Clk_Count[6]_i_1 
       (.I0(\r_Clk_Count_reg[8]_i_2__0_n_6 ),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2__0_n_0 ),
        .I2(r_SM_Main[0]),
        .I3(r_SM_Main[1]),
        .O(\r_Clk_Count[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8880)) 
    \r_Clk_Count[7]_i_1 
       (.I0(\r_Clk_Count_reg[8]_i_2__0_n_5 ),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2__0_n_0 ),
        .I2(r_SM_Main[0]),
        .I3(r_SM_Main[1]),
        .O(\r_Clk_Count[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8880)) 
    \r_Clk_Count[8]_i_1 
       (.I0(\r_Clk_Count_reg[8]_i_2__0_n_4 ),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2__0_n_0 ),
        .I2(r_SM_Main[0]),
        .I3(r_SM_Main[1]),
        .O(\r_Clk_Count[8]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8880)) 
    \r_Clk_Count[9]_i_1 
       (.I0(\r_Clk_Count_reg[12]_i_2__0_n_7 ),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2__0_n_0 ),
        .I2(r_SM_Main[0]),
        .I3(r_SM_Main[1]),
        .O(\r_Clk_Count[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[0] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1_n_0 ),
        .D(\r_Clk_Count[0]_i_1_n_0 ),
        .Q(r_Clk_Count[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[10] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1_n_0 ),
        .D(\r_Clk_Count[10]_i_1_n_0 ),
        .Q(r_Clk_Count[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[11] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1_n_0 ),
        .D(\r_Clk_Count[11]_i_1_n_0 ),
        .Q(r_Clk_Count[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[12] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1_n_0 ),
        .D(\r_Clk_Count[12]_i_1_n_0 ),
        .Q(r_Clk_Count[12]),
        .R(1'b0));
  CARRY4 \r_Clk_Count_reg[12]_i_2__0 
       (.CI(\r_Clk_Count_reg[8]_i_2__0_n_0 ),
        .CO({\r_Clk_Count_reg[12]_i_2__0_n_0 ,\r_Clk_Count_reg[12]_i_2__0_n_1 ,\r_Clk_Count_reg[12]_i_2__0_n_2 ,\r_Clk_Count_reg[12]_i_2__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\r_Clk_Count_reg[12]_i_2__0_n_4 ,\r_Clk_Count_reg[12]_i_2__0_n_5 ,\r_Clk_Count_reg[12]_i_2__0_n_6 ,\r_Clk_Count_reg[12]_i_2__0_n_7 }),
        .S(r_Clk_Count[12:9]));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[13] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1_n_0 ),
        .D(\r_Clk_Count[13]_i_2_n_0 ),
        .Q(r_Clk_Count[13]),
        .R(1'b0));
  CARRY4 \r_Clk_Count_reg[13]_i_3 
       (.CI(\r_Clk_Count_reg[12]_i_2__0_n_0 ),
        .CO(\NLW_r_Clk_Count_reg[13]_i_3_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_r_Clk_Count_reg[13]_i_3_O_UNCONNECTED [3:1],\r_Clk_Count_reg[13]_i_3_n_7 }),
        .S({1'b0,1'b0,1'b0,r_Clk_Count[13]}));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[1] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1_n_0 ),
        .D(\r_Clk_Count[1]_i_1_n_0 ),
        .Q(r_Clk_Count[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[2] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1_n_0 ),
        .D(\r_Clk_Count[2]_i_1_n_0 ),
        .Q(r_Clk_Count[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[3] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1_n_0 ),
        .D(\r_Clk_Count[3]_i_1_n_0 ),
        .Q(r_Clk_Count[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[4] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1_n_0 ),
        .D(\r_Clk_Count[4]_i_1_n_0 ),
        .Q(r_Clk_Count[4]),
        .R(1'b0));
  CARRY4 \r_Clk_Count_reg[4]_i_2__0 
       (.CI(1'b0),
        .CO({\r_Clk_Count_reg[4]_i_2__0_n_0 ,\r_Clk_Count_reg[4]_i_2__0_n_1 ,\r_Clk_Count_reg[4]_i_2__0_n_2 ,\r_Clk_Count_reg[4]_i_2__0_n_3 }),
        .CYINIT(r_Clk_Count[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\r_Clk_Count_reg[4]_i_2__0_n_4 ,\r_Clk_Count_reg[4]_i_2__0_n_5 ,\r_Clk_Count_reg[4]_i_2__0_n_6 ,\r_Clk_Count_reg[4]_i_2__0_n_7 }),
        .S(r_Clk_Count[4:1]));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[5] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1_n_0 ),
        .D(\r_Clk_Count[5]_i_1_n_0 ),
        .Q(r_Clk_Count[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[6] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1_n_0 ),
        .D(\r_Clk_Count[6]_i_1_n_0 ),
        .Q(r_Clk_Count[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[7] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1_n_0 ),
        .D(\r_Clk_Count[7]_i_1_n_0 ),
        .Q(r_Clk_Count[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[8] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1_n_0 ),
        .D(\r_Clk_Count[8]_i_1_n_0 ),
        .Q(r_Clk_Count[8]),
        .R(1'b0));
  CARRY4 \r_Clk_Count_reg[8]_i_2__0 
       (.CI(\r_Clk_Count_reg[4]_i_2__0_n_0 ),
        .CO({\r_Clk_Count_reg[8]_i_2__0_n_0 ,\r_Clk_Count_reg[8]_i_2__0_n_1 ,\r_Clk_Count_reg[8]_i_2__0_n_2 ,\r_Clk_Count_reg[8]_i_2__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\r_Clk_Count_reg[8]_i_2__0_n_4 ,\r_Clk_Count_reg[8]_i_2__0_n_5 ,\r_Clk_Count_reg[8]_i_2__0_n_6 ,\r_Clk_Count_reg[8]_i_2__0_n_7 }),
        .S(r_Clk_Count[8:5]));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clk_Count_reg[9] 
       (.C(r_CLOCK_IBUF_BUFG),
        .CE(\r_Clk_Count[13]_i_1_n_0 ),
        .D(\r_Clk_Count[9]_i_1_n_0 ),
        .Q(r_Clk_Count[9]),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
