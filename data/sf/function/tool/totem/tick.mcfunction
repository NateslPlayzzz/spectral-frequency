# tool/totem/tick.mcfunction — once/sec per ward
scoreboard players remove @s sf.hunt_timer 1
# Protective aura particles (radius-ish visual)
particle minecraft:wax_on ~ ~0.2 ~ 3 0.3 3 0.0 10
particle minecraft:end_rod ~ ~0.5 ~ 2 0.4 2 0.0 4
# Recover memory for players within the ward radius
execute as @a[tag=spectral.sf_init,distance=..6] run scoreboard players operation @s sf.coherence += #totem_recover sf.data
execute as @a[tag=spectral.sf_init,distance=..6] run function sf:memory/clamp_high
# Low-life warning flicker in the last 10 seconds
execute if score @s sf.hunt_timer matches ..10 run particle minecraft:smoke ~ ~0.5 ~ 0.3 0.4 0.3 0.01 8
execute if score @s sf.hunt_timer matches ..10 if score @s sf.hunt_timer matches 1.. run playsound minecraft:block.candle.ambient ambient @a[distance=..8] ~ ~ ~ 0.4 0.7
# Expire
execute if score @s sf.hunt_timer matches ..0 run function sf:tool/totem/expire