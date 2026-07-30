# tool/sensor/use_resolved.mcfunction
# Macro context:
# {
#   uuid:[I;...]
# }

$execute if entity @e[type=minecraft:marker,tag=sf.sensor,distance=..2,nbt={data:{sf:{owner:$(uuid)}}}] run return run function sf:tool/sensor/pickup_resolved with storage sf:temp sensor

function sf:tool/sensor/place_resolved with storage sf:temp sensor