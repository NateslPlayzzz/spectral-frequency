data modify storage sf:temp vline set value "Clean. That's the kind of work that keeps you alive out here. Better compensation for it."
function sf:quest/vance
loot give @s loot sf:reward/loot_good
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1 1.2
playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.6 1.0
# Good cases reveal atmospheric lore, and sometimes a real reveal
function sf:reward/lore_shallow
execute if predicate sf:chance/35 run function sf:reward/lore_mid