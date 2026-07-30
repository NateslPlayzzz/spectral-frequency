# core/runtime/load.mcfunction

execute unless data storage sf:system {enabled:true} run return 0

function sf:core/config/defaults
function sf:bench/recipes/register
function sf:ghost/defs/register
function sf:core/runtime/constants

execute unless data storage sf:player_data entries run data modify storage sf:player_data entries set value []

execute unless data storage sf:forgotten state run data modify storage sf:forgotten state set value "repair_required"

execute as @a run function sf:player/backfill
execute as @a[tag=spectral.sf_init] run function sf:player/reload

execute as @e[type=minecraft:marker,tag=sf.ghost,tag=!sf.forgotten] run function sf:ghost/signature/backfill

# One-time adoption for an investigation that was already active when
# sf.case_gen was introduced.
execute if data storage sf:config {case_generation_rebuild_pending:true} if data storage sf:case {state:"active"} run scoreboard players operation #adopt_serial sf.data = #case_serial sf.data
execute if data storage sf:config {case_generation_rebuild_pending:true} if data storage sf:case {state:"active"} store result storage sf:config case_generation_adopt_serial int 1 run scoreboard players get #case_serial sf.data
execute if data storage sf:config {case_generation_rebuild_pending:true} if data storage sf:case {state:"active"} as @a[tag=sf.case_participant] run scoreboard players operation @s sf.case_gen = #case_serial sf.data
execute if data storage sf:config {case_generation_rebuild_pending:true} unless data storage sf:case {state:"active"} run data remove storage sf:config case_generation_adopt_serial
execute if data storage sf:config {case_generation_rebuild_pending:true} unless data storage sf:case {state:"active"} run scoreboard players set #adopt_serial sf.data -1
data remove storage sf:config case_generation_rebuild_pending

function sf:forgotten/runtime/load

function sf:tool/contain/clear_all

execute unless data storage sf:case {state:"active"} as @a[scores={sf.claimed=1..}] run function sf:core/restore_player
execute unless data storage sf:case {state:"active"} as @a run function sf:case/clear_runtime_player

execute if data storage sf:case {state:"active"} as @a[tag=!sf.case_participant] run function sf:case/clear_runtime_player

# Reconstruct a missing Remnant for every online Taken player who still
# belongs to the current case generation.
execute if data storage sf:case {state:"active"} as @a[tag=sf.case_participant,scores={sf.claimed=1..}] if score @s sf.case_gen = #case_serial sf.data at @s run function sf:player/claim/ensure_remnant

function sf:ui/rebuild_bars

execute store result score #hb_fast sf.data run time query gametime
scoreboard players operation #hb_1s sf.data = #hb_fast sf.data
scoreboard players operation #hb_5s sf.data = #hb_fast sf.data
scoreboard players operation #hb_30s sf.data = #hb_fast sf.data

schedule function sf:core/loop/fast 2t replace
schedule function sf:core/loop/1_second 1s replace
schedule function sf:core/loop/5_second 5s replace
schedule function sf:core/loop/30_second 30s replace