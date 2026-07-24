# escalating seal visual/audio
execute store result score #p sf.data run scoreboard players get @s sf.choice_hold
title @s actionbar [{"text":"SEALING... ","color":"#5AC8C8","bold":true},{"score":{"name":"@s","objective":"sf.choice_hold"},"color":"white"},{"text":"%","color":"gray"}]
execute at @s run particle minecraft:soul ^ ^1 ^2 0.3 0.5 0.3 0.02 3
playsound minecraft:block.beacon.ambient master @s ~ ~ ~ 0.3 0.6
execute if score @s sf.choice_hold matches 60 run function sf:forgotten/bind_midword