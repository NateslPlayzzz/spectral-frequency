# ghost/signature/wraith_los.mcfunction
# Wraiths perceive living participants out to twenty-four blocks regardless
# of whether the target carries active spectral light.

execute if entity @n[type=player,tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..24] anchored eyes facing entity @n[type=player,tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..24] eyes run function sf:ghost/detection/raycast