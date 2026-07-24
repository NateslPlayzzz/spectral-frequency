# quest/load_step.mcfunction — as @s
scoreboard players set @s sf.quest 0
data modify storage sf:temp quuid set from entity @s UUID
function sf:quest/load_step_macro with storage sf:temp