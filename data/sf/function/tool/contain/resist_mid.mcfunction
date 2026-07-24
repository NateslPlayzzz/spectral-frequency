# resist_mid.mcfunction — as @s at @s. The ghost resists; coherence bleeds.
scoreboard players remove @s sf.coherence 1
execute at @s run particle minecraft:soul ~ ~1 ~ 0.4 0.5 0.4 0.02 6
playsound minecraft:entity.vex.charge player @s ~ ~ ~ 0.4 0.8