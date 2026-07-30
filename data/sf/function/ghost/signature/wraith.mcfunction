# ghost/signature/wraith.mcfunction
# Footsteps cross the listener without requiring the manifestation to be
# physically beside them.

tag @a remove sf.signature_target

execute as @p[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..16] run tag @s add sf.signature_target

execute unless entity @a[tag=sf.signature_target] run return 0

execute as @a[tag=sf.signature_target] at @s positioned ^2 ^ ^ run playsound minecraft:block.deepslate.step hostile @s ~ ~ ~ 0.5 0.45
execute as @a[tag=sf.signature_target] at @s positioned ^-2 ^ ^ run playsound minecraft:block.deepslate.step hostile @s ~ ~ ~ 0.5 0.7
execute as @a[tag=sf.signature_target] at @s run playsound minecraft:entity.vex.ambient hostile @s ~ ~ ~ 0.2 0.45

execute as @a[tag=sf.signature_target] at @s run particle minecraft:ash ~ ~1 ~ 0.35 0.45 0.35 0.01 8

tag @a remove sf.signature_target