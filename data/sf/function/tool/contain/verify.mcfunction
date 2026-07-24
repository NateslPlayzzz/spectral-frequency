# tool/contain/verify.mcfunction — as @s (player)
scoreboard players set #ok sf.data 1
execute if score #need_emf sf.data matches 1 unless score @s sf.log_emf matches 1 run scoreboard players set #ok sf.data 0
execute if score #need_thermo sf.data matches 1 unless score @s sf.log_thermo matches 1 run scoreboard players set #ok sf.data 0
execute if score #need_box sf.data matches 1 unless score @s sf.log_box matches 1 run scoreboard players set #ok sf.data 0
execute if score #need_writing sf.data matches 1 unless score @s sf.log_writing matches 1 run scoreboard players set #ok sf.data 0
execute if score #need_uv sf.data matches 1 unless score @s sf.log_uv matches 1 run scoreboard players set #ok sf.data 0
execute if score #need_echo sf.data matches 1 unless score @s sf.log_echo matches 1 run scoreboard players set #ok sf.data 0
execute if score #ok sf.data matches 1 run function sf:tool/contain/start
execute unless score #ok sf.data matches 1 run function sf:tool/contain/reject