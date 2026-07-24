# forgotten/menu_status_macro.mcfunction
# Macro context: {uuid:[I;...]}

$execute if data storage sf:player_data entries[{uuid:$(uuid),finale:{state:"ready",ending:"none"}}] run tellraw @s [{"text":"  ▶ ","color":"#8B0000"},{"text":"Answer the pull","color":"#C89BFF","bold":true,"underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 9"},"hover_event":{"action":"show_text","value":{"text":"Begin the classified Reconstruction finale.","color":"#8B0000"}}}]

$execute if data storage sf:player_data entries[{uuid:$(uuid),finale:{ending:"protocol"}}] run tellraw @s [{"text":"  Finale record: ","color":"gray"},{"text":"PROTOCOL","color":"#5AC8C8","bold":true}]

$execute if data storage sf:player_data entries[{uuid:$(uuid),finale:{ending:"vigil"}}] run tellraw @s [{"text":"  Finale record: ","color":"gray"},{"text":"VIGIL","color":"#C89BFF","bold":true}]

$execute unless data storage sf:player_data entries[{uuid:$(uuid),finale:{state:"ready",ending:"none"}}] if data storage sf:player_data entries[{uuid:$(uuid),finale:{ending:"none"}}] run tellraw @s [{"text":"  The pull is already in motion, paused, or awaiting recovery.","color":"#8B0000","italic":true}]