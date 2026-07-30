# tool/sensor/pickup_resolved.mcfunction
# Macro context:
# {
#   uuid:[I;...]
# }

$kill @e[type=minecraft:marker,tag=sf.sensor,distance=..2,nbt={data:{sf:{owner:$(uuid)}}}]

playsound minecraft:block.dispenser.fail player @s ~ ~ ~ 0.6 0.9
particle minecraft:electric_spark ~ ~0.3 ~ 0.15 0.12 0.15 0.01 5
title @s actionbar {"text":"sensor retrieved","color":"#5AC8C8","italic":true}