# ghost/debug/start_hunt.mcfunction — nearest ghost begins hunting
execute as @e[type=marker,tag=sf.ghost,limit=1,sort=nearest] run function sf:ghost/hunt/start