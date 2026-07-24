# reconstruct/award.mcfunction
# Macro context: {uuid,shard}
# Called only after grant_resolved proves this fragment is not already stored.

$data modify storage sf:player_data entries[{uuid:$(uuid)}].shards append value {value:"$(shard)"}