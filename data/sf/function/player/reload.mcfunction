# player/reload.mcfunction
# Rehydrates persistent mirrors during /reload without interrupting a case.

function sf:player/backfill
function sf:player/data/ensure

execute if entity @s[tag=sf.new_record] run function sf:player/first_join

function sf:quest/load_step
function sf:player/data/load_shardcount
function sf:requisition/load

scoreboard players operation @s sf.leave_seen = @s sf.leave_now

tag @s remove sf.signal_checked
function sf:signal/recover

tag @s add spectral.sf_init
tag @s remove sf.new_record