# forgotten/choice/work.mcfunction

scoreboard players set #intent sf.data 0

execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"contain"}}] run scoreboard players set #intent sf.data 1
execute unless items entity @s weapon.mainhand * run scoreboard players set #intent sf.data 2

# Raycast along the player's actual view direction.
scoreboard players set #choice_look sf.data 0
scoreboard players set #choice_ray sf.data 0
execute anchored eyes positioned ^ ^ ^1 run function sf:forgotten/choice/look_step

execute unless score #choice_look sf.data matches 1 run scoreboard players set #intent sf.data 0

execute unless score #intent sf.data = @s sf.choice_path run scoreboard players set @s sf.choice_hold 0
scoreboard players operation @s sf.choice_path = #intent sf.data

execute if score #intent sf.data matches 1..2 run scoreboard players add @s sf.choice_hold 1
execute if score #intent sf.data matches 0 run scoreboard players set @s sf.choice_hold 0

execute if score #intent sf.data matches 1 if score @s sf.choice_hold matches 1.. run function sf:forgotten/hold_fx_bind
execute if score #intent sf.data matches 2 if score @s sf.choice_hold matches 1.. run function sf:forgotten/hold_fx_remember

# Fast loop runs every two ticks: 50 updates is approximately five seconds.
execute if score @s sf.choice_hold matches 50.. if score #intent sf.data matches 1 run function sf:forgotten/choose_bind
execute if score @s sf.choice_hold matches 50.. if score #intent sf.data matches 2 run function sf:forgotten/choose_remember