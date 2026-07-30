# tool/sensor/trip_alert.mcfunction
# Announces the state change only to current-generation case participants.

execute as @a[tag=sf.case_participant] if score @s sf.case_gen = #case_serial sf.data at @s run playsound minecraft:block.bell.use player @s ~ ~ ~ 0.6 1.6
execute as @a[tag=sf.case_participant] if score @s sf.case_gen = #case_serial sf.data run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"◇ MOTION","color":"#5AC8C8","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Something entered the deployed Sensor's field.","color":"gray","italic":true}]