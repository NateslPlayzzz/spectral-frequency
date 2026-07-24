# ghost/detection/hit.mcfunction
# Tags only visible living participants.

execute as @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..1.6] run tag @s add spectral.seen