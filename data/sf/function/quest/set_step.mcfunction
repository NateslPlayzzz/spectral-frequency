# quest/set_step.mcfunction — as @s. #new_step holds the target step.
data modify storage sf:temp quuid set from entity @s UUID
execute store result storage sf:temp qstep int 1 run scoreboard players get #new_step sf.data
function sf:quest/set_step_macro with storage sf:temp
scoreboard players operation @s sf.quest = #new_step sf.data