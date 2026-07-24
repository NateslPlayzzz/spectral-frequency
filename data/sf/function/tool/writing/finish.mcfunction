# tool/writing/finish.mcfunction — as @s (player) at @s. Resolve the result.
scoreboard players set @s sf.writing_active 0
# True value: ghost with writing evidence in range => written (1), else blank (0)
scoreboard players set #write_val sf.data 0
execute if entity @e[type=marker,tag=sf.ghost,tag=sf.evit.ghost_writing,distance=..8] run scoreboard players set #write_val sf.data 1
function sf:tool/writing/deceive
function sf:tool/writing/report