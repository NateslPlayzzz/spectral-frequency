# sfx/hunt_warning_dread.mcfunction
# Runs as an endangered living case participant during the Dread's shortened
# warning phase.

effect give @s minecraft:darkness 2 0 true

title @s times 0 35 5
title @s title {"text":" "}
title @s subtitle {"text":"fear arrives before it does","color":"dark_red","bold":true,"italic":true}

playsound minecraft:entity.warden.heartbeat hostile @s ~ ~ ~ 1.0 1.3
playsound minecraft:block.sculk_shrieker.shriek hostile @s ~ ~ ~ 0.55 0.65
playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.75 0.2

particle minecraft:large_smoke ~ ~1 ~ 0.3 0.45 0.3 0.02 12
particle minecraft:sculk_soul ~ ~1 ~ 0.2 0.35 0.2 0.01 7