<?xml version="1.0" encoding="UTF-8"?>
<project name="16BitALU" board="Mojo V3" language="Lucid">
  <files>
    <src>multiply.luc</src>
    <src>boolean.luc</src>
    <src>alu.luc</src>
    <src>shifter.luc</src>
    <src>theGame.luc</src>
    <src>seven_seg.luc</src>
    <src>compare16.luc</src>
    <src>autotester.luc</src>
    <src>multi_seven_seg.luc</src>
    <src>adder.luc</src>
    <src top="true">mojo_top.luc</src>
    <ucf lib="true">io_shield.ucf</ucf>
    <ucf lib="true">mojo.ucf</ucf>
    <ucf>user.ucf</ucf>
    <component>pn_gen.luc</component>
    <component>decoder.luc</component>
    <component>reset_conditioner.luc</component>
    <component>pipeline.luc</component>
    <component>button_conditioner.luc</component>
    <component>counter.luc</component>
    <component>edge_detector.luc</component>
  </files>
</project>
