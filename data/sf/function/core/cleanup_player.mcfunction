# core/cleanup_player.mcfunction
# Removes transient runtime state while preserving permanent progression.

function sf:case/clear_runtime_player

tag @s remove spectral.sf_init
tag @s remove spectral.seen
tag @s remove spectral.lit

tag @s remove spectral.coherence_whole
tag @s remove spectral.coherence_frayed
tag @s remove spectral.coherence_thinning
tag @s remove spectral.coherence_unwritten
tag @s remove spectral.coherence_erased

tag @s remove sf.seeking
tag @s remove sf.signal_checked

function sf:signal/clear_hud_tags

tag @s remove sf.tutorial_waiting
tag @s remove sf.at_threshold
tag @s remove sf.forgotten_active
tag @s remove sf.forgotten_witness

tag @s remove sf.requisition_changed
tag @s remove sf.requisition_access
tag @s remove sf.requisition_missing
tag @s remove sf.new_record

scoreboard players set @s sf.flashlight_on 0
scoreboard players set @s sf.writing_active 0
scoreboard players set @s sf.writing_timer 0
scoreboard players set @s sf.contain_active 0
scoreboard players set @s sf.contain_progress 0
scoreboard players set @s sf.read_timer 0
scoreboard players set @s sf.read_type 0
scoreboard players set @s sf.read_val 0