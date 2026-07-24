# archive/load_profile_macro.mcfunction
# Macro context:
# {
#   uuid:[I;...]
# }

$data modify storage sf:temp archive.profile set from storage sf:player_data entries[{uuid:$(uuid)}]