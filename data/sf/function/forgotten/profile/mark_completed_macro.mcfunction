# forgotten/profile/mark_completed_macro.mcfunction
# Macro context: {uuid:[I;...]}

$data modify storage sf:player_data entries[{uuid:$(uuid)}].finale.state set value "completed"
$data modify storage sf:player_data entries[{uuid:$(uuid)}].finale.document set value true