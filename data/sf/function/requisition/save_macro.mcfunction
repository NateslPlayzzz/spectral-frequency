# requisition/save_macro.mcfunction
# Macro context:
# {
#   uuid:[I;...],
#   used:<int>
# }

$data modify storage sf:player_data entries[{uuid:$(uuid)}].requisition.claims_used set value $(used)