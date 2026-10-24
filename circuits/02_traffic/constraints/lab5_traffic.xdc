# LAB5 Traffic Lights - HBE-Combo II-DLD Spartan-7 S75 (xc7s75fgga484-1)
# The array indices follow the course-text table exactly:
# [3]=South, [2]=North, [1]=West, [0]=East.
set_property PACKAGE_PIN B6 [get_ports clk_50mhz]
set_property PACKAGE_PIN K4 [get_ports rst_p]
set_property PACKAGE_PIN N8 [get_ports flicker]

# Vehicle green
set_property PACKAGE_PIN E16 [get_ports {led_green[3]}]
set_property PACKAGE_PIN C16 [get_ports {led_green[2]}]
set_property PACKAGE_PIN A20 [get_ports {led_green[1]}]
set_property PACKAGE_PIN E11 [get_ports {led_green[0]}]

# Vehicle yellow
set_property PACKAGE_PIN L18 [get_ports {led_yellow[3]}]
set_property PACKAGE_PIN A14 [get_ports {led_yellow[2]}]
set_property PACKAGE_PIN C18 [get_ports {led_yellow[1]}]
set_property PACKAGE_PIN D13 [get_ports {led_yellow[0]}]

# Vehicle left turn (RTL port led_left corresponds to the text's led_left_o)
set_property PACKAGE_PIN F15 [get_ports {led_left[3]}]
set_property PACKAGE_PIN D15 [get_ports {led_left[2]}]
set_property PACKAGE_PIN C19 [get_ports {led_left[1]}]
set_property PACKAGE_PIN F10 [get_ports {led_left[0]}]

# Vehicle red
set_property PACKAGE_PIN B13 [get_ports {led_red[3]}]
set_property PACKAGE_PIN G14 [get_ports {led_red[2]}]
set_property PACKAGE_PIN C17 [get_ports {led_red[1]}]
set_property PACKAGE_PIN C12 [get_ports {led_red[0]}]

# Pedestrian green
set_property PACKAGE_PIN E19 [get_ports {led_walk_green[3]}]
set_property PACKAGE_PIN F12 [get_ports {led_walk_green[2]}]
set_property PACKAGE_PIN A16 [get_ports {led_walk_green[1]}]
set_property PACKAGE_PIN G11 [get_ports {led_walk_green[0]}]

# Pedestrian red
set_property PACKAGE_PIN A19 [get_ports {led_walk_red[3]}]
set_property PACKAGE_PIN G13 [get_ports {led_walk_red[2]}]
set_property PACKAGE_PIN E18 [get_ports {led_walk_red[1]}]
set_property PACKAGE_PIN C11 [get_ports {led_walk_red[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports *]
create_clock -name clk_50mhz -period 20.000 [get_ports clk_50mhz]
set_false_path -from [get_ports {rst_p flicker}]