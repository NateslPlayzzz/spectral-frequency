# tool/spiritbox/use.mcfunction
# Runs as the player at their current position.

execute unless data storage sf:case {state:"active"} run return run function sf:tool/evidence/no_case
execute unless entity @s[tag=sf.case_participant] run return run function sf:tool/evidence/not_participant

scoreboard players set @s sf.tool_cd 12

# Spirit Box responses require an actual dark location.
execute unless predicate sf:in_darkness run return run function sf:tool/spiritbox/too_bright

execute if entity @e[type=minecraft:marker,tag=sf.ghost,distance=..8] run function sf:tool/spiritbox/read
execute unless entity @e[type=minecraft:marker,tag=sf.ghost,distance=..8] run function sf:tool/spiritbox/read_none