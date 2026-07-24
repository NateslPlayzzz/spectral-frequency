# reward/lore_drop.mcfunction
# Compatibility dispatcher for callers expecting one progression-appropriate
# recovered record.

execute if score @s sf.shard_count matches ..2 run return run function sf:reward/lore_shallow
execute if score @s sf.shard_count matches 3..5 run return run function sf:reward/lore_mid

function sf:reward/lore_deep