# tool/camera/capture_ghost.mcfunction
# Records one successfully framed current-generation manifestation.

scoreboard players add @s sf.photo_count 1

# One dangerous Hunt image may crystallize one personal Veil Shard per case.
execute if entity @e[type=minecraft:marker,tag=sf.camera_target,tag=sf.state.hunt] if score @s sf.case_hunt_photo matches 0 run function sf:tool/camera/hunt_shard

tag @s remove sf.photo_first
execute if score @s sf.case_photo matches 0 run tag @s add sf.photo_first

execute if entity @s[tag=sf.photo_first] run function sf:tool/camera/capture_ghost_first
execute unless entity @s[tag=sf.photo_first] run function sf:tool/camera/capture_ghost_repeat

tag @s remove sf.photo_first
tag @e[type=minecraft:marker,tag=sf.camera_target] remove sf.camera_target