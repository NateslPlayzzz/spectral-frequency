# reward/score.mcfunction
# Calculates one enrolled participant's personal case performance.

# Every participant receives base credit for completing the investigation.
scoreboard players set @s sf.case_score 1

# Photographing the manifestation: +2.
execute if score @s sf.case_photo matches 1 run scoreboard players add @s sf.case_score 2

# Surviving a Hunt inside the active field: +2.
execute if score @s sf.case_survived_hunt matches 1 run scoreboard players add @s sf.case_score 2

# Operating at Thinning Memory or worse during the case: +3.
execute if score @s sf.case_lowmem matches 1 run scoreboard players add @s sf.case_score 3

# Aggressive manifestation: +1 for every participant exposed to the harder
# case tier.
execute if score @s sf.was_aggressive matches 1 run scoreboard players add @s sf.case_score 1

# Dispatch one personal reward tier.
execute if score @s sf.case_score matches ..2 run function sf:reward/tier_standard
execute if score @s sf.case_score matches 3..5 run function sf:reward/tier_good
execute if score @s sf.case_score matches 6.. run function sf:reward/tier_exceptional