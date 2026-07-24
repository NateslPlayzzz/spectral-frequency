# player/revive/complete.mcfunction
# Runs as the exact completed remnant interaction entity.

data modify storage sf:temp revive.owner set from entity @s data.sf.owner
data modify storage sf:temp revive.rescuer set from entity @s data.sf.rescuer

data modify storage sf:temp revive.dimension set from entity @s Dimension
data modify storage sf:temp revive.x set from entity @s Pos[0]
data modify storage sf:temp revive.y set from entity @s Pos[1]
data modify storage sf:temp revive.z set from entity @s Pos[2]

function sf:player/revive/complete_resolved with storage sf:temp revive