set projDir "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/planAhead"
set projName "LEDdisplay"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/mojo_top_0.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/reset_conditioner_1.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/generator_bottom_2.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/check_3.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/registerScore_4.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/registerCols_5.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/registerChecker_6.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/counter_7.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/led_matrix_8.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/leddisplay_9.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/Levels_10.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/edge_detector_11.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/alu_12.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/button_conditioner_13.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/button_conditioner_13.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/edge_detector_15.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/edge_detector_15.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/registerSetup_17.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/alu_12.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/counter_19.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/counter_20.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/adder_21.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/boolean_22.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/compare16_23.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/shifter_24.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/multiply_25.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/pipeline_26.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/pipeline_26.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/adder_21.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/boolean_22.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/compare16_23.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/shifter_24.v" "/home/dominic/repositories/full-bit-adder/LEDdisplay/work/verilog/multiply_25.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "/home/dominic/repositories/full-bit-adder/LEDdisplay/constraint/user.ucf" "/home/dominic/Downloads/mojo-ide-B1.3.6/library/components/mojo.ucf"]
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
