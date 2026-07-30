# bench/key_use.mcfunction
# Finds the barrel the Key is aimed at and either attunes or opens it.

scoreboard players set @s sf.tool_cd 6

execute if score @s sf.claimed matches 1.. run return 0
execute if entity @s[gamemode=spectator] run return 0

scoreboard players set #ray sf.data 0
execute anchored eyes positioned ^ ^ ^0 run function sf:bench/ray