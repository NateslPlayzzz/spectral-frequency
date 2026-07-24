# archive/reward/grant_macro.mcfunction
# Macro context:
# {
#   uuid:[I;...],
#   id:<document number>
# }

# Never add or issue a duplicate recovered record.
$execute if data storage sf:player_data entries[{uuid:$(uuid)}].documents[{id:$(id)}] run return run function sf:archive/reward/no_new

# Record discovery before issuing the physical copy.
$data modify storage sf:player_data entries[{uuid:$(uuid)}].documents append value {id:$(id)}

$loot give @s loot sf:reward/lore/doc_$(id)

function sf:reward/lore_announce