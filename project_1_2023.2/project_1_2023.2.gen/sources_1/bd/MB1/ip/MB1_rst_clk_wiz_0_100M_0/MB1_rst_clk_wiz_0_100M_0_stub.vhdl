-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Sat Nov 25 22:23:39 2023
-- Host        : LAPTOP-APNPFDQU running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/rojo_/COMPE475_Project/project_1_2023.2/project_1_2023.2.gen/sources_1/bd/MB1/ip/MB1_rst_clk_wiz_0_100M_0/MB1_rst_clk_wiz_0_100M_0_stub.vhdl
-- Design      : MB1_rst_clk_wiz_0_100M_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MB1_rst_clk_wiz_0_100M_0 is
  Port ( 
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end MB1_rst_clk_wiz_0_100M_0;

architecture stub of MB1_rst_clk_wiz_0_100M_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "slowest_sync_clk,ext_reset_in,aux_reset_in,mb_debug_sys_rst,dcm_locked,mb_reset,bus_struct_reset[0:0],peripheral_reset[0:0],interconnect_aresetn[0:0],peripheral_aresetn[0:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "proc_sys_reset,Vivado 2023.2";
begin
end;
