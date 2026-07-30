# guide/open.mcfunction
# Investigator's Guidebook home.

scoreboard players set @s sf.tool_cd 6

tellraw @s ""
tellraw @s [{"text":"═══ ","color":"dark_gray"},{"text":"INVESTIGATOR'S GUIDEBOOK","color":"#D8C8A0","bold":true},{"text":" ═══","color":"dark_gray"}]
tellraw @s [{"text":"  ▶ ","color":"#7A5CFF"},{"text":"Current Case Journal","color":"white","bold":true,"underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.journal set 1"},"hover_event":{"action":"show_text","value":{"text":"Review confirmed evidence and file your fragment classification."}}}]
tellraw @s [{"text":"  ▶ ","color":"#D8C8A0"},{"text":"Investigation Procedure","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 1"},"hover_event":{"action":"show_text","value":{"text":"Locate, confirm evidence, classify, and contain."}}}]
tellraw @s [{"text":"  ▶ ","color":"#D8C8A0"},{"text":"Memory States","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 2"},"hover_event":{"action":"show_text","value":{"text":"The Memory meter and its five states."}}}]
tellraw @s [{"text":"  ▶ ","color":"#D8C8A0"},{"text":"Evidence Reference","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 3"},"hover_event":{"action":"show_text","value":{"text":"The six formal evidence categories and their tools."}}}]
tellraw @s [{"text":"  ▶ ","color":"#D8C8A0"},{"text":"Fragment Registry","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 4"},"hover_event":{"action":"show_text","value":{"text":"Remembered fragments, evidence fingerprints, and observed behavior."}}}]
tellraw @s [{"text":"  ▶ ","color":"#D8C8A0"},{"text":"Hunt Survival","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 5"},"hover_event":{"action":"show_text","value":{"text":"Detection, defensive equipment, Taken states, and Remnant revival."}}}]
tellraw @s [{"text":"  ▶ ","color":"#D8C8A0"},{"text":"Reconstruction","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 6"},"hover_event":{"action":"show_text","value":{"text":"Review the distinct fragments you have remembered."}}}]
tellraw @s [{"text":"  ▶ ","color":"#C89BFF"},{"text":"Recovered Documents","color":"#D8C8A0","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 8"},"hover_event":{"action":"show_text","value":{"text":"Open your permanent recovered-record archive."}}}]
tellraw @s [{"text":"  FIELD LOGISTICS  ","color":"#6A6A78","bold":true},{"text":"Equipment Requisition and emergency recovery are accessed through the Field Radio.","color":"#8A8A98","italic":true}]
tellraw @s [{"text":"═════════════════════════════","color":"dark_gray"}]