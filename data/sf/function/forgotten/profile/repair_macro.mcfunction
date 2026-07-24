# forgotten/profile/repair_macro.mcfunction
# Macro context: {witness:[I;...]}

# An unresolved finale returns to deliberate activation.
$execute if data storage sf:player_data entries[{uuid:$(witness),finale:{ending:"none"}}] run data modify storage sf:player_data entries[{uuid:$(witness)}].finale.state set value "ready"

# A recorded branch must never be erased by repair.
$execute if data storage sf:player_data entries[{uuid:$(witness),finale:{ending:"protocol"}}] run data modify storage sf:player_data entries[{uuid:$(witness)}].finale.state set value "completed"
$execute if data storage sf:player_data entries[{uuid:$(witness),finale:{ending:"protocol"}}] run data modify storage sf:player_data entries[{uuid:$(witness)}].finale.document set value true

$execute if data storage sf:player_data entries[{uuid:$(witness),finale:{ending:"vigil"}}] run data modify storage sf:player_data entries[{uuid:$(witness)}].finale.state set value "completed"
$execute if data storage sf:player_data entries[{uuid:$(witness),finale:{ending:"vigil"}}] run data modify storage sf:player_data entries[{uuid:$(witness)}].finale.document set value true