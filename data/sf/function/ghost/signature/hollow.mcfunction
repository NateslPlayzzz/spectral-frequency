# ghost/signature/hollow.mcfunction
# Temporarily empties nearby instrument channels without removing equipment,
# confirmed evidence, or inventory.

execute unless entity @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..10] run return 0

particle minecraft:reverse_portal ~ ~0.7 ~ 0.45 0.6 0.45 0.02 18
particle minecraft:ash ~ ~0.5 ~ 0.35 0.4 0.35 0.01 10

playsound minecraft:block.respawn_anchor.deplete hostile @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..10] ~ ~ ~ 0.45 0.55
playsound minecraft:block.amethyst_block.break hostile @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..10] ~ ~ ~ 0.35 0.45

# Remove only transient HUD readings.
scoreboard players set @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..10] sf.read_timer 0
scoreboard players set @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..10] sf.read_type 0
scoreboard players set @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..10] sf.read_val 0

# Apply a brief instrument lock without reducing a longer existing cooldown.
execute as @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..10] if score @s sf.tool_cd matches ..29 run scoreboard players set @s sf.tool_cd 30

# An exposed Writing page loses its active channel in the void.
execute as @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0,sf.writing_active=1..},distance=..10] at @s run function sf:tool/writing/break

title @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..10] times 0 20 5
title @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..10] title {"text":" "}
title @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..10] subtitle {"text":"every instrument goes quiet","color":"#6A6A78","italic":true}