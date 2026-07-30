# tool/echolens/use.mcfunction
# Performs one Memory-straining Veil exposure.

execute unless data storage sf:case {state:"active"} run return run function sf:tool/evidence/no_case
execute unless entity @s[tag=sf.case_participant] run return run function sf:tool/evidence/not_participant
execute if score @s sf.claimed matches 1.. run return 0
execute if entity @s[gamemode=spectator] run return 0

# Prevent rapid repeated threshold checks.
scoreboard players set @s sf.tool_cd 10

# The Veil Echo can only be perceived while Memory is Thinning or worse.
execute if score @s sf.coherence_band matches 3.. run return run function sf:tool/echolens/too_whole

# Zero Memory is not a stable observation state. The player is already at the
# threshold of being Taken and cannot obtain a free perfect reading.
execute if score @s sf.coherence matches ..0 run return run function sf:tool/echolens/too_far_gone

scoreboard players set @s sf.tool_cd 20
scoreboard players set #scan_near sf.data 0

execute if entity @e[type=minecraft:marker,tag=sf.ghost,distance=..8] run scoreboard players set #scan_near sf.data 1

# Reliability is calculated from the Memory band at the moment the exposure
# begins. The strain is applied after the result resolves.
execute if score #scan_near sf.data matches 1 run function sf:tool/echolens/read
execute unless score #scan_near sf.data matches 1 run function sf:tool/echolens/read_none

# Every successful optical exposure strains the Investigator's Memory.
scoreboard players remove @s sf.coherence 2
execute if score @s sf.coherence matches ..0 run scoreboard players set @s sf.coherence 0

playsound minecraft:entity.warden.heartbeat hostile @s ~ ~ ~ 0.35 1.35
particle minecraft:reverse_portal ~ ~1 ~ 0.12 0.2 0.12 0.01 5