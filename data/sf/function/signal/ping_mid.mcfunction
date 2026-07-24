# signal/ping_mid.mcfunction

scoreboard players set @s sf.sig_miss 0

playsound minecraft:block.note_block.bit player @s ~ ~ ~ 0.48 0.95
playsound minecraft:block.sculk_sensor.clicking player @s ~ ~ ~ 0.25 1.0

particle minecraft:electric_spark ~ ~1 ~ 0.18 0.28 0.18 0.02 5