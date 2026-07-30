# ghost/hunt/move.mcfunction
# Moves toward the nearest living case participant.

# Revenants prioritize and accelerate toward a low-Memory Investigator.
execute if entity @s[tag=sf.sig.revenant] if entity @n[type=player,tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0,sf.coherence=..39},distance=..16] run return run function sf:ghost/signature/revenant_hunt_move

execute unless entity @n[type=player,tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..16] run return 0

execute facing entity @n[type=player,tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..16] eyes positioned ^ ^ ^0.3 run function sf:ghost/hunt/try_move