# tool/contain/channel.mcfunction
# Runs as the containing player every 2 ticks.

# ------------------------------------------------------------
# BREAK CONDITIONS
# ------------------------------------------------------------

# The Containment Focus must remain in the main hand.
execute unless items entity @s weapon.mainhand *[custom_data~{sf:{item:"contain"}}] run return run function sf:tool/contain/break

# At least one manifestation must remain within containment range.
execute unless entity @e[type=marker,tag=sf.ghost,distance=..6] run return run function sf:tool/contain/break

# A player already at zero Memory cannot continue the channel.
execute if score @s sf.coherence matches ..0 run return run function sf:tool/contain/break

# ------------------------------------------------------------
# PROGRESS
# ------------------------------------------------------------

scoreboard players add @s sf.contain_progress 1

# Calculate containment percentage:
# contain_progress * 100 / contain_need
scoreboard players operation #cp sf.data = @s sf.contain_progress
scoreboard players operation #cp_pct sf.data = #cp sf.data
scoreboard players operation #cp_pct sf.data *= #hundred sf.data
scoreboard players operation #cp_pct sf.data /= #contain_need sf.data

# ------------------------------------------------------------
# TUTORIAL RESISTANCE
# ------------------------------------------------------------

# Quest step 4 is the scripted tutorial containment.
# Drain only seven Memory over the complete 80-cycle channel.
execute if score @s sf.quest matches 4 if score @s sf.contain_progress matches 10 run function sf:tool/contain/resist_tutorial
execute if score @s sf.quest matches 4 if score @s sf.contain_progress matches 20 run function sf:tool/contain/resist_tutorial
execute if score @s sf.quest matches 4 if score @s sf.contain_progress matches 30 run function sf:tool/contain/resist_tutorial
execute if score @s sf.quest matches 4 if score @s sf.contain_progress matches 40 run function sf:tool/contain/resist_tutorial
execute if score @s sf.quest matches 4 if score @s sf.contain_progress matches 50 run function sf:tool/contain/resist_tutorial
execute if score @s sf.quest matches 4 if score @s sf.contain_progress matches 60 run function sf:tool/contain/resist_tutorial
execute if score @s sf.quest matches 4 if score @s sf.contain_progress matches 70 run function sf:tool/contain/resist_tutorial

# ------------------------------------------------------------
# ORDINARY CASE RESISTANCE
# ------------------------------------------------------------

# Tutorial containment deliberately skips the normal resistance curve.
#
# Early: 0–59%
# No direct Memory drain.
#
# Mid: 60–84%
# One Memory per channel cycle.
#
# Late: 85–100%
# Two Memory per channel cycle, with possible lash damage.

execute unless score @s sf.quest matches 4 if score #cp_pct sf.data matches 60..84 run function sf:tool/contain/resist_mid
execute unless score @s sf.quest matches 4 if score #cp_pct sf.data matches 85.. run function sf:tool/contain/resist_hard

# Aggressive resistance is disabled during tutorial containment.
# It remains active in ordinary cases until the broader containment
# balance pass replaces its currently impossible cost.
execute unless score @s sf.quest matches 4 if entity @e[type=marker,tag=sf.ghost,tag=sf.tier.aggressive,distance=..6] if score #cp sf.data matches 1.. run function sf:tool/contain/resist_aggressive

# ------------------------------------------------------------
# CHANNEL FEEDBACK
# ------------------------------------------------------------

execute at @s anchored eyes positioned ^ ^ ^2 run particle minecraft:soul_fire_flame ~ ~ ~ 0.3 0.3 0.3 0.0 4
playsound minecraft:block.conduit.ambient.short player @s ~ ~ ~ 0.4 1.4

# ------------------------------------------------------------
# RESOLUTION
# ------------------------------------------------------------

execute if score @s sf.contain_progress >= #contain_need sf.data run function sf:tool/contain/success
execute unless score @s sf.contain_progress >= #contain_need sf.data run function sf:tool/contain/progress_hud