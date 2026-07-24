# player/revive/break.mcfunction
# Runs as the authoritative remnant interaction entity.

execute if data entity @s data.sf.rescuer run data modify storage sf:temp revive.rescuer set from entity @s data.sf.rescuer
execute if data entity @s data.sf.rescuer run function sf:player/revive/break_resolved with storage sf:temp revive

tag @s remove sf.remnant_channeling
data remove entity @s data.sf.rescuer
scoreboard players set @s sf.revive_progress 0

particle minecraft:smoke ~ ~0.9 ~ 0.25 0.4 0.25 0.01 7