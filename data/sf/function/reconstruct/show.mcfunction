# reconstruct/show.mcfunction
# Runs as the requesting player.

function sf:player/data/load_shardcount

tellraw @s [{"text":"── ","color":"dark_gray"},{"text":"RECONSTRUCTION","color":"#C89BFF","bold":true},{"text":" ──","color":"dark_gray"}]
tellraw @s [{"text":"  Unique fragments remembered: ","color":"gray"},{"score":{"name":"@s","objective":"sf.shard_count"},"color":"#C89BFF","bold":true},{"text":" / ","color":"dark_gray"},{"score":{"name":"#shard_total","objective":"sf.data"},"color":"#C89BFF"}]

execute if score @s sf.shard_count matches ..2 run tellraw @s [{"text":"  The recovered patterns remain isolated.","color":"#6A6A78","italic":true}]
execute if score @s sf.shard_count matches 3..11 run tellraw @s [{"text":"  Separate patterns are beginning to align.","color":"#D8C8A0","italic":true}]
execute if entity @s[tag=spectral.reconstructed] run tellraw @s [{"text":"  The pattern is complete. Something is listening.","color":"#C89BFF","italic":true}]