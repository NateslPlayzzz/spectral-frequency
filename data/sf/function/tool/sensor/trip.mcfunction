# tool/sensor/trip.mcfunction
# The current manifestation entered the Sensor's five-block field.

execute if entity @s[tag=sf.sensor_quiet] run function sf:tool/sensor/trip_alert

tag @s remove sf.sensor_quiet

particle minecraft:dust{color:[1.0,0.3,0.3],scale:1.0} ~ ~0.5 ~ 0.3 0.4 0.3 0.0 12

execute as @a[tag=sf.case_participant] if score @s sf.case_gen = #case_serial sf.data at @s run playsound minecraft:block.note_block.pling player @s ~ ~ ~ 0.3 1.8