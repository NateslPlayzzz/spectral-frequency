# player/revive/channel.mcfunction
# Runs once per second as one channeling remnant interaction entity.

data modify storage sf:temp revive.owner set from entity @s data.sf.owner
data modify storage sf:temp revive.rescuer set from entity @s data.sf.rescuer

function sf:player/revive/channel_resolved with storage sf:temp revive