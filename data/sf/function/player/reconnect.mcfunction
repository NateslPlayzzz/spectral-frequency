# player/reconnect.mcfunction
# Runs once on the first tick after a new server connection.

function sf:player/backfill
function sf:player/data/ensure

execute if entity @s[tag=sf.new_record] run function sf:player/first_join

scoreboard players set @s sf.tool_cd 0
scoreboard players set @s sf.read_timer 0
scoreboard players set @s sf.read_type 0
scoreboard players set @s sf.read_val 0
scoreboard players set @s sf.writing_active 0
scoreboard players set @s sf.writing_timer 0

execute if entity @s[tag=sf.contain_operator] run function sf:tool/contain/release_target
function sf:tool/contain/clear_player

scoreboard players set @s sf.flashlight_on 0
scoreboard players set @s sf.bench_menu 0
scoreboard players set @s sf.signal 0
scoreboard players set @s sf.guide 0
scoreboard players set @s sf.journal 0

execute if score @s sf.claimed matches 0 run scoreboard players set @s sf.revive_progress 0

tag @s remove spectral.lit
tag @s remove spectral.seen
tag @s remove sf.reviving
tag @s remove sf.case_resolver
tag @s remove sf.evidence_new
tag @s remove sf.requisition_changed
tag @s remove sf.requisition_access
tag @s remove sf.requisition_missing

function sf:signal/clear_hud_tags

function sf:quest/load_step
function sf:player/data/load_shardcount
function sf:requisition/load

# During the one-time generation migration, an old participant with no
# generation score may adopt the still-active case.
execute if data storage sf:case {state:"active"} if entity @s[tag=sf.case_participant] if score @s sf.case_gen matches 0 if score #adopt_serial sf.data = #case_serial sf.data run scoreboard players operation @s sf.case_gen = #case_serial sf.data

# A participant tag is valid only when its generation matches the current case.
execute if data storage sf:case {state:"active"} if entity @s[tag=sf.case_participant] unless score @s sf.case_gen = #case_serial sf.data if score @s sf.claimed matches 1.. run function sf:core/restore_player
execute if data storage sf:case {state:"active"} if entity @s[tag=sf.case_participant] unless score @s sf.case_gen = #case_serial sf.data run function sf:case/clear_runtime_player

# A Taken state without valid current-case participation is never retained.
execute unless data storage sf:case {state:"active"} if score @s sf.claimed matches 1.. run function sf:core/restore_player
execute if data storage sf:case {state:"active"} unless entity @s[tag=sf.case_participant] if score @s sf.claimed matches 1.. run function sf:core/restore_player

execute unless data storage sf:case {state:"active"} run function sf:case/clear_runtime_player
execute if data storage sf:case {state:"active"} unless entity @s[tag=sf.case_participant] run function sf:case/clear_runtime_player

# A valid Taken reconnect receives a replacement Remnant when its original
# interaction assembly is missing.
execute if data storage sf:case {state:"active"} if entity @s[tag=sf.case_participant] if score @s sf.case_gen = #case_serial sf.data if score @s sf.claimed matches 1.. at @s run function sf:player/claim/ensure_remnant

tag @s remove sf.signal_checked
function sf:signal/recover

scoreboard players operation @s sf.leave_seen = @s sf.leave_now

tag @s add spectral.sf_init
tag @s remove sf.new_record

function sf:ui/rebuild_bars
function sf:forgotten/authority/refresh