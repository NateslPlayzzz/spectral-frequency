data modify storage sf:temp vline set value "...I watched the readings on that one. You should not have made it back. But you did, and you brought it in. Extraordinary."
function sf:quest/vance

loot give @s loot sf:reward/loot_exceptional

function sf:sfx/reward
playsound minecraft:block.beacon.power_select player @s ~ ~ ~ 0.7 1.4

# Exceptional rewards remain meaningful at every progression stage:
# 0–2 fragments: atmospheric archive
# 3–5 fragments: restricted archive
# 6+ fragments: restricted plus black archive

execute if score @s sf.shard_count matches ..2 run function sf:reward/lore_shallow
execute if score @s sf.shard_count matches 3.. run function sf:reward/lore_mid
execute if score @s sf.shard_count matches 6.. run function sf:reward/lore_deep