# tool/sensor/pickup.mcfunction — as @s at @s
kill @e[type=marker,tag=sf.sensor,distance=..2,limit=1]
playsound minecraft:block.dispenser.fail master @s ~ ~ ~ 0.6 0.9
title @s actionbar {"text":"sensor retrieved","color":"#5AC8C8","italic":true}