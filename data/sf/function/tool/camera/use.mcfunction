# tool/camera/use.mcfunction
# Performs one current-generation case-documentation exposure.

execute unless data storage sf:case {state:"active"} run return run function sf:tool/evidence/no_case
execute unless entity @s[tag=sf.case_participant] run return run function sf:tool/evidence/not_participant
execute unless score @s sf.case_gen = #case_serial sf.data run return run title @s actionbar {"text":"your field record belongs to another investigation","color":"#FFC36B","italic":true}
execute if score @s sf.claimed matches 1.. run return 0
execute if entity @s[gamemode=spectator] run return 0

scoreboard players set @s sf.tool_cd 8

execute if score @s sf.photo_cd matches 1.. run return run title @s actionbar {"text":"the film is still winding","color":"dark_gray","italic":true}

function sf:tool/camera/flash

tag @e remove sf.camera_target

# Select a current-generation manifestation inside the approximate photographed field.
execute positioned ^ ^ ^4 as @e[type=minecraft:marker,tag=sf.ghost,tag=!sf.forgotten,distance=..5] if score @s sf.data = #case_serial sf.data run tag @s add sf.camera_target
execute if entity @e[type=minecraft:marker,tag=sf.camera_target] run return run function sf:tool/camera/capture_ghost

# Revealed residue must also appear inside the photographed field rather than merely nearby.
execute positioned ^ ^ ^4 if entity @e[type=minecraft:marker,tag=sf.uv_trace,tag=sf.uv_shown,distance=..5] run return run function sf:tool/camera/capture_trace

# Only the authoritative current-generation Remnant interaction is photographable.
execute positioned ^ ^ ^4 as @e[type=minecraft:interaction,tag=sf.remnant_interact,distance=..5] if score @s sf.data = #case_serial sf.data run tag @s add sf.camera_target
execute if entity @e[type=minecraft:interaction,tag=sf.camera_target] run return run function sf:tool/camera/capture_remnant

function sf:tool/camera/capture_empty