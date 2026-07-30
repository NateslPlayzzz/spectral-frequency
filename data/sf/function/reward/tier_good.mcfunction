# reward/tier_good.mcfunction

data modify storage sf:temp vline set value "Clean investigation. Improved compensation and additional resonance material have been authorized."
function sf:quest/vance

loot give @s loot sf:reward/loot_good
loot give @s loot sf:material/ectoplasm

playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1 1.2
playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.6 1.0

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"IMPROVED COMPENSATION","color":"#9BFFB0","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Field supplies and one bonus Ectoplasm transferred to your inventory.","color":"gray"}]

function sf:reward/lore_shallow
execute if score @s sf.shard_count matches 3.. if predicate sf:chance/35 run function sf:reward/lore_mid