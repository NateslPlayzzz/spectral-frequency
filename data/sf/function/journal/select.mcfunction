# journal/select.mcfunction
# Converts journal trigger values 11–22 into case-local identities 1–12.

execute unless data storage sf:case {state:"active"} run return run function sf:journal/no_case

execute unless entity @s[tag=sf.case_participant] run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"JOURNAL","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"You are not enrolled in the active investigation.","color":"#FFC36B"}]

function sf:journal/count_evidence

execute unless score #evidence_count sf.data matches 3.. run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"JOURNAL","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Classification rejected: the field record contains fewer than three signs.","color":"#FFC36B"}]

execute unless score @s sf.journal matches 11..22 run return 0

# The expanded six cannot be filed without a confirmed Veil Echo.
# This also blocks players who manually invoke a hidden trigger value.
execute if score @s sf.journal matches 17..22 unless score @s sf.log_echo matches 1.. run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"JOURNAL","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Expanded classification rejected: no Veil Echo is recorded in this case.","color":"#FFC36B"}]

scoreboard players operation @s sf.case_id = @s sf.journal
scoreboard players remove @s sf.case_id 10

playsound minecraft:block.amethyst_block.resonate player @s ~ ~ ~ 0.65 1.25
playsound minecraft:item.book.page_turn player @s ~ ~ ~ 0.45 0.9

# Reopen the Journal, which also performs tutorial progression checks.
function sf:journal/show

# The tutorial teaches correction without charging a Memory penalty.
# A correct Banshee selection advances the quest during journal/show.
execute if score @s sf.quest matches 3 unless score @s sf.case_id matches 1 run data modify storage sf:temp vline set value "That filing doesn't match the fingerprint. Read the three signs together and try again."
execute if score @s sf.quest matches 3 unless score @s sf.case_id matches 1 run function sf:quest/vance