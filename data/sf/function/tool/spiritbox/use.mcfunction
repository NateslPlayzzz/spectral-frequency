# tool/spiritbox/use.mcfunction
# Conducts one dark-room communication attempt.

scoreboard players set @s sf.tool_cd 12

execute unless predicate sf:in_darkness run return run function sf:tool/spiritbox/too_bright

scoreboard players set #scan_near sf.data 0

execute if entity @e[type=minecraft:marker,tag=sf.ghost,distance=..8] run scoreboard players set #scan_near sf.data 1

execute if score #scan_near sf.data matches 1 run function sf:tool/spiritbox/read
execute unless score #scan_near sf.data matches 1 run function sf:tool/spiritbox/read_none