# ghost/contain/resolve.mcfunction
# Resolves only the manifestation selected when the channel began.

execute as @e[type=minecraft:marker,tag=sf.contain_target,distance=..6,limit=1,sort=nearest] at @s run function sf:ghost/contain/dissolve