# tool/uv/use.mcfunction
# Sweeps for hidden or already-revealed residue from the current case.

execute unless data storage sf:case {state:"active"} run return run function sf:tool/evidence/no_case
execute unless entity @s[tag=sf.case_participant] run return run function sf:tool/evidence/not_participant
execute if score @s sf.claimed matches 1.. run return 0
execute if entity @s[gamemode=spectator] run return 0

scoreboard players set @s sf.tool_cd 8

# Defensively remove nearby residue belonging to an older case before the
# scanner decides whether a valid trace exists.
execute as @e[type=minecraft:marker,tag=sf.uv_trace,distance=..6] unless score @s sf.data = #case_serial sf.data run kill @s

execute if entity @e[type=minecraft:marker,tag=sf.uv_trace,distance=..6] run function sf:tool/uv/reveal
execute unless entity @e[type=minecraft:marker,tag=sf.uv_trace,distance=..6] run function sf:tool/uv/nothing