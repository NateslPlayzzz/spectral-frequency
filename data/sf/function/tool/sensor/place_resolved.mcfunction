# tool/sensor/place_resolved.mcfunction
# Macro context:
# {
#   uuid:[I;...]
# }
#
# The controller item remains in the player's hand. Deploying elsewhere
# relocates any loaded Sensor already owned by that player.

$kill @e[type=minecraft:marker,tag=sf.sensor,nbt={data:{sf:{owner:$(uuid)}}}]

$summon minecraft:marker ~ ~ ~ {Tags:["sf.sensor","sf.sensor_quiet","sf.sensor_new","smithed.entity","smithed.strict"],data:{sf:{owner:$(uuid)}}}

scoreboard players operation @e[type=minecraft:marker,tag=sf.sensor,tag=sf.sensor_new,distance=..1,sort=nearest,limit=1] sf.data = #case_serial sf.data
tag @e[type=minecraft:marker,tag=sf.sensor,tag=sf.sensor_new,distance=..1] remove sf.sensor_new

playsound minecraft:block.dispenser.dispense player @s ~ ~ ~ 0.7 1.2
particle minecraft:electric_spark ~ ~0.3 ~ 0.2 0.15 0.2 0.02 8
title @s actionbar {"text":"sensor deployed · one active unit","color":"#5AC8C8","italic":true}