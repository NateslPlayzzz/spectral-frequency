# tool/sensor/tick.mcfunction — ping if the ghost is within the watch radius
# Idle status light (faint) so you can see it's armed
particle minecraft:dust{color:[0.55,0.83,1.0],scale:0.5} ~ ~0.3 ~ 0.05 0.05 0.05 0.0 1
# Ghost in range?
execute if entity @e[type=marker,tag=sf.ghost,distance=..5] run function sf:tool/sensor/trip
# No ghost in range and was tripped -> reset to quiet
execute unless entity @e[type=marker,tag=sf.ghost,distance=..5] if entity @s[tag=!sf.sensor_quiet] run function sf:tool/sensor/reset