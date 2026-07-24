# forgotten/profile/complete_macro.mcfunction
# Macro context: {uuid:[I;...]}

$data modify storage sf:player_data entries[{uuid:$(uuid)}].finale.state set value "epilogue"
$data modify storage sf:player_data entries[{uuid:$(uuid)}].finale.ending set from storage sf:temp finale.ending
$data modify storage sf:player_data entries[{uuid:$(uuid)}].finale.document set value true