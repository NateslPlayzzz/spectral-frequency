# archive/reward/shallow_macro.mcfunction
# Macro context: {uuid:[I;...]}
#
# Shallow classification:
# - Document 1: Thorne, Day 41
# - Document 4: Holloway security log
#
# Randomizes the first choice, then falls back to the other undiscovered file.

$execute if score #doc_roll sf.data matches 1 unless data storage sf:player_data entries[{uuid:$(uuid)}].documents[{id:1}] run data modify storage sf:temp archive.id set value 1
$execute if score #doc_roll sf.data matches 1 unless data storage sf:player_data entries[{uuid:$(uuid)}].documents[{id:1}] run return run function sf:archive/reward/grant

$execute if score #doc_roll sf.data matches 1 unless data storage sf:player_data entries[{uuid:$(uuid)}].documents[{id:4}] run data modify storage sf:temp archive.id set value 4
$execute if score #doc_roll sf.data matches 1 unless data storage sf:player_data entries[{uuid:$(uuid)}].documents[{id:4}] run return run function sf:archive/reward/grant

$execute if score #doc_roll sf.data matches 2 unless data storage sf:player_data entries[{uuid:$(uuid)}].documents[{id:4}] run data modify storage sf:temp archive.id set value 4
$execute if score #doc_roll sf.data matches 2 unless data storage sf:player_data entries[{uuid:$(uuid)}].documents[{id:4}] run return run function sf:archive/reward/grant

$execute if score #doc_roll sf.data matches 2 unless data storage sf:player_data entries[{uuid:$(uuid)}].documents[{id:1}] run data modify storage sf:temp archive.id set value 1
$execute if score #doc_roll sf.data matches 2 unless data storage sf:player_data entries[{uuid:$(uuid)}].documents[{id:1}] run return run function sf:archive/reward/grant

function sf:archive/reward/no_new