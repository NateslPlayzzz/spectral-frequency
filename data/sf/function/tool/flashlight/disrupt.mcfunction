# tool/flashlight/disrupt.mcfunction
# Temporarily interrupts an active Spectral Flashlight without altering
# the item or any world lighting.

execute unless score @s sf.flashlight_on matches 1.. run return 0

scoreboard players set @s sf.flashlight_on 0
scoreboard players set @s sf.tool_cd 20

tag @s remove spectral.lit

playsound minecraft:block.redstone_torch.burnout hostile @s ~ ~ ~ 0.7 0.7
playsound minecraft:block.lever.click player @s ~ ~ ~ 0.45 0.55

particle minecraft:electric_spark ~ ~1 ~ 0.2 0.35 0.2 0.02 8
particle minecraft:smoke ~ ~1 ~ 0.15 0.25 0.15 0.01 5

title @s actionbar [{"text":"⚠ ","color":"#FFC36B"},{"text":"flashlight interference","color":"gray","italic":true}]