# journal/identify_menu.mcfunction
# Opens the appropriate registered-fragment classification dialog.

execute unless data storage sf:case {state:"active"} run return run function sf:journal/no_case
execute unless entity @s[tag=sf.case_participant] run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"CASE JOURNAL","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"You are not enrolled in the active investigation.","color":"#FFC36B"}]
execute unless score @s sf.case_gen = #case_serial sf.data run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"CASE JOURNAL","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"This case record belongs to another investigation.","color":"#FFC36B"}]

function sf:journal/count_evidence

execute unless score #evidence_count sf.data matches 3.. run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"CASE JOURNAL","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Confirm all three evidence types before filing a fragment classification.","color":"#FFC36B"}]

execute if score @s sf.log_echo matches 1.. run return run dialog show @s sf:case_identification_veil

dialog show @s sf:case_identification