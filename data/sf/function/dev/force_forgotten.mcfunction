# dev/force_forgotten.mcfunction — skip the 12-shard grind for testing
tag @s add spectral.reconstructed
scoreboard players set @s sf.shard_count 12
tag @s remove sf.forgotten_seen
function sf:forgotten/awaken