# journal/show.mcfunction
# Displays the requesting Investigator's current-generation case record.

execute unless data storage sf:case {state:"active"} run return run function sf:journal/no_case
execute unless entity @s[tag=sf.case_participant] run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"CASE JOURNAL","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"You are not enrolled in the active investigation.","color":"#FFC36B"}]
execute unless score @s sf.case_gen = #case_serial sf.data run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"CASE JOURNAL","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"This case record belongs to another investigation.","color":"#FFC36B"}]

function sf:journal/count_evidence

tellraw @s ""
tellraw @s [{"text":"── ","color":"dark_gray"},{"text":"CURRENT CASE JOURNAL","color":"#7A5CFF","bold":true},{"text":" ──","color":"dark_gray"}]
tellraw @s [{"text":"  STATUS  ","color":"#6A6A78","bold":true},{"text":"ACTIVE","color":"#9BFFB0","bold":true},{"text":"  ·  EVIDENCE  ","color":"dark_gray"},{"score":{"name":"#evidence_count","objective":"sf.data"},"color":"white","bold":true},{"text":" / 3","color":"#D8C8A0","bold":true}]
execute if score @s sf.log_emf matches 1.. run tellraw @s [{"text":"  ✔ ","color":"#9BFFB0"},{"text":"EMF Level 5","color":"white"}]
execute unless score @s sf.log_emf matches 1.. run tellraw @s [{"text":"  · ","color":"dark_gray"},{"text":"EMF Level 5","color":"dark_gray"}]
execute if score @s sf.log_thermo matches 1.. run tellraw @s [{"text":"  ✔ ","color":"#9BFFB0"},{"text":"Freezing Temperatures","color":"white"}]
execute unless score @s sf.log_thermo matches 1.. run tellraw @s [{"text":"  · ","color":"dark_gray"},{"text":"Freezing Temperatures","color":"dark_gray"}]
execute if score @s sf.log_box matches 1.. run tellraw @s [{"text":"  ✔ ","color":"#9BFFB0"},{"text":"Spirit Box","color":"white"}]
execute unless score @s sf.log_box matches 1.. run tellraw @s [{"text":"  · ","color":"dark_gray"},{"text":"Spirit Box","color":"dark_gray"}]
execute if score @s sf.log_writing matches 1.. run tellraw @s [{"text":"  ✔ ","color":"#9BFFB0"},{"text":"Ghost Writing","color":"white"}]
execute unless score @s sf.log_writing matches 1.. run tellraw @s [{"text":"  · ","color":"dark_gray"},{"text":"Ghost Writing","color":"dark_gray"}]
execute if score @s sf.log_uv matches 1.. run tellraw @s [{"text":"  ✔ ","color":"#9BFFB0"},{"text":"UV Traces","color":"white"}]
execute unless score @s sf.log_uv matches 1.. run tellraw @s [{"text":"  · ","color":"dark_gray"},{"text":"UV Traces","color":"dark_gray"}]
execute if score @s sf.log_echo matches 1.. run tellraw @s [{"text":"  ✔ ","color":"#9BFFB0"},{"text":"Veil Echo","color":"white"}]
execute unless score @s sf.log_echo matches 1.. run tellraw @s [{"text":"  · ","color":"dark_gray"},{"text":"Veil Echo","color":"dark_gray"}]
tellraw @s ""
execute if score @s sf.case_id matches 0 run tellraw @s [{"text":"  CLASSIFICATION  ","color":"#6A6A78","bold":true},{"text":"UNFILED","color":"#FFC36B","italic":true}]
execute if score @s sf.case_id matches 1..12 run function sf:journal/show_selection
execute if score #evidence_count sf.data matches ..2 run tellraw @s [{"text":"  Confirm all three evidence types before filing a fragment classification.","color":"#8A8A98","italic":true}]
execute if score #evidence_count sf.data matches 3.. if score @s sf.case_id matches 0 run tellraw @s [{"text":"  ▶ ","color":"#7A5CFF"},{"text":"FILE FRAGMENT CLASSIFICATION","color":"#D8C8A0","bold":true,"underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.journal set 2"},"hover_event":{"action":"show_text","value":{"text":"Open the appropriate UMBRA Fragment Registry."}}}]
execute if score #evidence_count sf.data matches 3.. if score @s sf.case_id matches 1..12 run tellraw @s [{"text":"  ▶ ","color":"#7A5CFF"},{"text":"REVISE FRAGMENT CLASSIFICATION","color":"#D8C8A0","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.journal set 2"},"hover_event":{"action":"show_text","value":{"text":"Choose a different registered fragment."}}}]
execute if score #evidence_count sf.data matches 3.. run tellraw @s [{"text":"  The Containment Focus tests this filing against the active manifestation.","color":"#6A6A78","italic":true}]

execute if score @s sf.quest matches 3 run function sf:quest/check_step3
function sf:quest/check_all_evidence

playsound minecraft:item.book.page_turn player @s ~ ~ ~ 0.45 0.9