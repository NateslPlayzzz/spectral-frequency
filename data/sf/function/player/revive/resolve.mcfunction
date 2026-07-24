# player/revive/resolve.mcfunction — @s is the remnant; restore its owner at this position
data modify storage sf:temp revive.uuid set from entity @s data.sf.owner
data modify storage sf:temp revive.x set from entity @s Pos[0]
data modify storage sf:temp revive.y set from entity @s Pos[1]
data modify storage sf:temp revive.z set from entity @s Pos[2]
function sf:player/revive/restore_owner with storage sf:temp revive
kill @s