# ghost/signature/shadow.mcfunction
# The Shadow recoils from active spectral light.

execute unless entity @n[type=player,tag=sf.case_participant,tag=spectral.lit,gamemode=!spectator,scores={sf.claimed=0},distance=..8] run return 0

particle minecraft:large_smoke ~ ~0.5 ~ 0.25 0.45 0.25 0.02 12
playsound minecraft:entity.enderman.teleport hostile @a[tag=sf.case_participant,distance=..10] ~ ~ ~ 0.35 0.55

# A short safe-settled retreat. Destination validation remains owned by the
# ordinary manifestation movement engine.
execute facing entity @n[type=player,tag=sf.case_participant,tag=spectral.lit,gamemode=!spectator,scores={sf.claimed=0},distance=..8] eyes positioned ^ ^ ^-0.6 run function sf:ghost/move_settle