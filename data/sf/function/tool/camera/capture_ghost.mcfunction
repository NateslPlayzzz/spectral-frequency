# tool/camera/capture_ghost.mcfunction
# Records one successful manifestation photograph.

scoreboard players add @s sf.photo_count 1

# One dangerous Hunt photograph may crystallize one personal Veil Shard per
# player per investigation.
execute if entity @e[type=minecraft:marker,tag=sf.ghost,tag=sf.state.hunt,distance=..12] if score @s sf.case_hunt_photo matches 0 run function sf:tool/camera/hunt_shard

# Only the first manifestation photograph in this investigation restores
# Memory and contributes to performance scoring.
execute if score @s sf.case_photo matches 0 run return run function sf:tool/camera/capture_ghost_first

function sf:tool/camera/capture_ghost_repeat