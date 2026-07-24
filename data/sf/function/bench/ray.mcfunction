# bench/ray.mcfunction — @s player; #ray step budget
execute if block ~ ~ ~ minecraft:barrel run return run function sf:bench/at_barrel
scoreboard players add #ray sf.data 1
execute if score #ray sf.data matches 20.. run return run function sf:bench/no_barrel
execute if block ~ ~ ~ #sf:seethrough positioned ^ ^ ^0.25 run function sf:bench/ray