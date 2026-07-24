# ghost/roam/begin.mcfunction — as @s (ghost) at @s
tag @s add sf.roaming
scoreboard players set @s sf.roam_timer 4
execute store result storage sf:temp roam.yaw int 1 run random value -180..180
function sf:ghost/roam/set_yaw with storage sf:temp roam
playsound minecraft:block.soul_sand.step ambient @a[distance=..20] ~ ~ ~ 0.3 0.6