# reconstruct/progress_msg.mcfunction
# Shown only for a newly stored fragment.

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"◇","color":"#C89BFF"},{"text":"] ","color":"dark_gray"},{"text":"A new fragment settles into the Reconstruction record. ","color":"gray"},{"score":{"name":"@s","objective":"sf.shard_count"},"color":"#C89BFF"},{"text":"/","color":"dark_gray"},{"score":{"name":"#shard_total","objective":"sf.data"},"color":"#C89BFF"},{"text":" unique fragments remembered.","color":"gray"}]