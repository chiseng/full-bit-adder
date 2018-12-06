set projDir "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/planAhead"
set projName "LEDdisplay"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/mojo_top_0.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/reset_conditioner_1.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/generator_bottom_2.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/check_3.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/registerScore_4.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/registerCols_5.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/registerChecker_6.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/counter_7.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/led_matrix_8.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/leddisplay_9.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/Levels_10.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/alu_11.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/button_conditioner_12.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/button_conditioner_12.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/edge_detector_14.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/edge_detector_14.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/registerSetup_16.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/alu_11.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/counter_18.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/counter_19.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/adder_20.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/boolean_21.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/compare16_22.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/shifter_23.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/multiply_24.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/pipeline_25.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/pipeline_25.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/adder_20.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/boolean_21.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/compare16_22.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/shifter_23.v" "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/multiply_24.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/It'sMine/Documents/GitHub/full-bit-adder/LEDdisplay/constraint/user.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
