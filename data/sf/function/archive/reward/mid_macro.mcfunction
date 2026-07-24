# archive/reward/mid_macro.mcfunction
# Macro context: {uuid:[I;...]}
#
# Restricted classification:
# - Document 2: Thorne erasure authorization
# - Document 3: Vance personal log
#
# Randomizes the first choice, then falls back to the other undiscovered file.

$execute if score #doc_roll sf.data matches 1 unless data storage sf:player_data entries[{uuid:$(uuid)}].documents[{id:2}] run data modify storage sf:temp archive.id set value 2
$execute if score #doc_roll sf.data matches 1 unless data storage sf:player_data entries[{uuid:$(uuid)}].documents[{id:2}] run return run function sf:archive/reward/grant

$execute if score #doc_roll sf.data matches 1 unless data storage sf:player_data entries[{uuid:$(uuid)}].documents[{id:3}] run data modify storage sf:temp archive.id set value 3
$execute if score #doc_roll sf.data matches 1 unless data storage sf:player_data entries[{uuid:$(uuid)}].documents[{id:3}] run return run function sf:archive/reward/grant

$execute if score #doc_roll sf.data matches 2 unless data storage sf:player_data entries[{uuid:$(uuid)}].documents[{id:3}] run data modify storage sf:temp archive.id set value 3
$execute if score #doc_roll sf.data matches 2 unless data storage sf:player_data entries[{uuid:$(uuid)}].documents[{id:3}] run return run function sf:archive/reward/grant

$execute if score #doc_roll sf.data matches 2 unless data storage sf:player_data entries[{uuid:$(uuid)}].documents[{id:2}] run data modify storage sf:temp archive.id set value 2
$execute if score #doc_roll sf.data matches 2 unless data storage sf:player_data entries[{uuid:$(uuid)}].documents[{id:2}] run return run function sf:archive/reward/grant

function sf:archive/reward/no_new