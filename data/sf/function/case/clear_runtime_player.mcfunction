# case/clear_runtime_player.mcfunction
# Clears case-local state without touching permanent progression.

function sf:case/reset
function sf:case/reset_performance

scoreboard players set @s sf.case_gen 0

tag @s remove sf.case_participant
tag @s remove sf.case_owner
tag @s remove sf.case_resolver
tag @s remove sf.solo_release_pending
tag @s remove sf.reviving
tag @s remove sf.evidence_new

tag @s remove spectral.seen
tag @s remove spectral.lit

scoreboard players set @s sf.writing_active 0
scoreboard players set @s sf.writing_timer 0
scoreboard players set @s sf.contain_active 0
scoreboard players set @s sf.contain_progress 0
scoreboard players set @s sf.read_timer 0
scoreboard players set @s sf.read_type 0
scoreboard players set @s sf.read_val 0
scoreboard players set @s sf.flashlight_on 0