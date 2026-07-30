# tool/writing/finish.mcfunction
# Resolves the five-second exposure at the Investigator's final position.

scoreboard players set @s sf.writing_active 0
scoreboard players set @s sf.writing_timer 0

scoreboard players set #scan_near sf.data 0
scoreboard players set #write_val sf.data 0

# The exposure has evidentiary value only when completed near a manifestation.
execute if entity @e[type=minecraft:marker,tag=sf.ghost,distance=..8] run scoreboard players set #scan_near sf.data 1

# True value: a nearby manifestation with Ghost Writing.
execute if entity @e[type=minecraft:marker,tag=sf.ghost,tag=sf.evit.ghost_writing,distance=..8] run scoreboard players set #write_val sf.data 1

# Memory distortion applies only when an actual manifestation is influencing
# the page. Empty locations cannot fabricate authoritative case evidence.
execute if score #scan_near sf.data matches 1 run function sf:tool/writing/deceive

function sf:tool/writing/report