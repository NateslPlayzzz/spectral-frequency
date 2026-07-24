# bench/ray_selected.mcfunction

execute if block ~ ~ ~ minecraft:barrel run return run function sf:bench/at_barrel_selected

scoreboard players add #ray sf.data 1

execute if score #ray sf.data matches 20.. run return run function sf:bench/no_barrel

# A solid obstruction ends the ray immediately instead of failing silently.
execute unless block ~ ~ ~ #sf:seethrough run return run function sf:bench/no_barrel

execute positioned ^ ^ ^0.25 run function sf:bench/ray_selected