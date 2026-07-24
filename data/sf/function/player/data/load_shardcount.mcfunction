# player/data/load_shardcount.mcfunction — as @s. Defaults to 0 if no record exists.
scoreboard players set @s sf.shard_count 0
data modify storage sf:temp uuid set from entity @s UUID
function sf:player/data/load_shardcount_macro with storage sf:temp