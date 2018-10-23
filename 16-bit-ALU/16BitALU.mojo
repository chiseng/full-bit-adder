<?xml version="1.0" encoding="UTF-8"?>
<project name="16BitALU" board="Mojo V3" language="Lucid">
  <files>
    <src>adder.luc</src>
    <src top="true">mojo_top.luc</src>
    <src>multiply.luc</src>
    <src>alu.luc</src>
    <src>seven_seg.luc</src>
    <src>boolean.luc</src>
    <src>compare16.luc</src>
    <src>shifter.luc</src>
    <ucf lib="true">mojo.ucf</ucf>
    <ucf lib="true">io_shield.ucf</ucf>
    <component>pipeline.luc</component>
    <component>button_conditioner.luc</component>
    <component>reset_conditioner.luc</component>
  </files>
</project>
