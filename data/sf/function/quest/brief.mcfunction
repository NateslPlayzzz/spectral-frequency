# quest/brief.mcfunction
# Briefs the current quest step exactly once.

execute if score @s sf.quest matches 3 run function sf:quest/brief/step3
execute if score @s sf.quest matches 4 run function sf:quest/brief/step4
execute if score @s sf.quest matches 100 run function sf:quest/brief/done

# Mark the current step as briefed even when it has no dedicated briefing.
scoreboard players operation @s sf.q_briefed = @s sf.quest