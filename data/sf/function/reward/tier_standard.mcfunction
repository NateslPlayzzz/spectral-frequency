data modify storage sf:temp vline set value "Containment confirmed. Standard work \u2014 it's logged. Payment's been sent to your account."
function sf:quest/vance
loot give @s loot sf:reward/loot_standard
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1 1.0