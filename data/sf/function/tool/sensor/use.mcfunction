# tool/sensor/use.mcfunction — as @s at @s. Toggle: pick up a nearby sensor, else place.
scoreboard players set @s sf.tool_cd 8
execute if entity @e[type=marker,tag=sf.sensor,distance=..2] run return run function sf:tool/sensor/pickup
function sf:tool/sensor/place