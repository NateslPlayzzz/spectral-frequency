# tool/camera/use.mcfunction — as @s at @s
scoreboard players set @s sf.tool_cd 8
execute if score @s sf.photo_cd matches 1.. run return run title @s actionbar {"text":"the film is still winding","color":"dark_gray","italic":true}
# Flash effect always fires (it's a camera)
function sf:tool/camera/flash
# Check what's in front of you (within ~10 blocks, roughly facing)
execute if entity @e[tag=sf.ghost,distance=..12] positioned ^ ^ ^4 if entity @e[tag=sf.ghost,distance=..5] run return run function sf:tool/camera/capture_ghost
execute if entity @e[tag=sf.uv_trace,tag=sf.uv_shown,distance=..8] run return run function sf:tool/camera/capture_trace
execute if entity @e[tag=sf.remnant,distance=..8] run return run function sf:tool/camera/capture_remnant
# Nothing of note
function sf:tool/camera/capture_empty