# tool/emf/read.mcfunction — ghost in range; derive true level then maybe deceive
scoreboard players set #emf_level sf.data 2
execute if entity @e[type=marker,tag=sf.ghost,tag=sf.evit.emf,distance=..8] run scoreboard players set #emf_level sf.data 5
function sf:tool/emf/deceive
function sf:tool/emf/report