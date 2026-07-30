# tool/flashlight/toggle.mcfunction
# Toggles the personal Spectral Flashlight.

scoreboard players set @s sf.tool_cd 6

execute if score @s sf.claimed matches 1.. run return 0
execute if entity @s[gamemode=spectator] run return 0

execute if score @s sf.flashlight_on matches 0 run return run function sf:tool/flashlight/on
execute if score @s sf.flashlight_on matches 1.. run function sf:tool/flashlight/off