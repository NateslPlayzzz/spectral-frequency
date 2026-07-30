# core/runtime/load.mcfunction

execute unless data storage sf:system {enabled:true} run return 0

function sf:core/config/defaults
function sf:bench/recipes/register
function sf:ghost/defs/register
function sf:core/runtime/constants

execute unless data storage sf:player_data entries run data modify storage sf:player_data entries set value []

# A schema-102 world missing its finale authority record requires explicit repair.
execute unless data storage sf:forgotten state run data modify storage sf:forgotten state set value "repair_required"

# Existing online players receive newly introduced scores and fields.
execute as @a run function sf:player/backfill
execute as @a[tag=spectral.sf_init] run function sf:player/reload

# Restore signature tags for manifestations that existed before this runtime
# revision or survived an ordinary reload.
execute as @e[type=minecraft:marker,tag=sf.ghost,tag=!sf.forgotten] run function sf:ghost/signature/backfill

# Rebind, resume, or safely pause the persistent finale lifecycle.
function sf:forgotten/runtime/load

# Containment is a short transient interaction and does not resume through
# reload. Cancel it without affecting the active investigation.
function sf:tool/contain/clear_all

# Clear stale case state only when no investigation is active.
execute unless data storage sf:case {state:"active"} as @a[scores={sf.claimed=1..}] run function sf:core/restore_player
execute unless data storage sf:case {state:"active"} as @a run function sf:case/clear_runtime_player

# During an active case, nonparticipants must not retain case-local state.
execute if data storage sf:case {state:"active"} as @a[tag=!sf.case_participant] run function sf:case/clear_runtime_player

function sf:ui/rebuild_bars

# Initialize heartbeat timestamps to the present game time.
execute store result score #hb_fast sf.data run time query gametime
scoreboard players operation #hb_1s sf.data = #hb_fast sf.data
scoreboard players operation #hb_5s sf.data = #hb_fast sf.data
scoreboard players operation #hb_30s sf.data = #hb_fast sf.data

# Replace prevents schedule stacking across reload.
schedule function sf:core/loop/fast 2t replace
schedule function sf:core/loop/1_second 1s replace
schedule function sf:core/loop/5_second 5s replace
schedule function sf:core/loop/30_second 30s replace