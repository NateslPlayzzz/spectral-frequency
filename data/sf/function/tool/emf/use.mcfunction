# tool/emf/use.mcfunction
# Runs as the player at their current position.

execute unless data storage sf:case {state:"active"} run return run function sf:tool/evidence/no_case
execute unless entity @s[tag=sf.case_participant] run return run function sf:tool/evidence/not_participant

scoreboard players set @s sf.tool_cd 8

execute if entity @e[type=marker,tag=sf.ghost,distance=..8] run function sf:tool/emf/read
execute unless entity @e[type=marker,tag=sf.ghost,distance=..8] run function sf:tool/emf/read_none