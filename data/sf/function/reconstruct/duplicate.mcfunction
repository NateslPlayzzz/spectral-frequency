# reconstruct/duplicate.mcfunction
# Runs as the successful Investigator.
# A repeat containment does not change the persistent unique-fragment set.

function sf:player/data/load_shardcount

# Repair missed milestones if an older build already stored enough fragments.
execute if score @s sf.quest matches 100 if score @s sf.oq_totem matches 0 if score @s sf.shard_count matches 3.. run function sf:quest/opt/totem_done
execute if score @s sf.shard_count >= #shard_total sf.data unless entity @s[tag=spectral.reconstructed] run function sf:reconstruct/complete

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"◇","color":"#C89BFF"},{"text":"] ","color":"dark_gray"},{"text":"This fragment is already present in your Reconstruction record. ","color":"gray"},{"score":{"name":"@s","objective":"sf.shard_count"},"color":"#C89BFF"},{"text":"/","color":"dark_gray"},{"score":{"name":"#shard_total","objective":"sf.data"},"color":"#C89BFF"},{"text":" unique fragments remembered.","color":"gray"}]