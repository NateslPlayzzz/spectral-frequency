# sfx/hunt_start.mcfunction
# Runs as a living case participant at that player when a Hunt begins.

title @s times 5 40 15
title @s title {"text":" "}
title @s subtitle {"text":"it remembers you","color":"dark_red","bold":true,"italic":true}

playsound minecraft:entity.warden.roar hostile @s ~ ~ ~ 0.75 0.8
playsound minecraft:entity.warden.heartbeat hostile @s ~ ~ ~ 0.9 0.65
playsound minecraft:block.sculk_shrieker.shriek hostile @s ~ ~ ~ 0.5 0.75
playsound minecraft:ambient.soul_sand_valley.mood hostile @s ~ ~ ~ 0.55 0.6