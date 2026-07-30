# tool/thermo/use.mcfunction
# Performs one local temperature scan.

scoreboard players set @s sf.tool_cd 8
scoreboard players set #scan_near sf.data 0

execute if entity @e[type=minecraft:marker,tag=sf.ghost,distance=..8] run scoreboard players set #scan_near sf.data 1

execute if score #scan_near sf.data matches 1 run function sf:tool/thermo/read
execute unless score #scan_near sf.data matches 1 run function sf:tool/thermo/read_none