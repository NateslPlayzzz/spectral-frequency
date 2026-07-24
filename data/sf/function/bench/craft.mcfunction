# bench/craft.mcfunction
# Begins an atomic barrel-only ingredient transaction.
#
# The player's inventory is never used as temporary storage and cannot be
# charged accidentally.

data modify storage sf:bench consume.items set value []
data modify storage sf:bench consume.output set value []

execute if data block ~ ~ ~ Items run data modify storage sf:bench consume.items set from block ~ ~ ~ Items

function sf:bench/consume_step