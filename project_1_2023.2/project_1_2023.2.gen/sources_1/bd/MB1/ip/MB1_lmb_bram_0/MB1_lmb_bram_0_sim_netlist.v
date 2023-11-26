// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sat Nov 25 22:23:57 2023
// Host        : LAPTOP-APNPFDQU running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/rojo_/COMPE475_Project/project_1_2023.2/project_1_2023.2.gen/sources_1/bd/MB1/ip/MB1_lmb_bram_0/MB1_lmb_bram_0_sim_netlist.v
// Design      : MB1_lmb_bram_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MB1_lmb_bram_0,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module MB1_lmb_bram_0
   (clka,
    rsta,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    web,
    addrb,
    dinb,
    doutb,
    rsta_busy,
    rstb_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [31:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [3:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [31:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;
  output rsta_busy;
  output rstb_busy;

  wire [31:0]addra;
  wire [31:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire rsta;
  wire rsta_busy;
  wire rstb;
  wire rstb_busy;
  wire [3:0]wea;
  wire [3:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "32" *) 
  (* C_ADDRB_WIDTH = "32" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "1" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.7492 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "1" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "MB1_lmb_bram_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "1" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  MB1_lmb_bram_0_blk_mem_gen_v8_4_7 U0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addra[12:2],1'b0,1'b0}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addrb[12:2],1'b0,1'b0}),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[31:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(rsta),
        .rsta_busy(rsta_busy),
        .rstb(rstb),
        .rstb_busy(rstb_busy),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[31:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jLV29U0rrfMIZhYJzdoUrPoqB9eHQ5NXmWyCdqnN3Wgm+GU4C3zthrN1m4QGiaj0thPCIynZbX+0
7yjtkv+T5ByJ6NhiofAwWseGLvPXlYu6ERAPvi4SAYpF2VUqQHtPAbPmnPubGdDRgIEpeobF7hsz
rEcpEru1pyiScUriyuo=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vsoizVrOONWw/DhjRLEYrtRmtji+Ok63CbpSg/l9VnoKAi8tAzqRbQ57atGB2N6IGGbKHkbK2Uzh
EHgWvYZeyt4hE+bpQX91vc9PNxfjQMGzPoFD3jCWk30EmEk+AND39eWx+DhJ8xhFuucoOQ2GwyAk
B+Mjs15naPE7DvlHel8hnD4dfSdYhGKp96oozu8JeBto8aHG6poOuYkxSwaut7NCI+mabCkMxtMp
RrydgmRuTvhRTbJMyx5CxFSZTRDrS5aU1vaRlnMiqKCI7g2KY9pemYaJsFeVodBuo6IyKGynyEhs
wr+VtUhQDtaVhMkwB95WwmMoDk9F2L5Au1I+TQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
W081dPMCWhKs5YlQD7n3zvf7+PTcnb8eFWxoVs8+zHLkxDMA1klITbsfztGYvJFce8Yao5XQLLqZ
oUE5Pq2arq+zwICFUcLjdMsmP1WmL82znHOPHm83zNwrxWMloHkySAqzFbgJeHa973uZqj0M8ydc
sYmzCYVlGVjt0QX0xqA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Zpc3MmdLWaVOv+S4z2POuoyslYoAbWc+Npxq2UyQRtDwf566IId3uwAetolMAgfLo/G3ezuSOXMn
8NznS37h9XvmVrxA50SAux68P87WgkLtiUYqM3CMBKkxNlZ/TR8WzTuQyFdvzkOE9lp8HC7LXnk5
RDsnOM+su46FW7ysY01COslo9Xc7rhs6WFqx29+Xcqk8+ZMLSzaJfuwZdNmJFS3Q1vhlq3ZeYqMl
wMieB731KsPxjxp7VKNHpTbgFryC2isqc4ohBDOt52M/Bz4B/rIpFeHfZ7X3jWSiKtSuBsDN2NXf
EMjfAT248dlK7NxJ+NBNPhS5sLxTiGyQhta57A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPMYqnkKhJKV1wltOfDrKos9ZbucaoX3WGTuqsdLkGpcKObzslHBwlGrKtWV7bZYmS2SM+QuEMfa
CE+tCUdsSiprp+n5BuSQlJa6BJ8mlqccjoo/JLw2QEmUhyMXQ3TLGomGGoZdeTmMPXhUBAOyLPea
Ddc8mgtTN8Kpy117GOTXDKP+IKJqW01fLrPJpgEhFiJCbyElLgtCRWmI94gX+y4XNVS0Cd1YwNw6
4nHgnEdC7fXARDKcYO3VsWC/pdzPQgursXloNLrVYa6i2xr+8E1V0+nSWwNYQZP7XUIVqXKMU8Ea
bT4acXrRCF/5tJJ5B9JparYI0zxXSbaakn1dIw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mfroTgL8g2pyIXQ/mGO9YHm19cd5mOlJ++qpusOYeVxGmkIhvF4aKx+AyIUz2yGGAeCtOzIasHty
pyqKgZhibSqxcpHgR0m6GOxXXOXJiHaK8NzxUzXeRJovcBI/WjtDhXeb1LRMI1J97jVBtJPJQH0Y
fGOD7jWvkvQwxnrZdyLp6kPWgSIcavHHDbO7iJv4gnyGp6W3/FCDo2RKWNLoW+SNjSdLZ6YRP8a+
ldaGU8TYvJ03KWlmik7repuN6AwxCjg2KeQ+x1sBAEXzROXomuSbvX3ZAo8UiIKAQY1SJumHLG3L
QI/S4Wbl1Hz6LDTsttMwP480gq6+tb6s1E4oWw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QJIabgm8dx/gVHbOQFwt8maOKVHFgkpZTPR6dzD8fqoGo9M9oGPTqBqchtPZWgv2UYFF2KEUSlV4
L3SDXBKrLs+NsAVTcICaEMiEi6j82zj/C1LsPkQfS8RLrg0ab8lbDMb5YqJ7lkHs3iM65x2iN1Mf
66cTgCbkAdl3rDpab75btpTQt5ZKiq5CSY3RZfyIW0uWbTGTELm6liuRKM9+K8BQwTU7A+FFFQBA
/9eJwQYzNNA/iwoYJ2WTPd6pBlzXriNLu9M+/2bYicNBSuH1PBR9v2ESrTB6k7EiV1zvBXV9NuG/
sFt4MumWMuSNwP2W38bQATxxW/l0IrmaXGOC/w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
lhKf/Vgj6pHpme1ji4HVe36BU8pMkam/2I9lFeyOiBnIbzgdEGfLJBcEvkL33A7s0hxa6LFbHnkT
upgMpPjmIghBz3xUQ13vpiY152thFec6qvlcdg1r+GTmnBOSFl6g/OfZ3eFUhfsve6ZjQHpXnKFo
a55hN2+eP1EG9+VxGeM7XkHaeFhEIry52qtnmg072KEFIwRiGs2d/TJ4AqupuIdIiP1kTN9k+oqa
2ta1vdtqPY0dDHqrf+5YSd0CejkhQeCqg/bauLP3755SwdOPRgooG5ANT8hUpTiFMFXtU+GC9NSp
evJtMHUy1NbgMmhFHO+w3URLEdjSaBxZPD7YLdWkF65jY526tJzoek+BzEKoBaGfCaY7O1nHKXm+
89k3rPUy0Xo4/0nHpno+N/Db09heJPbnGsCwN/l+KnR6Lz8kvWziBjZe0ijOkKI+T12y3T1VeOtY
H/aqtNlQt1mhFwrbw6ezaAiDPVbCQXnly6b4tbb8+nFsxWOGIGAfLozB

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PNsQ8uEcQYrl+GaDuBaq1tQ5br5aAdaqHnyrc0NVu/JnQUk53jaiLx8Oz5fNACvWelUUk2/C+P5I
b2rbU1bb/dC6TqC5J1N0yoMYRYw58u4Lrl8Kgqgt9Rlph5Qgzzfxp+oblXF/pO4mRyAXpZhpNkFT
0Ar9BUtPOTOtJ9/g53SRnZ6GjxzfeD+25J4fcXBNo2gCTgUkwiLSsJRwTB/cJmn+dZPwPdIOHEP9
TkfDK+OrbLYO3T+DFBTCMRNH2NB1J9sc5s+nPU8iYnjgPTo6HoGW+LIlCz6yNJMZzJzoeW708utc
0fJXkT7vLDVh7olvy3V9AAY8Do0YR1kiZlhVhQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zAz8RnGHFebkJFAS+gjC+mXHW7m7We+JgSmIz15mS01u/4+9Ng0sJfkeXOClmVPTQ2Mp2Yuv6/6f
ehzUTcANilWsqLM6Q1FToCPNX/NTqodlcHirGM7b5R9yevouNT/aqH12nmbunBQmBHmehNutdCjG
r6Z7kZgeZ2ZE7MMOF0rTy1XHEPkqgMNTRoS8R/pPWPTW4/j+bn3aJj0Q/fTz4Gi3mbSUKWs2fREQ
UKiuolNJkN6DiDvhlVYHUyytXNJG44ikmBXehoQQRLapkYaxnQmMRT1ok9uY6pKoy71CtvJ3Mt2x
EQv1GU2i4qQyAOwa0mkEohWXduicU6tDz3zQwQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TK3eE9V+v1z2P1KjG4GrjhA1n3qDOpNzLGXdtjnjhF0QBFPSuhC+nmNqTPOb3p2a9r5KD0miY3Cd
+KpjH6Ao09E2/LD2Go4aLQh6vP+9BldlSKEwCGfx2NjBQrXWVH21lQR7IRjOvyTOclpd7SgtUJLw
dvebETyLiKr9C6RfnIBeptuCA3iJlXfwkh6I0JfzD5WBizQkotioZmmrXv5105pCXQ4Ta1WThFsA
2ll9dZeSjEDHUxxhfyfjryv9m4VL89ZDU/rGITsdptwB1BC1jLqmPDymY05lyECnjA6NIR5GGfI4
K2y2f4GfikKoN5r9IOvFzw963Wm82ZZPtXOKGg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 59760)
`pragma protect data_block
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
VWYEePhHgq9dGwDsjVJ8jm98zH8dTbBT
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
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
    reg GRESTORE_int;

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
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
