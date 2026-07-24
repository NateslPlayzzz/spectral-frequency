# tool/spiritbox/read.mcfunction — true value: spirit_box evidence => response (1), else silence (0)
scoreboard players set #box_val sf.data 0
execute if entity @e[type=marker,tag=sf.ghost,tag=sf.evit.spirit_box,distance=..8] run scoreboard players set #box_val sf.data 1
function sf:tool/spiritbox/deceive
function sf:tool/spiritbox/report