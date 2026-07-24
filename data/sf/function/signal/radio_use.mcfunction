# signal/radio_use.mcfunction
# Opens the UMBRA Field Radio interface.

scoreboard players set @s sf.tool_cd 8
scoreboard players enable @s sf.signal

# Clear any obsolete random-offer prompt left from an older build.
scoreboard players set @s sf.offer_active 0
scoreboard players set @s sf.offer_timer 0

playsound minecraft:block.note_block.bit player @s ~ ~ ~ 0.65 1.35
playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.3 0.8
particle minecraft:electric_spark ~ ~1 ~ 0.18 0.25 0.18 0.02 5

dialog show @s sf:field_radio