# player/join.mcfunction
# Attaches a new or returning player without resetting an existing profile.

function sf:player/backfill
function sf:player/data/ensure

execute if entity @s[tag=sf.new_record] run function sf:player/first_join

function sf:quest/load_step
function sf:player/data/load_shardcount
function sf:requisition/load

tag @s add spectral.sf_init

# Mark the current connection generation as processed.
scoreboard players operation @s sf.leave_seen = @s sf.leave_now

# Rebuild persistent signal runtime state.
tag @s remove sf.signal_checked
function sf:signal/recover

function sf:ui/rebuild_bars

tag @s remove sf.new_record