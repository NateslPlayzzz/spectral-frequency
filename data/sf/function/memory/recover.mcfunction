# memory/recover.mcfunction — runs as @s at @s, once/sec while within 5 blocks of an anchor
scoreboard players operation @s sf.coherence += #recover_rate sf.data
execute if score @s sf.coherence matches 101.. run scoreboard players set @s sf.coherence 100
particle minecraft:end_rod ~ ~1 ~ 0.1 0.3 0.1 0.0 2