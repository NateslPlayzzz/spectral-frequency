# ghost/signature/poltergeist.mcfunction
# A concentrated non-destructive object barrage.

particle minecraft:crit ~ ~0.7 ~ 0.75 0.6 0.75 0.08 20
particle minecraft:smoke ~ ~0.4 ~ 0.5 0.35 0.5 0.02 8

playsound minecraft:block.wood.break hostile @a[tag=sf.case_participant,distance=..12] ~ ~ ~ 0.75 0.65
playsound minecraft:entity.item_frame.break hostile @a[tag=sf.case_participant,distance=..12] ~ ~ ~ 0.65 0.75
playsound minecraft:block.chain.break hostile @a[tag=sf.case_participant,distance=..12] ~ ~ ~ 0.55 0.8

# Violent motion can spoil an active page exposure, but never removes blocks,
# items, or inventory.
execute as @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0,sf.writing_active=1..},distance=..8] at @s run function sf:tool/writing/break