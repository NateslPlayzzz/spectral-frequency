# ghost/contain/dissolve.mcfunction — as @s (ghost) at @s
particle minecraft:soul ~ ~0.5 ~ 0.4 0.6 0.4 0.05 40
particle minecraft:end_rod ~ ~0.5 ~ 0.3 0.5 0.3 0.02 20
playsound minecraft:particle.soul_escape ambient @a[distance=..20] ~ ~ ~ 1 0.8
kill @s
kill @e[tag=sf.uv_trace]