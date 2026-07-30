# ghost/detection/los.mcfunction
# Resolves the nearest living case participant within the manifestation's
# current visual range.

# Wraiths do not depend on emitted light to perceive targets at long range.
execute if entity @s[tag=sf.sig.wraith] run return run function sf:ghost/signature/wraith_los

# Ordinary manifestations perceive an active Spectral Flashlight farther away.
execute if entity @n[type=player,tag=sf.case_participant,tag=spectral.lit,gamemode=!spectator,scores={sf.claimed=0},distance=..24] anchored eyes facing entity @n[type=player,tag=sf.case_participant,tag=spectral.lit,gamemode=!spectator,scores={sf.claimed=0},distance=..24] eyes run return run function sf:ghost/detection/raycast

# Unlit participants have the shorter ordinary visual range.
execute if entity @n[type=player,tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..16] anchored eyes facing entity @n[type=player,tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..16] eyes run function sf:ghost/detection/raycast