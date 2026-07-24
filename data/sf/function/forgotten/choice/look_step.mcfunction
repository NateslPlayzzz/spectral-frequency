# forgotten/choice/look_step.mcfunction
# Thirty one-block steps, preserving the player's current rotation.

execute if entity @e[type=minecraft:marker,tag=sf.forgotten,distance=..1.5,limit=1] run scoreboard players set #choice_look sf.data 1

scoreboard players add #choice_ray sf.data 1

execute if score #choice_look sf.data matches 0 if score #choice_ray sf.data matches ..29 positioned ^ ^ ^1 run function sf:forgotten/choice/look_step