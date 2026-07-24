# forgotten/choice_tick.mcfunction — detect which hold, accumulate it, abort if released
# Determine intent THIS tick
scoreboard players set #intent sf.data 0
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"contain"}}] run scoreboard players set #intent sf.data 1
execute unless items entity @s weapon.mainhand * run scoreboard players set #intent sf.data 2
# Must be looking at him (don't look away)
execute unless entity @e[tag=sf.forgotten,distance=..30] run scoreboard players set #intent sf.data 0
# If intent changed from what we were holding, reset the hold
execute unless score #intent sf.data = @s sf.choice_path run scoreboard players set @s sf.choice_hold 0
scoreboard players operation @s sf.choice_path = #intent sf.data
# Accumulate or decay
execute if score #intent sf.data matches 1..2 run scoreboard players add @s sf.choice_hold 1
execute if score #intent sf.data matches 0 run scoreboard players set @s sf.choice_hold 0
# Feedback while holding (needs ~100 ticks = 5s)
execute if score #intent sf.data matches 1 if score @s sf.choice_hold matches 1.. run function sf:forgotten/hold_fx_bind
execute if score #intent sf.data matches 2 if score @s sf.choice_hold matches 1.. run function sf:forgotten/hold_fx_remember
# Commit at 100 (5 seconds)
execute if score @s sf.choice_hold matches 120.. if score #intent sf.data matches 1 run function sf:forgotten/choose_bind
execute if score @s sf.choice_hold matches 120.. if score #intent sf.data matches 2 run function sf:forgotten/choose_remember