# player/revive/start.mcfunction
# Runs as the selected remnant interaction entity.

data modify storage sf:temp revive.owner set from entity @s data.sf.owner

function sf:player/revive/start_resolved with storage sf:temp revive