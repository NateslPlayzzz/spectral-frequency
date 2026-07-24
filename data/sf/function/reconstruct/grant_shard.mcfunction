# reconstruct/grant_shard.mcfunction
# Runs as the successful Investigator.
# Converts the active sf:case ghost id into one persistent emotional fragment.

function sf:player/data/ensure
tag @s remove sf.fragment_new

# Build the macro argument object.
data modify storage sf:temp grant.uuid set from entity @s UUID
data modify storage sf:temp grant.id set from storage sf:case id
data remove storage sf:temp grant.shard

# Resolve ghost id -> emotional fragment id.
function sf:reconstruct/resolve_shard with storage sf:temp grant

# Refuse to mutate persistent data if the active case id was invalid.
execute unless data storage sf:temp grant.shard run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"!","color":"red"},{"text":"] Reconstruction could not identify the contained fragment.","color":"red"}]
execute unless data storage sf:temp grant.shard run return 0

# Award only if this UUID does not already hold this exact fragment.
function sf:reconstruct/grant_resolved with storage sf:temp grant