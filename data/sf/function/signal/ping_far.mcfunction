# signal/ping_far.mcfunction

scoreboard players set @s sf.sig_miss 0

playsound minecraft:block.note_block.bit player @s ~ ~ ~ 0.35 0.58
playsound minecraft:block.sculk_sensor.clicking player @s ~ ~ ~ 0.18 0.7

particle minecraft:electric_spark ~ ~1 ~ 0.12 0.2 0.12 0.01 3