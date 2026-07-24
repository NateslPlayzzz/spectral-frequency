# journal/show.mcfunction
# Displays only the requesting participant's current case record.

execute unless data storage sf:case {state:"active"} run return run function sf:journal/no_case

execute unless entity @s[tag=sf.case_participant] run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"JOURNAL","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"You are not enrolled in the active investigation.","color":"#FFC36B"}]

scoreboard players set #evidence_count sf.data 0

execute if score @s sf.log_emf matches 1.. run scoreboard players add #evidence_count sf.data 1
execute if score @s sf.log_thermo matches 1.. run scoreboard players add #evidence_count sf.data 1
execute if score @s sf.log_box matches 1.. run scoreboard players add #evidence_count sf.data 1
execute if score @s sf.log_writing matches 1.. run scoreboard players add #evidence_count sf.data 1
execute if score @s sf.log_uv matches 1.. run scoreboard players add #evidence_count sf.data 1
execute if score @s sf.log_echo matches 1.. run scoreboard players add #evidence_count sf.data 1

tellraw @s ""
tellraw @s [{"text":"── ","color":"dark_gray"},{"text":"CASE JOURNAL","color":"#7A5CFF","bold":true},{"text":" ──","color":"dark_gray"}]

tellraw @s [{"text":"  STATUS  ","color":"#6A6A78","bold":true},{"text":"ACTIVE","color":"#9BFFB0","bold":true},{"text":"  ·  ","color":"dark_gray"},{"score":{"name":"#evidence_count","objective":"sf.data"},"color":"white","bold":true},{"text":"/6 signs recorded","color":"gray"}]

execute if score @s sf.log_emf matches 1.. run tellraw @s [{"text":"  ✔ ","color":"#9BFFB0"},{"text":"EMF Level 5","color":"white"}]
execute unless score @s sf.log_emf matches 1.. run tellraw @s [{"text":"  · ","color":"dark_gray"},{"text":"EMF Level 5","color":"dark_gray"}]

execute if score @s sf.log_thermo matches 1.. run tellraw @s [{"text":"  ✔ ","color":"#9BFFB0"},{"text":"Freezing Temperatures","color":"white"}]
execute unless score @s sf.log_thermo matches 1.. run tellraw @s [{"text":"  · ","color":"dark_gray"},{"text":"Freezing Temperatures","color":"dark_gray"}]

execute if score @s sf.log_box matches 1.. run tellraw @s [{"text":"  ✔ ","color":"#9BFFB0"},{"text":"Spirit Box Response","color":"white"}]
execute unless score @s sf.log_box matches 1.. run tellraw @s [{"text":"  · ","color":"dark_gray"},{"text":"Spirit Box Response","color":"dark_gray"}]

execute if score @s sf.log_writing matches 1.. run tellraw @s [{"text":"  ✔ ","color":"#9BFFB0"},{"text":"Ghost Writing","color":"white"}]
execute unless score @s sf.log_writing matches 1.. run tellraw @s [{"text":"  · ","color":"dark_gray"},{"text":"Ghost Writing","color":"dark_gray"}]

execute if score @s sf.log_uv matches 1.. run tellraw @s [{"text":"  ✔ ","color":"#9BFFB0"},{"text":"UV Trace","color":"white"}]
execute unless score @s sf.log_uv matches 1.. run tellraw @s [{"text":"  · ","color":"dark_gray"},{"text":"UV Trace","color":"dark_gray"}]

execute if score @s sf.log_echo matches 1.. run tellraw @s [{"text":"  ✔ ","color":"#9BFFB0"},{"text":"Veil Echo","color":"white"}]
execute unless score @s sf.log_echo matches 1.. run tellraw @s [{"text":"  · ","color":"dark_gray"},{"text":"Veil Echo","color":"dark_gray"}]

execute if score #evidence_count sf.data matches ..2 run tellraw @s [{"text":"\n  Continue gathering signs before attempting identification.","color":"#8A8A98","italic":true}]
execute if score #evidence_count sf.data matches 3.. run tellraw @s [{"text":"\n  The manifestation's fingerprint can now be identified.","color":"#D8C8A0","italic":true}]

# Tutorial fingerprint check.
execute if score @s sf.quest matches 3 run function sf:quest/check_step3

function sf:quest/check_all_evidence

playsound minecraft:item.book.page_turn player @s ~ ~ ~ 0.45 0.9