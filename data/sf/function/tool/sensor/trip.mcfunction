# tool/sensor/trip.mcfunction — movement detected
# Loud ping the FIRST tick it trips (state change), softer while it stays
execute if entity @s[tag=sf.sensor_quiet] run function sf:tool/sensor/trip_alert
tag @s remove sf.sensor_quiet
# Active detection visuals/sound (every second while ghost present)
particle minecraft:dust{color:[1.0,0.3,0.3],scale:1.0} ~ ~0.5 ~ 0.3 0.4 0.3 0.0 12
playsound minecraft:block.note_block.pling ambient @a[distance=..32] ~ ~ ~ 0.5 1.8