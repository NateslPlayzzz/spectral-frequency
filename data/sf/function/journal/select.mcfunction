# journal/select.mcfunction
# Converts Journal trigger values 11–22 into case-local fragment identities 1–12.

execute unless data storage sf:case {state:"active"} run return run function sf:journal/no_case
execute unless entity @s[tag=sf.case_participant] run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"CASE JOURNAL","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"You are not enrolled in the active investigation.","color":"#FFC36B"}]
execute unless score @s sf.case_gen = #case_serial sf.data run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"CASE JOURNAL","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"This case record belongs to another investigation.","color":"#FFC36B"}]

function sf:journal/count_evidence

execute unless score #evidence_count sf.data matches 3.. run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"CASE JOURNAL","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Classification rejected: the case record contains fewer than three confirmed evidence types.","color":"#FFC36B"}]
execute unless score @s sf.journal matches 11..22 run return 0
execute if score @s sf.journal matches 17..22 unless score @s sf.log_echo matches 1.. run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"CASE JOURNAL","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Veil Registry classification rejected: no Veil Echo is confirmed in this investigation.","color":"#FFC36B"}]

scoreboard players operation @s sf.case_id = @s sf.journal
scoreboard players remove @s sf.case_id 10

playsound minecraft:block.amethyst_block.resonate player @s ~ ~ ~ 0.65 1.25
playsound minecraft:item.book.page_turn player @s ~ ~ ~ 0.45 0.9

function sf:journal/show

execute if score @s sf.quest matches 3 unless score @s sf.case_id matches 1 run data modify storage sf:temp vline set value "That classification does not match the complete evidence fingerprint. Read all three evidence types together and try again."
execute if score @s sf.quest matches 3 unless score @s sf.case_id matches 1 run function sf:quest/vance