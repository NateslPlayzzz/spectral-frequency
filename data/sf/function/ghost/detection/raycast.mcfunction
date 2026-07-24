# ghost/detection/raycast.mcfunction
# Positioned along the manifestation's sight ray.

execute if entity @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..1.6] run return run function sf:ghost/detection/hit

execute unless entity @s[distance=..24] run return 0
execute unless block ~ ~ ~ #sf:seethrough run return 0

execute positioned ^ ^ ^0.5 run function sf:ghost/detection/raycast