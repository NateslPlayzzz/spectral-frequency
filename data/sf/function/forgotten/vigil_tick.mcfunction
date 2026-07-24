# forgotten/vigil_tick.mcfunction — endurance + truth surfacing, coherence HELD at brink
scoreboard players add @s sf.vigil_timer 1
# Hold coherence at the brink — pressure without death (Phase-2-can't-fail)
execute if score @s sf.coherence matches ..3 run scoreboard players set @s sf.coherence 3
# Ambient dread: his presence
particle minecraft:sculk_soul ~ ~1 ~ 1 1 1 0.02 4
playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.4 0.5
# Surface a memory every ~8 seconds (the truth assembling)
execute if score @s sf.vigil_timer matches 8 run function sf:forgotten/memory/1
execute if score @s sf.vigil_timer matches 16 run function sf:forgotten/memory/2
execute if score @s sf.vigil_timer matches 24 run function sf:forgotten/memory/3
execute if score @s sf.vigil_timer matches 32 run function sf:forgotten/memory/4
# After the truth is told, open the threshold to the choice (25c)
execute if score @s sf.vigil_timer matches 40.. run function sf:forgotten/vigil_complete