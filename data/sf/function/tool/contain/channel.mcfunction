# tool/contain/channel.mcfunction
# Runs as the one containment operator every two ticks.

# ------------------------------------------------------------
# AUTHORITY AND BREAK CONDITIONS
# ------------------------------------------------------------

execute unless data storage sf:case {state:"active"} run return run function sf:tool/contain/break

execute unless entity @s[tag=sf.case_participant,tag=sf.contain_operator] run return run function sf:tool/contain/break

execute if score @s sf.claimed matches 1.. run return run function sf:tool/contain/break
execute if entity @s[gamemode=spectator] run return run function sf:tool/contain/break

execute unless items entity @s weapon.mainhand *[custom_data~{sf:{item:"contain"}}] run return run function sf:tool/contain/break

execute unless entity @e[type=minecraft:marker,tag=sf.contain_target,distance=..6,limit=1] run return run function sf:tool/contain/break

execute if entity @e[type=minecraft:marker,tag=sf.contain_target,tag=sf.state.warning,distance=..6,limit=1] run return run function sf:tool/contain/break
execute if entity @e[type=minecraft:marker,tag=sf.contain_target,tag=sf.state.hunt,distance=..6,limit=1] run return run function sf:tool/contain/break

execute if score @s sf.coherence matches ..0 run return run function sf:tool/contain/break

# ------------------------------------------------------------
# PROGRESS AND PULSE CALCULATION
# ------------------------------------------------------------

scoreboard players add @s sf.contain_progress 1

scoreboard players operation #cp sf.data = @s sf.contain_progress

scoreboard players operation #cp_pct sf.data = #cp sf.data
scoreboard players operation #cp_pct sf.data *= #hundred sf.data
scoreboard players operation #cp_pct sf.data /= #contain_need sf.data

scoreboard players operation #contain_pulse2 sf.data = #cp sf.data
scoreboard players operation #contain_pulse2 sf.data %= #two sf.data

scoreboard players operation #contain_pulse4 sf.data = #cp sf.data
scoreboard players operation #contain_pulse4 sf.data %= #four sf.data

scoreboard players operation #contain_pulse10 sf.data = #cp sf.data
scoreboard players operation #contain_pulse10 sf.data %= #ten sf.data

# ------------------------------------------------------------
# TUTORIAL RESISTANCE
# ------------------------------------------------------------

# Tutorial mode is authoritative. It receives seven controlled one-Memory
# pulses at progress 10, 20, 30, 40, 50, 60, and 70.
execute if data storage sf:case {mode:"tutorial"} if score @s sf.contain_progress matches 10..70 if score #contain_pulse10 sf.data matches 0 run function sf:tool/contain/resist_tutorial

# ------------------------------------------------------------
# STANDARD RESISTANCE
# ------------------------------------------------------------

# Normal fragments:
# - Mid phase: ten one-Memory pulses
# - Hard phase: seven two-Memory pulses
# - Expected base cost: 24 Memory
#
# Aggressive fragments:
# - Twenty additional one-Memory pulses
# - Expected base cost: 44 Memory
#
# Hard-phase lash events remain random but now roll only on resistance pulses,
# rather than every two ticks.

execute unless data storage sf:case {mode:"tutorial"} if score #cp_pct sf.data matches 60..84 if score #contain_pulse2 sf.data matches 0 run function sf:tool/contain/resist_mid

execute unless data storage sf:case {mode:"tutorial"} if score #cp_pct sf.data matches 85.. if score #contain_pulse2 sf.data matches 0 run function sf:tool/contain/resist_hard

execute unless data storage sf:case {mode:"tutorial"} if entity @e[type=minecraft:marker,tag=sf.contain_target,tag=sf.tier.aggressive,distance=..6,limit=1] if score #contain_pulse4 sf.data matches 0 run function sf:tool/contain/resist_aggressive

# Resistance that reaches zero interrupts the binding before success.
execute if score @s sf.coherence matches ..0 run return run function sf:tool/contain/break

# ------------------------------------------------------------
# CONTROLLED FEEDBACK
# ------------------------------------------------------------

# Particles pulse five times per second.
execute if score #contain_pulse2 sf.data matches 0 at @s anchored eyes positioned ^ ^ ^2 run particle minecraft:soul_fire_flame ~ ~ ~ 0.25 0.25 0.25 0.0 3

# Channel audio pulses once per second rather than ten times per second.
execute if score #contain_pulse10 sf.data matches 0 run playsound minecraft:block.conduit.ambient.short player @s ~ ~ ~ 0.4 1.4

# ------------------------------------------------------------
# RESOLUTION
# ------------------------------------------------------------

execute if score @s sf.contain_progress >= #contain_need sf.data run return run function sf:tool/contain/success