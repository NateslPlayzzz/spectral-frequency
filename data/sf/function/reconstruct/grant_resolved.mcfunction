# reconstruct/grant_resolved.mcfunction
# Macro context: {uuid,id,shard}

# A repeated ghost type is still a successful case, but it does not increase
# Reconstruction and must not be presented as a newly remembered fragment.
$execute if data storage sf:player_data entries[{uuid:$(uuid)}].shards[{value:"$(shard)"}] run return run function sf:reconstruct/duplicate

# First discovery of this emotional fragment.
function sf:reconstruct/award with storage sf:temp grant
tag @s add sf.fragment_new

function sf:player/data/load_shardcount
function sf:reconstruct/check_complete