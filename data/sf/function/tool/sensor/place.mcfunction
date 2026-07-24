# tool/sensor/place.mcfunction — as @s at @s
summon marker ~ ~ ~ {Tags:["sf.sensor","sf.sensor_quiet","smithed.entity","smithed.strict"]}
playsound minecraft:block.dispenser.dispense master @s ~ ~ ~ 0.7 1.2
title @s actionbar {"text":"sensor placed","color":"#5AC8C8","italic":true}