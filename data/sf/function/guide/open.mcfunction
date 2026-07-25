# guide/open.mcfunction
# Investigator's Guidebook home.

scoreboard players set @s sf.tool_cd 6

tellraw @s ""
tellraw @s [{"text":"═══ ","color":"dark_gray"},{"text":"INVESTIGATOR'S GUIDEBOOK","color":"#D8C8A0","bold":true},{"text":" ═══","color":"dark_gray"}]

tellraw @s [{"text":"  ▶ ","color":"#7A5CFF"},{"text":"Current Case Journal","color":"white","bold":true,"underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.journal set 1"},"hover_event":{"action":"show_text","value":{"text":"Review evidence and file your manifestation classification."}}}]

tellraw @s [{"text":"  ▶ ","color":"#D8C8A0"},{"text":"How to Investigate","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 1"},"hover_event":{"action":"show_text","value":{"text":"The basics: evidence, classify, contain."}}}]

tellraw @s [{"text":"  ▶ ","color":"#D8C8A0"},{"text":"Memory & The Hollow","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 2"},"hover_event":{"action":"show_text","value":{"text":"What Memory is and how to preserve it."}}}]

tellraw @s [{"text":"  ▶ ","color":"#D8C8A0"},{"text":"Evidence Types","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 3"},"hover_event":{"action":"show_text","value":{"text":"The six signs and the tools that detect them."}}}]

tellraw @s [{"text":"  ▶ ","color":"#D8C8A0"},{"text":"Fragment Identification Chart","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 4"},"hover_event":{"action":"show_text","value":{"text":"The twelve registered manifestations and their evidence."}}}]

tellraw @s [{"text":"  ▶ ","color":"#D8C8A0"},{"text":"Surviving Hunts","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 5"},"hover_event":{"action":"show_text","value":{"text":"Detection, wards, being Taken, and revival."}}}]

tellraw @s [{"text":"  ▶ ","color":"#D8C8A0"},{"text":"Reconstruction","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 6"},"hover_event":{"action":"show_text","value":{"text":"Review the distinct fragments you have remembered."}}}]

tellraw @s [{"text":"  ▶ ","color":"#C89BFF"},{"text":"Recovered Documents","color":"#D8C8A0","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 8"},"hover_event":{"action":"show_text","value":{"text":"Open your permanent recovered-record archive."}}}]

tellraw @s [{"text":"  ▶ ","color":"#5AC8C8"},{"text":"UMBRA Equipment Requisition","color":"#D8C8A0","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.signal set 5"},"hover_event":{"action":"show_text","value":{"text":"Recover missing essential field equipment."}}}]

tellraw @s [{"text":"═════════════════════════════","color":"dark_gray"}]