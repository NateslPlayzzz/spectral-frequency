# tool/sensor/trip_alert.mcfunction — as @s (sensor) at @s. Announce to all investigators.
playsound minecraft:block.bell.use master @a[tag=spectral.sf_init] ~ ~ ~ 0.6 1.6
tellraw @a[tag=spectral.sf_init] [{"text":"[","color":"dark_gray"},{"text":"\u25c8 MOTION","color":"#5AC8C8"},{"text":"] ","color":"dark_gray"},{"text":"Something moved through the sensor's field.","color":"gray","italic":true}]