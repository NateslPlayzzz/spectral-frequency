# tool/flashlight/off.mcfunction
# Immediately clear both the functional score and the derived light tag.

scoreboard players set @s sf.flashlight_on 0
tag @s remove spectral.lit

playsound minecraft:block.lever.click master @s ~ ~ ~ 0.6 0.8
title @s actionbar {"text":"flashlight off","color":"dark_gray"}