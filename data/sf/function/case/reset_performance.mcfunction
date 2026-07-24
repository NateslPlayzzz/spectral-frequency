# case/reset_performance.mcfunction
# Clears temporary scoring and channel state when entering or leaving a case.

scoreboard players set @s sf.case_score 0
scoreboard players set @s sf.case_photo 0
scoreboard players set @s sf.case_lowmem 0
scoreboard players set @s sf.case_survived_hunt 0
scoreboard players set @s sf.was_aggressive 0
scoreboard players set @s sf.revive_progress 0

tag @s remove sf.reviving