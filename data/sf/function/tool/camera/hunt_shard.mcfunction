# tool/camera/hunt_shard.mcfunction
# Awards at most one Hunt-photography Veil Shard per player per case.

scoreboard players set @s sf.case_hunt_photo 1

loot give @s loot sf:material/veil_shard

playsound minecraft:block.amethyst_cluster.break player @s ~ ~ ~ 0.65 1.45
particle minecraft:reverse_portal ~ ~1 ~ 0.25 0.35 0.25 0.02 12
particle minecraft:wax_on ~ ~1 ~ 0.2 0.3 0.2 0.01 8

tellraw @s [{"text": "[","color": "dark_gray"},{"text": "HUNT CAPTURE","color": "#C89BFF","bold": true},{"text": "] ","color": "dark_gray"},{"text": "One Veil Shard crystallized from the exposed image.","color": "gray"}]