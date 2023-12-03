## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

set_property PACKAGE_PIN R2 [get_ports rst]     
 set_property IOSTANDARD LVCMOS33 [get_ports rst]
## Switches 

set_property PACKAGE_PIN V17 [get_ports {sw[0]}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}] 
set_property PACKAGE_PIN V16 [get_ports {sw[1]}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}] 
set_property PACKAGE_PIN W16 [get_ports {sw[2]}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}] 
set_property PACKAGE_PIN W17 [get_ports {sw[3]}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}] 
#set_property PACKAGE_PIN W15 [get_ports {sw[4]}] 
#    set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}] 
#set_property PACKAGE_PIN V15 [get_ports {sw[5]}] 
#    set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}] 
#set_property PACKAGE_PIN W14 [get_ports {sw[6]}] 
#    set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}] 
#set_property PACKAGE_PIN W13 [get_ports {sw[7]}] 
#    set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}] 
#set_property PACKAGE_PIN V2 [get_ports {sw[8]}] 
#    set_property IOSTANDARD LVCMOS33 [get_ports {sw[8]}] 
#set_property PACKAGE_PIN T3 [get_ports {sw[9]}] 
#    set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}] 
#set_property PACKAGE_PIN T2 [get_ports {sw[10]}] 
#    set_property IOSTANDARD LVCMOS33 [get_ports {sw[10]}] 
#set_property PACKAGE_PIN R3 [get_ports {sw[11]}] 
#    set_property IOSTANDARD LVCMOS33 [get_ports {sw[11]}] 
#set_property PACKAGE_PIN W2 [get_ports {sw[12]}] 
#    set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}] 
#set_property PACKAGE_PIN U1 [get_ports {sw[13]}] 
#    set_property IOSTANDARD LVCMOS33 [get_ports {sw[13]}] 
#set_property PACKAGE_PIN T1 [get_ports {sw[14]}] 
#    set_property IOSTANDARD LVCMOS33 [get_ports {sw[14]}] 
#set_property PACKAGE_PIN R2 [get_ports {sw[15]}] 
#    set_property IOSTANDARD LVCMOS33 [get_ports {sw[15]}] 
    
 ## LEDs
set_property PACKAGE_PIN U16 [get_ports {JA1}]
	set_property IOSTANDARD LVCMOS33 [get_ports {JA1}]

##Pmod Header JA 

##Sch name = JA1 

#set_property PACKAGE_PIN J1 [get_ports {JA1}] 
#set_property IOSTANDARD LVCMOS33 [get_ports {JA1}] 

##Sch name = JA2 

#set_property PACKAGE_PIN L2 [get_ports {JA[1]}] 
#set_property IOSTANDARD LVCMOS33 [get_ports {JA[1]}] 

##Sch name = JA3 

#set_property PACKAGE_PIN J2 [get_ports {JA[2]}] 
#    set_property IOSTANDARD LVCMOS33 [get_ports {JA[2]}] 

##Sch name = JA4 

#set_property PACKAGE_PIN G2 [get_ports {JA[3]}] 
#    set_property IOSTANDARD LVCMOS33 [get_ports {JA[3]}] 

##Sch name = JA7 

#set_property PACKAGE_PIN H1 [get_ports {JA[4]}] 
#    set_property IOSTANDARD LVCMOS33 [get_ports {JA[4]}] 

##Sch name = JA8 

#set_property PACKAGE_PIN K2 [get_ports {JA[5]}] 
#    set_property IOSTANDARD LVCMOS33 [get_ports {JA[5]}] 

##Sch name = JA9 

#set_property PACKAGE_PIN H2 [get_ports {JA[6]}] 
#    set_property IOSTANDARD LVCMOS33 [get_ports {JA[6]}] 

##Sch name = JA10 

#set_property PACKAGE_PIN G3 [get_ports {JA[7]}] 
#    set_property IOSTANDARD LVCMOS33 [get_ports {JA[7]}] 

## Configuration options, can be used for all designs
set_property CONFIG_VOLTAGE 3.3 [current_design]
    set_property CFGBVS VCCO [current_design]