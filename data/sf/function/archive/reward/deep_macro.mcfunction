# archive/reward/deep_macro.mcfunction
# Macro context: {uuid:[I;...]}
#
# Black-archive classification:
# - Document 5 becomes available from six fragments.
# - Document 6 becomes available from ten fragments and retains a 1-in-10 roll.
#
# Once Document 5 is owned, failed Document 6 rolls award no duplicate.

$execute if score #doc_roll sf.data matches 1 if score @s sf.shard_count matches 10.. unless data storage sf:player_data entries[{uuid:$(uuid)}].documents[{id:6}] run data modify storage sf:temp archive.id set value 6
$execute if score #doc_roll sf.data matches 1 if score @s sf.shard_count matches 10.. unless data storage sf:player_data entries[{uuid:$(uuid)}].documents[{id:6}] run return run function sf:archive/reward/grant

$execute unless data storage sf:player_data entries[{uuid:$(uuid)}].documents[{id:5}] run data modify storage sf:temp archive.id set value 5
$execute unless data storage sf:player_data entries[{uuid:$(uuid)}].documents[{id:5}] run return run function sf:archive/reward/grant

function sf:archive/reward/no_new