# ghost/signature/revenant_hunt_move.mcfunction
# Pursues the nearest low-Memory living participant at an accelerated step.

execute unless entity @n[type=player,tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0,sf.coherence=..39},distance=..16] run return 0

execute facing entity @n[type=player,tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0,sf.coherence=..39},distance=..16] eyes positioned ^ ^ ^0.38 run function sf:ghost/hunt/try_move