# lash.mcfunction — as @s at @s. A burst of resistance at the climax.
playsound minecraft:entity.warden.sonic_boom player @s ~ ~ ~ 0.5 1.2
scoreboard players remove @s sf.coherence 2
execute at @s run particle minecraft:sonic_boom ~ ~1 ~ 0 0 0 0 1