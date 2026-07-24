# tool/flashlight/toggle.mcfunction — as @s at @s
scoreboard players set @s sf.tool_cd 6
execute if score @s sf.flashlight_on matches 0 run return run function sf:tool/flashlight/on
execute if score @s sf.flashlight_on matches 1.. run return run function sf:tool/flashlight/off