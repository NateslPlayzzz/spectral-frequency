# forgotten/manifest.mcfunction

execute unless data storage sf:forgotten {state:"manifest"} run return 0
execute unless entity @s[tag=sf.forgotten_witness] run return 0

kill @e[tag=sf.forgotten]

title @s times 20 100 40
title @s title {"text":" "}
title @s subtitle {"text":"he is here","color":"#8B0000","bold":true}

execute at @s anchored eyes positioned ^ ^ ^3 positioned ~ ~-1 ~ run function sf:forgotten/spawn

data modify storage sf:forgotten manifest.dimension set from entity @s Dimension
execute store result storage sf:forgotten manifest.x int 1 run data get entity @e[type=minecraft:marker,tag=sf.forgotten,sort=nearest,limit=1] Pos[0] 1
execute store result storage sf:forgotten manifest.y int 1 run data get entity @e[type=minecraft:marker,tag=sf.forgotten,sort=nearest,limit=1] Pos[1] 1
execute store result storage sf:forgotten manifest.z int 1 run data get entity @e[type=minecraft:marker,tag=sf.forgotten,sort=nearest,limit=1] Pos[2] 1

scoreboard players set @s sf.vigil_timer 0

playsound minecraft:entity.warden.emerge master @s ~ ~ ~ 1 0.6
playsound minecraft:ambient.cave master @s ~ ~ ~ 1 0.4

execute at @s run function sf:forgotten/assemble_fx

data modify storage sf:temp vline set value "...there you are. I have waited so long to be seen. Do you know how long it has been since anyone looked at me and did not look away?"
function sf:forgotten/voice