data modify storage sf:temp vline set value "...I watched the readings on that one. You should not have made it back. But you did, and you brought it in. Extraordinary."
function sf:quest/vance
loot give @s loot sf:reward/loot_exceptional
function sf:sfx/reward
playsound minecraft:block.beacon.power_select player @s ~ ~ ~ 0.7 1.4
# Exceptional cases always reveal a real truth, and reach into the deep lore
function sf:reward/lore_mid
function sf:reward/lore_deep