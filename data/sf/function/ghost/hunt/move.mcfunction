# ghost/hunt/move.mcfunction
# Moves toward the nearest living case participant.

execute unless entity @n[type=player,tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..16] run return 0

execute facing entity @n[type=player,tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..16] eyes positioned ^ ^ ^0.3 run function sf:ghost/hunt/try_move