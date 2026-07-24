# load_shardcount_macro — only overwrite the 0 if this player actually has a record
$execute if data storage sf:player_data entries[{uuid:$(uuid)}] run data modify storage sf:temp shards set from storage sf:player_data entries[{uuid:$(uuid)}].shards
$execute if data storage sf:player_data entries[{uuid:$(uuid)}] store result score @s sf.shard_count run data get storage sf:temp shards