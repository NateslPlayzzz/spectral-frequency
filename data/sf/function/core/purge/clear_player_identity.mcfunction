# core/purge/clear_player_identity.mcfunction
# Runs as one player.
#
# Removes all known Spectral Frequency identity and progression tags.
# Safe for genuinely new players and players returning after a full purge.

advancement revoke @s from sf:root

tag @s remove spectral.sf_init
tag @s remove spectral.startup_pending
tag @s remove spectral.seen
tag @s remove spectral.lit
tag @s remove spectral.reconstructed
tag @s remove spectral.was_erased
tag @s remove spectral.bar_assigned
tag @s remove spectral.bar_overflow_warned

tag @s remove spectral.coherence_whole
tag @s remove spectral.coherence_frayed
tag @s remove spectral.coherence_thinning
tag @s remove spectral.coherence_unwritten
tag @s remove spectral.coherence_erased

tag @s remove sf.case_owner
tag @s remove sf.case_participant
tag @s remove sf.case_resolver

tag @s remove sf.seeking
tag @s remove sf.signal_checked
tag @s remove sf.signal_wrong_dimension
tag @s remove sf.signal_suspended
tag @s remove sf.signal_close
tag @s remove sf.signal_mid
tag @s remove sf.signal_far
tag @s remove sf.signal_n
tag @s remove sf.signal_ne
tag @s remove sf.signal_e
tag @s remove sf.signal_se
tag @s remove sf.signal_s
tag @s remove sf.signal_sw
tag @s remove sf.signal_w
tag @s remove sf.signal_nw

tag @s remove sf.tutorial_waiting
tag @s remove sf.at_threshold

tag @s remove sf.forgotten_active
tag @s remove sf.forgotten_seen
tag @s remove sf.forgotten_witness

tag @s remove sf.remnant_channeling
tag @s remove sf.reviving
tag @s remove sf.solo_release_pending

tag @s remove sf.requisition_access
tag @s remove sf.requisition_changed
tag @s remove sf.requisition_missing

tag @s remove sf.fragment_new
tag @s remove sf.evidence_new
tag @s remove sf.sensor_quiet

tag @s remove sf.seen_banshee
tag @s remove sf.seen_dread
tag @s remove sf.seen_hollow
tag @s remove sf.seen_mare
tag @s remove sf.seen_phantom
tag @s remove sf.seen_poltergeist
tag @s remove sf.seen_revenant
tag @s remove sf.seen_shade
tag @s remove sf.seen_shadow
tag @s remove sf.seen_specter
tag @s remove sf.seen_whisper
tag @s remove sf.seen_wraith

# This flag exists only after an administrator explicitly requested
# equipment deletion during a full purge.
execute if data storage sf:system {purge_remove_gear:true} run clear @s *[custom_data~{sf:{}}]