# ghost/hunt/roll.mcfunction
# Runs as the idle manifestation.

# No eligible case participant nearby means no Hunt roll.
execute unless entity @p[tag=sf.case_participant,tag=spectral.sf_init,gamemode=!spectator,scores={sf.claimed=0},distance=..32] run return 0

# Wards suppress Hunt initiation.
execute if entity @e[type=marker,tag=sf.ward,distance=..6] run return 0

scoreboard players set #hunt_chance sf.data 0

execute if entity @p[tag=sf.case_participant,tag=spectral.coherence_whole,gamemode=!spectator,scores={sf.claimed=0},distance=..32] run scoreboard players set #hunt_chance sf.data 2
execute if entity @p[tag=sf.case_participant,tag=spectral.coherence_frayed,gamemode=!spectator,scores={sf.claimed=0},distance=..32] run scoreboard players set #hunt_chance sf.data 8
execute if entity @p[tag=sf.case_participant,tag=spectral.coherence_thinning,gamemode=!spectator,scores={sf.claimed=0},distance=..32] run scoreboard players set #hunt_chance sf.data 18
execute if entity @p[tag=sf.case_participant,tag=spectral.coherence_unwritten,gamemode=!spectator,scores={sf.claimed=0},distance=..32] run scoreboard players set #hunt_chance sf.data 35
execute if entity @p[tag=sf.case_participant,tag=spectral.coherence_erased,gamemode=!spectator,scores={sf.claimed=0},distance=..32] run scoreboard players set #hunt_chance sf.data 55

execute if entity @s[tag=sf.tier.aggressive] run scoreboard players operation #hunt_chance sf.data *= #two sf.data
execute if score #hunt_chance sf.data matches 101.. run scoreboard players set #hunt_chance sf.data 100

execute store result score #hroll sf.data run random value 1..100

execute if score #hroll sf.data <= #hunt_chance sf.data run function sf:ghost/hunt/warn

scoreboard players set #hunt_roll_cd sf.data 5