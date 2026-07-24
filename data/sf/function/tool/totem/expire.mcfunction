# tool/totem/expire.mcfunction — the ward burns out
particle minecraft:large_smoke ~ ~0.5 ~ 0.4 0.5 0.4 0.02 30
playsound minecraft:block.fire.extinguish ambient @a[distance=..16] ~ ~ ~ 0.8 0.6
playsound minecraft:block.beacon.deactivate ambient @a[distance=..16] ~ ~ ~ 0.6 0.9
execute at @s as @a[distance=..8] run title @s actionbar {"text":"the ward goes cold","color":"dark_gray","italic":true}
kill @s