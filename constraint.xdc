## Clock signal (50 MHz Onboard Clock)
set_property -dict { PACKAGE_PIN H11    IOSTANDARD LVCMOS33 } [get_ports { clk }];

## Switches
# Switch 1 for Reset
set_property -dict { PACKAGE_PIN K11    IOSTANDARD LVCMOS33 } [get_ports { reset }];
# Switch 2 for Mode (Up/Down)
set_property -dict { PACKAGE_PIN M11    IOSTANDARD LVCMOS33 } [get_ports { mode }];

set_property -dict { PACKAGE_PIN M14    IOSTANDARD LVCMOS33 } [get_ports { count_val[0] }]; # Digit 1
set_property -dict { PACKAGE_PIN P13    IOSTANDARD LVCMOS33 } [get_ports { count_val[1] }]; # Digit 2
set_property -dict { PACKAGE_PIN N11   IOSTANDARD LVCMOS33 } [get_ports { count_val[2] }]; # Digit 3
set_property -dict { PACKAGE_PIN P11   IOSTANDARD LVCMOS33 } [get_ports { count_val[3] }]; # Digit 4


## 4-Digit 7-Segment Display (Digit Selectors - Anodes)
set_property -dict { PACKAGE_PIN H4    IOSTANDARD LVCMOS33 } [get_ports { digit[0] }]; # Digit 1
set_property -dict { PACKAGE_PIN H3    IOSTANDARD LVCMOS33 } [get_ports { digit[1] }]; # Digit 2
set_property -dict { PACKAGE_PIN H2    IOSTANDARD LVCMOS33 } [get_ports { digit[2] }]; # Digit 3
set_property -dict { PACKAGE_PIN H1    IOSTANDARD LVCMOS33 } [get_ports { digit[3] }]; # Digit 4

## 7-Segment Cathodes (Segments a to g and Decimal Point)
# Map: sseg[0]=a, sseg[1]=b, sseg[2]=c, sseg[3]=d, sseg[4]=e, sseg[5]=f, sseg[6]=g, sseg[7]=dp
set_property -dict { PACKAGE_PIN L3    IOSTANDARD LVCMOS33 } [get_ports { sseg[7] }]; # Segment a
set_property -dict { PACKAGE_PIN P4    IOSTANDARD LVCMOS33 } [get_ports { sseg[6] }]; # Segment b
set_property -dict { PACKAGE_PIN P2    IOSTANDARD LVCMOS33 } [get_ports { sseg[5] }]; # Segment c
set_property -dict { PACKAGE_PIN M3    IOSTANDARD LVCMOS33 } [get_ports { sseg[4] }]; # Segment d
set_property -dict { PACKAGE_PIN M1    IOSTANDARD LVCMOS33 } [get_ports { sseg[3] }]; # Segment e
set_property -dict { PACKAGE_PIN J4    IOSTANDARD LVCMOS33 } [get_ports { sseg[2] }]; # Segment f
set_property -dict { PACKAGE_PIN K4    IOSTANDARD LVCMOS33 } [get_ports { sseg[1] }]; # Segment g
set_property -dict { PACKAGE_PIN J2    IOSTANDARD LVCMOS33 } [get_ports { sseg[0] }]; # Decimal Point

