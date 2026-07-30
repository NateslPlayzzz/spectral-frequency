# tool/echolens/read.mcfunction
# A manifestation is within optical range.

scoreboard players set #echo_val sf.data 0

execute if entity @e[type=minecraft:marker,tag=sf.ghost,tag=sf.evit.veil_echo,distance=..8] run scoreboard players set #echo_val sf.data 1

# Only a real nearby manifestation may distort the Lens.
function sf:tool/echolens/deceive

function sf:tool/echolens/report