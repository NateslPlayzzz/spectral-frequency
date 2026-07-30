# tool/flashlight/off.mcfunction
# Clears both the functional state and its derived light tag.

scoreboard players set @s sf.flashlight_on 0
tag @s remove spectral.lit

playsound minecraft:block.lever.click player @s ~ ~ ~ 0.6 0.8
title @s actionbar {"text":"spectral flashlight off","color":"dark_gray"}