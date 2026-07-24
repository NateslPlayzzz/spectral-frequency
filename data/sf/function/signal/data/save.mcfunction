# signal/data/save.mcfunction
# Macro context:
# {
#   uuid:[I;...],
#   record:{...}
# }

$data modify storage sf:player_data entries[{uuid:$(uuid)}].signal set from storage sf:temp signal.record