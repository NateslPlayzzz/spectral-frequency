# dev/repair/player_worker.mcfunction
# Runs as one online player.
#
# Repairs initialization, missing scores, the persistent UUID profile,
# progression mirrors, reconnect state, pending-signal runtime state,
# and stale case-local state.
#
# Permanent progression is never deliberately reset.

function sf:player/backfill
function sf:player/data/ensure

# A genuinely missing UUID record must follow normal first-join initialization.
execute if entity @s[tag=sf.new_record] run function sf:player/first_join

# Rehydrate persistent profile mirrors.
function sf:quest/load_step
function sf:player/data/load_shardcount
function sf:requisition/load

tag @s add spectral.sf_init

# Mark the current connection generation as handled.
scoreboard players operation @s sf.leave_seen = @s sf.leave_now

# Rebuild pending Field Radio state from the persistent profile.
tag @s remove sf.signal_checked
function sf:signal/recover

# Restore stale Taken state when no valid case owns the player.
execute unless data storage sf:case {state:"active"} if score @s sf.claimed matches 1.. run function sf:core/restore_player
execute if data storage sf:case {state:"active"} unless entity @s[tag=sf.case_participant] if score @s sf.claimed matches 1.. run function sf:core/restore_player

# Remove case-local state when the player is not part of a valid active case.
execute unless data storage sf:case {state:"active"} run function sf:case/clear_runtime_player
execute if data storage sf:case {state:"active"} unless entity @s[tag=sf.case_participant] run function sf:case/clear_runtime_player

# Remove a stale revival flag when no authoritative nearby channel exists.
execute if entity @s[tag=sf.reviving] at @s unless entity @e[type=minecraft:interaction,tag=sf.remnant_interact,tag=sf.remnant_channeling,distance=..4] run function sf:player/revive/clear_player

tag @s remove sf.new_record