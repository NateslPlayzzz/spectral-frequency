# bench/key_use.mcfunction — as @s at @s. Find the barrel they're aiming at.
scoreboard players set @s sf.tool_cd 6
scoreboard players set #ray sf.data 0
execute anchored eyes positioned ^ ^ ^0 run function sf:bench/ray