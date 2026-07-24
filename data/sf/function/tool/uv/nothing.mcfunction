# tool/uv/nothing.mcfunction — as @s (player) at @s
scoreboard players set @s sf.read_type 4
scoreboard players set @s sf.read_val 0
scoreboard players set @s sf.read_timer 40
particle minecraft:electric_spark ~ ~1 ~ 0.3 0.3 0.3 0.0 4
playsound minecraft:block.note_block.hat master @s ~ ~ ~ 0.4 0.8