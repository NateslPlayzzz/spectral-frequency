# tool/totem/tick.mcfunction
# Runs once per second as each loaded ward.

execute unless data storage sf:case {state:"active"} run return run kill @s
execute unless score @s sf.data = #case_serial sf.data run return run kill @s

scoreboard players remove @s sf.hunt_timer 1

particle minecraft:wax_on ~ ~0.2 ~ 3 0.3 3 0.0 10
particle minecraft:end_rod ~ ~0.5 ~ 2 0.4 2 0.0 4

execute as @a[tag=spectral.sf_init,tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0,sf.coherence=..99},distance=..6] if score @s sf.case_gen = #case_serial sf.data run scoreboard players operation @s sf.coherence += #totem_recover sf.data
execute as @a[tag=spectral.sf_init,tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..6] if score @s sf.case_gen = #case_serial sf.data run function sf:memory/clamp_high

execute if score @s sf.hunt_timer matches 1..10 run particle minecraft:smoke ~ ~0.5 ~ 0.3 0.4 0.3 0.01 8
execute if score @s sf.hunt_timer matches 1..10 run playsound minecraft:block.candle.ambient ambient @a[tag=sf.case_participant,distance=..8] ~ ~ ~ 0.4 0.7

execute if score @s sf.hunt_timer matches ..0 run function sf:tool/totem/expire