# tool/camera/capture_ghost.mcfunction — as @s at @s. Captured the anomaly itself.
scoreboard players operation @s sf.coherence += #photo_reward sf.data
execute if score @s sf.coherence matches 101.. run scoreboard players set @s sf.coherence 100
scoreboard players add @s sf.photo_count 1
title @s times 5 40 15
title @s subtitle {"text":"\u2014 you caught it on film \u2014","color":"#E0E0E0","italic":true}
title @s title {"text":" "}
function sf:sfx/photo
# Photographing a ghost mid-hunt crystallizes a shard — dangerous, rewarding
execute if entity @e[type=marker,tag=sf.ghost,tag=sf.state.hunt,distance=..12] at @s run loot spawn ~ ~1 ~ loot sf:material/veil_shard
tellraw @s [{"text":"[","color":"dark_gray"},{"text":"\u25c8","color":"#E0E0E0"},{"text":"] ","color":"dark_gray"},{"text":"A photograph holds. The forgetting loosens its grip \u2014 +","color":"gray"},{"score":{"name":"#photo_reward","objective":"sf.data"},"color":"#E0E0E0"},{"text":" memory.","color":"gray"}]
scoreboard players set @s sf.case_photo 1