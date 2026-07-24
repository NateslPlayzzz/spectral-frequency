# signal/ping_close.mcfunction

scoreboard players set @s sf.sig_miss 0

playsound minecraft:block.note_block.bit player @s ~ ~ ~ 0.62 1.45
playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.28 1.3
playsound minecraft:block.sculk_sensor.clicking player @s ~ ~ ~ 0.32 1.35

particle minecraft:electric_spark ~ ~1 ~ 0.28 0.4 0.28 0.03 8
particle minecraft:reverse_portal ~ ~1 ~ 0.12 0.22 0.12 0.01 4