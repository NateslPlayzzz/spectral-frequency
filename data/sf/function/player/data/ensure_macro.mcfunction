# player/data/ensure_macro.mcfunction
# Macro context:
# {
#   uuid:[I;...]
# }

$execute unless data storage sf:player_data entries[{uuid:$(uuid)}] run tag @s add sf.new_record

$execute unless data storage sf:player_data entries[{uuid:$(uuid)}] run data modify storage sf:player_data entries append value {uuid:$(uuid),profile_schema:100,shards:[],quest:0,unlocked:[],requisition:{claims_used:0}}

$execute unless data storage sf:player_data entries[{uuid:$(uuid)}].profile_schema run data modify storage sf:player_data entries[{uuid:$(uuid)}].profile_schema set value 100

$execute unless data storage sf:player_data entries[{uuid:$(uuid)}].shards run data modify storage sf:player_data entries[{uuid:$(uuid)}].shards set value []

$execute unless data storage sf:player_data entries[{uuid:$(uuid)}].quest run data modify storage sf:player_data entries[{uuid:$(uuid)}].quest set value 0

$execute unless data storage sf:player_data entries[{uuid:$(uuid)}].unlocked run data modify storage sf:player_data entries[{uuid:$(uuid)}].unlocked set value []

$execute unless data storage sf:player_data entries[{uuid:$(uuid)}].requisition run data modify storage sf:player_data entries[{uuid:$(uuid)}].requisition set value {claims_used:0}

$execute unless data storage sf:player_data entries[{uuid:$(uuid)}].requisition.claims_used run data modify storage sf:player_data entries[{uuid:$(uuid)}].requisition.claims_used set value 0