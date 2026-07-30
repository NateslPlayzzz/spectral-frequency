# reward/tier_standard.mcfunction

data modify storage sf:temp vline set value "Containment confirmed. Standard field compensation has been authorized."
function sf:quest/vance

loot give @s loot sf:reward/loot_standard

playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1 1.0

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"STANDARD COMPENSATION","color":"#D8C8A0","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Calibration materials transferred to your inventory.","color":"gray"}]