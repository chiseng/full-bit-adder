set projDir "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/planAhead"
set projName "LEDdisplay"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/mojo_top_0.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/reset_conditioner_1.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/button_conditioner_2.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/generator_bottom_3.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/generator_top_4.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/check_5.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/counter_6.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/led_matrix_7.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/leddisplay_8.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/pipeline_9.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/alu_10.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/alu_10.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/pn_gen_12.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/alu_10.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/counter_14.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/counter_15.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/adder_16.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/boolean_17.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/compare16_18.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/shifter_19.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/multiply_20.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/adder_16.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/boolean_17.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/compare16_18.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/shifter_19.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/multiply_20.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/adder_16.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/boolean_17.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/compare16_18.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/shifter_19.v" "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/work/verilog/multiply_20.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/thadd/Documents/GitHub/full-bit-adder/LEDdisplay/constraint/user.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
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
