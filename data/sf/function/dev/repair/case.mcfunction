# dev/repair/case.mcfunction
# Force-closes a corrupted or abandoned STANDARD investigation.
#
# Preserves:
# - quest progression
# - lifetime evidence
# - reconstructed fragments
# - Bench unlocks
# - requisition history
# - pending Field Radio records
# - equipment
#
# This command deliberately refuses to run during a loaded Forgotten finale.
# Finale cleanup requires its own witness-aware repair path.

execute unless data storage sf:system {enabled:true} run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"SF REPAIR","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Runtime is disabled. Case repair was not performed.","color":"#FFC36B"}]

execute unless data storage sf:forgotten {state:"idle"} run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"SF REPAIR","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Case repair refused: the Forgotten lifecycle is active or awaiting repair.","color":"#FF8E8E"},{"text":" Use /function sf:dev/repair/finale instead.","color":"gray"}]
# Restore any online Taken players before clearing case ownership.
execute as @a[scores={sf.claimed=1..}] run function sf:core/restore_player

# Remove case-local state from every online player.
execute as @a run function sf:case/clear_runtime_player

# Remove loaded standard-case runtime entities.
kill @e[type=minecraft:marker,tag=sf.ghost]
kill @e[tag=sf.uv_trace]
kill @e[tag=sf.remnant]
kill @e[type=minecraft:marker,tag=sf.ward]
kill @e[tag=sf.case_source]
kill @e[tag=sf.dispatch_origin]

# Remove obsolete or detached release scheduling.
schedule clear sf:player/claim/solo_release

# Clear global case ownership and runtime counters.
tag @a remove sf.case_participant
tag @a remove sf.case_owner
tag @a remove sf.case_resolver
tag @a remove sf.solo_release_pending

scoreboard players set #case_age sf.data 0
scoreboard players set #hunt_roll_cd sf.data 0

data modify storage sf:case state set value "inactive"
data remove storage sf:case id
data remove storage sf:case mode
data remove storage sf:case owner
data remove storage sf:case dimension
data remove storage sf:case spawn
data remove storage sf:case participants
data remove storage sf:case resolver
data remove storage sf:case result
data remove storage sf:case ghost

# Rehydrate pending signals now that the global case lock is gone.
tag @a[tag=spectral.sf_init] remove sf.signal_checked
execute as @a[tag=spectral.sf_init] run function sf:signal/recover

function sf:ui/rebuild_bars

data modify storage sf:system last_action set value "repair_case"

tellraw @a [{"text":"[","color":"dark_gray"},{"text":"SF REPAIR","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"The standard investigation runtime was force-closed and repaired.","color":"#9BFFB0"}]
tellraw @a [{"text":"  Permanent Investigator progression and pending Field Radio records were preserved.","color":"gray"}]
tellraw @a [{"text":"  Loaded runtime entities were removed; unloaded orphaned entities remain a world-maintenance limitation.","color":"dark_gray"}]