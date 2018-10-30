<?xml version="1.0" encoding="UTF-8"?>
<project name="16BitALU" board="Mojo V3" language="Lucid">
  <files>
    <src>error_case.luc</src>
    <src>multiply.luc</src>
    <src>alu.luc</src>
    <src>boolean.luc</src>
    <src>shifter.luc</src>
    <src>seven_seg.luc</src>
    <src>compare16.luc</src>
    <src>autotester.luc</src>
    <src>adder.luc</src>
    <src>multi_seven_seg.luc</src>
    <src top="true">mojo_top.luc</src>
    <ucf lib="true">io_shield.ucf</ucf>
    <ucf lib="true">mojo.ucf</ucf>
    <component>decoder.luc</component>
    <component>reset_conditioner.luc</component>
    <component>pipeline.luc</component>
    <component>button_conditioner.luc</component>
    <component>counter.luc</component>
    <component>edge_detector.luc</component>
  </files>
</project>
