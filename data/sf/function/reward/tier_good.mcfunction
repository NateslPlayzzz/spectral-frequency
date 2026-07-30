# reward/tier_good.mcfunction

data modify storage sf:temp vline set value "Clean work. Better field compensation has been authorized, including additional resonance material."
function sf:quest/vance

loot give @s loot sf:reward/loot_good
loot give @s loot sf:material/ectoplasm

playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1 1.2
playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.6 1.0

tellraw @s [{"text": "[","color": "dark_gray"},{"text": "COMPENSATION","color": "#9BFFB0","bold": true},{"text": "] ","color": "dark_gray"},{"text": "Improved supplies and one bonus Ectoplasm received.","color": "gray"}]

# Good cases always search the atmospheric archive pool.
function sf:reward/lore_shallow

# Restricted records cannot appear before three distinct fragments.
execute if score @s sf.shard_count matches 3.. if predicate sf:chance/35 run function sf:reward/lore_mid