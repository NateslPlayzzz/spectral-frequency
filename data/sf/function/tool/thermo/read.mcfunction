# tool/thermo/read.mcfunction — true value: freezing evidence => cold (1), else neutral (12)
scoreboard players set #temp_val sf.data 12
execute if entity @e[type=marker,tag=sf.ghost,tag=sf.evit.freezing,distance=..8] run scoreboard players set #temp_val sf.data 1
function sf:tool/thermo/deceive
function sf:tool/thermo/report