# tool/contain/break.mcfunction — channel interrupted
scoreboard players set @s sf.contain_active 0
scoreboard players set @s sf.contain_progress 0
title @s actionbar {"text":"the binding fails","color":"dark_red","italic":true}
playsound minecraft:block.beacon.deactivate player @s ~ ~ ~ 0.7 0.5