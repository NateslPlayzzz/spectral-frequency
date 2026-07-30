# tool/flashlight/on.mcfunction

scoreboard players set @s sf.flashlight_on 1
tag @s add spectral.lit

playsound minecraft:block.lever.click player @s ~ ~ ~ 0.6 1.2
particle minecraft:end_rod ^ ^ ^1.2 0.05 0.05 0.05 0.0 3

title @s actionbar {"text":"☀ spectral flashlight on","color":"#FFC36B"}