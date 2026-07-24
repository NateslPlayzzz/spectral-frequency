# ghost/hunt/tick.mcfunction
# Runs as the hunting manifestation every two ticks.

particle minecraft:soul ~ ~0.4 ~ 0.1 0.2 0.1 0.0 3
particle minecraft:smoke ~ ~0.5 ~ 0.1 0.2 0.1 0.0 2

function sf:ghost/detection/los

# Only enrolled case participants can be Taken.
execute as @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..1.6] run function sf:player/claim/take

# Advance only when no eligible participant has been reached.
execute unless entity @p[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..1.6] run function sf:ghost/hunt/move