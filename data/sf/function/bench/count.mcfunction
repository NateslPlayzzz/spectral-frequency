# bench/count.mcfunction
# Counts exact item quantities in the selected barrel.
#
# This copies the barrel's item list to temporary storage and drains that
# copy recursively. The barrel itself is not modified during counting.

scoreboard players set #have_iron sf.data 0
scoreboard players set #have_redstone sf.data 0
scoreboard players set #have_glass sf.data 0
scoreboard players set #have_amethyst sf.data 0
scoreboard players set #have_ecto sf.data 0
scoreboard players set #have_shard sf.data 0

data modify storage sf:bench scan set value []
execute if data block ~ ~ ~ Items run data modify storage sf:bench scan set from block ~ ~ ~ Items

function sf:bench/count_step