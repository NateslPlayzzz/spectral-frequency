# reward/score.mcfunction — tally performance into sf.case_score
scoreboard players set @s sf.case_score 1
# Clean contain (you're alive and bound it) — base +1 already set
# Photographed the ghost: +2 (you took the risk)
execute if score @s sf.case_photo matches 1 run scoreboard players add @s sf.case_score 2
# Survived a hunt during the case: +2 (composure)
execute if score @s sf.case_survived_hunt matches 1 run scoreboard players add @s sf.case_score 2
# Bound it while half-forgotten: +3 (nerve — the SF-signature bonus)
execute if score @s sf.case_lowmem matches 1 run scoreboard players add @s sf.case_score 3
# Aggressive ghost: +1 (harder quarry) — reuse the was_aggressive capture
execute if score @s sf.was_aggressive matches 1 run scoreboard players add @s sf.case_score 1
# Map score -> tier and dispatch rewards
execute if score @s sf.case_score matches ..2 run function sf:reward/tier_standard
execute if score @s sf.case_score matches 3..5 run function sf:reward/tier_good
execute if score @s sf.case_score matches 6.. run function sf:reward/tier_exceptional