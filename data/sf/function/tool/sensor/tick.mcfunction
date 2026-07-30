# tool/sensor/tick.mcfunction
# Runs once per second as one loaded Motion Sensor.

execute unless data storage sf:case {state:"active"} run return run kill @s
execute unless score @s sf.data = #case_serial sf.data run return run kill @s

particle minecraft:dust{color:[0.55,0.83,1.0],scale:0.5} ~ ~0.3 ~ 0.05 0.05 0.05 0.0 1

execute if entity @e[type=minecraft:marker,tag=sf.ghost,tag=!sf.forgotten,distance=..5] run function sf:tool/sensor/trip
execute unless entity @e[type=minecraft:marker,tag=sf.ghost,tag=!sf.forgotten,distance=..5] if entity @s[tag=!sf.sensor_quiet] run function sf:tool/sensor/reset