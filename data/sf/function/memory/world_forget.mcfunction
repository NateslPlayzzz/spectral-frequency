# memory/world_forget.mcfunction
# Runs every five seconds while an erased Investigator remains close to
# an active manifestation.
#
# This effect is deliberately personal and non-destructive. Older builds
# physically deleted torches from permanent player constructions.

effect give @s minecraft:darkness 6 0 true

playsound minecraft:block.redstone_torch.burnout ambient @s ~ ~ ~ 0.55 0.55
playsound minecraft:ambient.soul_sand_valley.mood ambient @s ~ ~ ~ 0.35 0.65

particle minecraft:smoke ~ ~1 ~ 0.45 0.65 0.45 0.01 10
particle minecraft:soul ~ ~1 ~ 0.8 0.8 0.8 0.01 8