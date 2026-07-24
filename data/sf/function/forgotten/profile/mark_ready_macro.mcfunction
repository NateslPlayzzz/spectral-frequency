# forgotten/profile/mark_ready_macro.mcfunction
# Macro context: {uuid:[I;...]}

$execute if data storage sf:player_data entries[{uuid:$(uuid),finale:{ending:"none"}}] run data modify storage sf:player_data entries[{uuid:$(uuid)}].finale.state set value "ready"