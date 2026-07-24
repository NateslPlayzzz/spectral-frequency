# ghost/detection/los.mcfunction
# Lit case participants are visible from farther away.

execute if entity @n[type=player,tag=sf.case_participant,tag=spectral.lit,gamemode=!spectator,scores={sf.claimed=0},distance=..24] anchored eyes facing entity @n[type=player,tag=sf.case_participant,tag=spectral.lit,gamemode=!spectator,scores={sf.claimed=0},distance=..24] eyes run return run function sf:ghost/detection/raycast

execute if entity @n[type=player,tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..16] anchored eyes facing entity @n[type=player,tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..16] eyes run function sf:ghost/detection/raycast