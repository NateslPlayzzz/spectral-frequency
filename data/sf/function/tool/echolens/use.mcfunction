# tool/echolens/use.mcfunction

execute unless data storage sf:case {state:"active"} run return run function sf:tool/evidence/no_case
execute unless entity @s[tag=sf.case_participant] run return run function sf:tool/evidence/not_participant

scoreboard players set @s sf.tool_cd 10

# The Veil Echo can only be perceived while Memory is Thinning or worse.
execute if score @s sf.coherence_band matches 3.. run return run function sf:tool/echolens/too_whole

execute if entity @e[type=marker,tag=sf.ghost,distance=..8] run function sf:tool/echolens/read
execute unless entity @e[type=marker,tag=sf.ghost,distance=..8] run function sf:tool/echolens/read_none