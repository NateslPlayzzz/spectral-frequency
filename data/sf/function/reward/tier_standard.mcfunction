# reward/tier_standard.mcfunction

data modify storage sf:temp vline set value "Containment confirmed. Standard work. A calibration supply cache has been transferred."
function sf:quest/vance

loot give @s loot sf:reward/loot_standard

playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1 1.0

tellraw @s [{"text": "[","color": "dark_gray"},{"text": "COMPENSATION","color": "#D8C8A0","bold": true},{"text": "] ","color": "dark_gray"},{"text": "Standard calibration supplies received.","color": "gray"}]