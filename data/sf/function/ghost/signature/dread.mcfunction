# ghost/signature/dread.mcfunction
# A restrained fear pulse foreshadows the Dread's compressed Hunt warning.

execute unless entity @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..12] run return 0

effect give @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..12] minecraft:darkness 1 0 true

particle minecraft:large_smoke ~ ~0.6 ~ 0.5 0.6 0.5 0.02 18
particle minecraft:sculk_soul ~ ~0.8 ~ 0.3 0.5 0.3 0.01 8

playsound minecraft:entity.warden.heartbeat hostile @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..12] ~ ~ ~ 0.75 1.35
playsound minecraft:block.sculk_shrieker.shriek hostile @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..12] ~ ~ ~ 0.25 0.55

title @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..12] times 0 15 5
title @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..12] title {"text":" "}
title @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..12] subtitle {"text":"panic arrives without cause","color":"dark_red","italic":true}