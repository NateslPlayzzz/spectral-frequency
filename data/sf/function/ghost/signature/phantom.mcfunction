# ghost/signature/phantom.mcfunction
# The Phantom collapses from its current position and attempts to reform
# beside one nearby Investigator.

tag @a remove sf.signature_target

execute as @p[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..10] run tag @s add sf.signature_target

execute unless entity @a[tag=sf.signature_target] run return 0

particle minecraft:large_smoke ~ ~0.6 ~ 0.3 0.5 0.3 0.02 15
particle minecraft:reverse_portal ~ ~0.7 ~ 0.2 0.4 0.2 0.02 10
playsound minecraft:entity.enderman.teleport hostile @a[tag=sf.case_participant,distance=..12] ~ ~ ~ 0.45 0.7

scoreboard players set #phantom_side sf.data 0
execute store result score #phantom_side sf.data run random value 0..1

# Position relative to the selected player while facing the Phantom's old
# location. move_settle retains the normal floor and collision checks.
execute if score #phantom_side sf.data matches 0 at @a[tag=sf.signature_target,limit=1] facing entity @s feet positioned ^1.4 ^ ^ run function sf:ghost/move_settle
execute if score #phantom_side sf.data matches 1 at @a[tag=sf.signature_target,limit=1] facing entity @s feet positioned ^-1.4 ^ ^ run function sf:ghost/move_settle

execute at @s run particle minecraft:soul ~ ~0.7 ~ 0.2 0.35 0.2 0.01 8
execute at @s run particle minecraft:smoke ~ ~0.5 ~ 0.2 0.3 0.2 0.01 6
execute at @s run playsound minecraft:block.amethyst_block.resonate hostile @a[tag=sf.case_participant,distance=..8] ~ ~ ~ 0.35 0.5

title @a[tag=sf.signature_target] times 0 15 5
title @a[tag=sf.signature_target] title {"text":" "}
title @a[tag=sf.signature_target] subtitle {"text":"it reforms beside you","color":"gray","italic":true}

tag @a remove sf.signature_target