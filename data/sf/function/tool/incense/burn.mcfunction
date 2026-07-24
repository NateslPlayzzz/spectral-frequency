# tool/incense/burn.mcfunction — as @s at @s. Force the hunting ghost into cooldown.
execute as @e[type=marker,tag=sf.ghost,tag=sf.state.hunt] run function sf:ghost/hunt/end
# Consume one charge + remove one item
scoreboard players remove @s sf.incense_count 1
clear @s *[custom_data~{sf:{item:"incense"}}] 1
# Cooldown + dramatic effect
scoreboard players operation @s sf.incense_cd = #incense_cooldown sf.data
particle minecraft:cloud ~ ~1 ~ 0.6 0.6 0.6 0.02 40
particle minecraft:soul ~ ~1 ~ 0.4 0.5 0.4 0.01 25
playsound minecraft:block.fire.extinguish master @a[distance=..16] ~ ~ ~ 1 0.8
playsound minecraft:block.beacon.deactivate ambient @a[distance=..16] ~ ~ ~ 0.7 1.4
title @s times 5 30 10
title @s subtitle {"text":"the smoke drives it back","color":"#9BFFB0","italic":true}
title @s title {"text":" "}