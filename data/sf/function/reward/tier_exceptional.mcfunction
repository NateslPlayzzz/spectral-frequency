# reward/tier_exceptional.mcfunction

data modify storage sf:temp vline set value "I watched that investigation. You should not have returned intact. Full compensation and additional resonance material have been authorized."
function sf:quest/vance

loot give @s loot sf:reward/loot_exceptional
loot give @s loot sf:material/ectoplasm
loot give @s loot sf:material/ectoplasm

function sf:sfx/reward
playsound minecraft:block.beacon.power_select player @s ~ ~ ~ 0.7 1.4

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"EXCEPTIONAL COMPENSATION","color":"#C89BFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Premium field supplies and two bonus Ectoplasm transferred to your inventory.","color":"gray"}]

execute if score @s sf.shard_count matches ..2 run function sf:reward/lore_shallow
execute if score @s sf.shard_count matches 3.. run function sf:reward/lore_mid
execute if score @s sf.shard_count matches 6.. run function sf:reward/lore_deep