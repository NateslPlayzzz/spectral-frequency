# requisition/load_macro.mcfunction
# Macro context:
# {
#   uuid:[I;...]
# }

$execute unless data storage sf:player_data entries[{uuid:$(uuid)}].requisition run data modify storage sf:player_data entries[{uuid:$(uuid)}].requisition set value {claims_used:0}

$execute unless data storage sf:player_data entries[{uuid:$(uuid)}].requisition.claims_used run data modify storage sf:player_data entries[{uuid:$(uuid)}].requisition.claims_used set value 0

$execute store result score @s sf.req_used run data get storage sf:player_data entries[{uuid:$(uuid)}].requisition.claims_used 1