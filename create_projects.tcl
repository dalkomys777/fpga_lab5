set root [file normalize [file dirname [info script]]]
set circuits "$root/circuits"
set part "xc7s75fgga484-1"

proc configure_project {name project_dir top sources constraint testbench} {
    global part
    create_project $name $project_dir -part $part -force
    set_property target_language Verilog [current_project]
    set_property simulator_language Mixed [current_project]
    set_property target_simulator XSim [current_project]

    add_files -norecurse $sources
    add_files -fileset constrs_1 -norecurse $constraint
    add_files -fileset sim_1 -norecurse $testbench

    set_property top $top [get_filesets sources_1]
    set_property top tb [get_filesets sim_1]
    set_property xsim.simulate.runtime all [get_filesets sim_1]

    update_compile_order -fileset sources_1
    update_compile_order -fileset sim_1

    if {[get_property top [get_filesets sources_1]] ne $top} {
        error "$name design top was not set to $top"
    }
    if {[get_property top [get_filesets sim_1]] ne "tb"} {
        error "$name simulation top was not set to tb"
    }

    puts "CREATED $name: design_top=$top simulation_top=tb"
    close_project
}

configure_project lab5_piano "$circuits/01_piano" piano [list     "$circuits/01_piano/src/note_select.v"     "$circuits/01_piano/src/square_tone.v"     "$circuits/01_piano/src/piano.v"]     "$circuits/01_piano/constraints/lab5_piano.xdc"     "$circuits/01_piano/sim/tb_design.v"

configure_project lab5_traffic "$circuits/02_traffic" traffic [list     "$circuits/02_traffic/src/second_tick.v"     "$circuits/02_traffic/src/traffic_sequence.v"     "$circuits/02_traffic/src/traffic_lights.v"     "$circuits/02_traffic/src/traffic.v"]     "$circuits/02_traffic/constraints/lab5_traffic.xdc"     "$circuits/02_traffic/sim/tb_design.v"

configure_project lab5_adc "$circuits/03_adc" adc_hw [list     "$circuits/03_adc/src/adc_command.v"     "$circuits/03_adc/src/serial_frame16.v"     "$circuits/03_adc/src/adc.v"     "$circuits/03_adc/src/adc_hw.v"]     "$circuits/03_adc/constraints/lab5_adc.xdc"     "$circuits/03_adc/sim/tb_design.v"

puts "LAB5 Vivado projects created successfully."