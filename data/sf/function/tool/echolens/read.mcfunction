# tool/echolens/read.mcfunction — ghost in range; true value from veil_echo evidence
scoreboard players set #echo_val sf.data 0
execute if entity @e[type=marker,tag=sf.ghost,tag=sf.evit.veil_echo,distance=..8] run scoreboard players set #echo_val sf.data 1
function sf:tool/echolens/deceive
function sf:tool/echolens/report