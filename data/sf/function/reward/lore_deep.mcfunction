# reward/lore_deep.mcfunction
# Black-archive records do not become recoverable before six fragments.

execute unless score @s sf.shard_count matches 6.. run return 0

function sf:player/data/ensure

data modify storage sf:temp archive.uuid set from entity @s UUID
execute store result score #doc_roll sf.data run random value 1..10

function sf:archive/reward/deep_macro with storage sf:temp archive