# tool/camera/use.mcfunction
# Performs one enrolled case-documentation exposure.

execute unless data storage sf:case {state:"active"} run return run function sf:tool/evidence/no_case
execute unless entity @s[tag=sf.case_participant] run return run function sf:tool/evidence/not_participant
execute if score @s sf.claimed matches 1.. run return 0
execute if entity @s[gamemode=spectator] run return 0

scoreboard players set @s sf.tool_cd 8

execute if score @s sf.photo_cd matches 1.. run return run title @s actionbar {"text": "the film is still winding","color": "dark_gray","italic": true}

function sf:tool/camera/flash

# Manifestation in the photographed field.
execute if entity @e[type=minecraft:marker,tag=sf.ghost,distance=..12] positioned ^ ^ ^4 if entity @e[type=minecraft:marker,tag=sf.ghost,distance=..5] run return run function sf:tool/camera/capture_ghost

# Revealed physical residue.
execute if entity @e[type=minecraft:marker,tag=sf.uv_trace,tag=sf.uv_shown,distance=..8] run return run function sf:tool/camera/capture_trace

# Taken-player Remnant.
execute if entity @e[tag=sf.remnant,distance=..8] run return run function sf:tool/camera/capture_remnant

function sf:tool/camera/capture_empty