# ghost/hunt/warn.mcfunction
# Three-second pre-Hunt warning.

tag @s remove sf.state.idle
tag @s remove sf.state.cooldown
tag @s add sf.state.warning
tag @s remove sf.roaming

scoreboard players set @s sf.hunt_timer 3

execute at @s run playsound minecraft:ambient.cave ambient @a[tag=sf.case_participant,distance=..32] ~ ~ ~ 1 0.3
execute at @s run playsound minecraft:block.deepslate.fall ambient @a[tag=sf.case_participant,distance=..32] ~ ~ ~ 0.8 0.5

particle minecraft:large_smoke ~ ~0.5 ~ 0.3 0.4 0.3 0.02 20

execute as @a[tag=sf.case_participant,distance=..32] run title @s actionbar {"text":"the air goes wrong","color":"#5A2A2A","italic":true}