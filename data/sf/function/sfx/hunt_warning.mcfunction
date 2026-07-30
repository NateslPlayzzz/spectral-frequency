# sfx/hunt_warning.mcfunction
# Runs as an endangered living case participant at that player.
# Uses the subtitle layer so evidence readings and Radio navigation cannot
# erase the three-second Hunt warning.

title @s times 0 55 5
title @s title {"text":" "}
title @s subtitle {"text":"the air goes wrong","color":"dark_red","bold":true,"italic":true}

playsound minecraft:entity.warden.heartbeat hostile @s ~ ~ ~ 0.85 0.55
playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.8 0.3
playsound minecraft:block.deepslate.fall ambient @s ~ ~ ~ 0.65 0.5

particle minecraft:smoke ~ ~1 ~ 0.25 0.4 0.25 0.01 10