# dev/reset_player.mcfunction — as @s. Full reset to brand-new-player state.
# Wipe persistent data for this UUID
data modify storage sf:temp ruuid set from entity @s UUID
function sf:dev/reset_player_macro with storage sf:temp
# Reset all per-player scores to base
scoreboard players set @s sf.coherence 100
scoreboard players set @s sf.coherence_band 4
scoreboard players set @s sf.coherence_band_prev 4
scoreboard players set @s sf.quest 0
scoreboard players set @s sf.q_briefed 0
scoreboard players set @s sf.shard_count 0
scoreboard players set @s sf.log_emf 0
scoreboard players set @s sf.log_thermo 0
scoreboard players set @s sf.log_box 0
scoreboard players set @s sf.log_writing 0
scoreboard players set @s sf.log_uv 0
scoreboard players set @s sf.log_echo 0
scoreboard players set @s sf.contain_active 0
scoreboard players set @s sf.contain_progress 0
scoreboard players set @s sf.claimed 0
scoreboard players set @s sf.flashlight_on 0
scoreboard players set @s sf.sig_cd 0
scoreboard players set @s sf.sig_miss 0
scoreboard players set @s sf.offer_active 0
scoreboard players set @s sf.offer_timer 0
scoreboard players set @s sf.forgotten_phase 0
scoreboard players set @s sf.recon_pull 0
scoreboard players set @s sf.vigil_timer 0
scoreboard players set @s sf.choice_hold 0
scoreboard players set @s sf.choice_path 0
scoreboard players set @s sf.ev_emf 0
scoreboard players set @s sf.ev_thermo 0
scoreboard players set @s sf.ev_box 0
scoreboard players set @s sf.ev_writing 0
scoreboard players set @s sf.ev_uv 0
scoreboard players set @s sf.ev_echo 0
scoreboard players set @s sf.req_used 0

# -- WORLD --
kill @e[tag=sf.forgotten]

# Clear state tags
tag @s remove spectral.sf_init
tag @s remove spectral.lit
tag @s remove spectral.reconstructed
tag @s remove spectral.coherence_whole
tag @s remove spectral.coherence_frayed
tag @s remove spectral.coherence_thinning
tag @s remove spectral.coherence_unwritten
tag @s remove spectral.coherence_erased
tag @s remove sf.seeking
tag @s remove sf.signal_checked
tag @s remove sf.signal_wrong_dimension
tag @s remove sf.signal_suspended
tag @s remove sf.forgotten_seen
tag @s remove sf.at_threshold
tag @s remove sf.forgotten_active
tag @s remove sf.forgotten_witness
tag @s remove sf.seen_banshee
tag @s remove sf.seen_shadow
tag @s remove sf.seen_specter
tag @s remove sf.seen_poltergeist
tag @s remove sf.seen_revenant
tag @s remove sf.seen_mare
tag @s remove sf.seen_whisper
tag @s remove sf.seen_wraith
tag @s remove sf.seen_phantom
tag @s remove sf.seen_shade
tag @s remove sf.seen_hollow
tag @s remove sf.seen_dread
# Data removal
data remove storage sf:signal target
data remove storage sf:forgotten thin
# Clear inventory of SF tools (optional but clean — comment out if you want to keep gear)
clear @s *[custom_data~{sf:{}}]



# End any active case + clean the world
function sf:case/end
gamemode survival @s
tellraw @s [{"text":"[DEV] ","color":"red"},{"text":"Player reset to fresh-join state. Rejoin or run sf:player/join to re-onboard.","color":"gray"}]
