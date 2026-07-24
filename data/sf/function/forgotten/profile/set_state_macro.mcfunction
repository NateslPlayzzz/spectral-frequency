# forgotten/profile/set_state_macro.mcfunction
# Macro context: {uuid:[I;...]}

$data modify storage sf:player_data entries[{uuid:$(uuid)}].finale.state set from storage sf:temp finale.state