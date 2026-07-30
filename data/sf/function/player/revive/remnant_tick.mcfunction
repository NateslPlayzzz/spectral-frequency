# player/revive/remnant_tick.mcfunction
# Runs once per second as one authoritative Remnant interaction entity.

data modify storage sf:temp remnant.owner set from entity @s data.sf.owner
function sf:player/revive/remnant_tick_resolved with storage sf:temp remnant