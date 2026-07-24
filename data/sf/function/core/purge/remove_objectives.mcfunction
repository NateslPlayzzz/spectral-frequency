# core/purge/remove_objectives.mcfunction
# Must run only after all player and runtime cleanup is complete.

scoreboard objectives remove sf.timer
scoreboard objectives remove sf.coherence
scoreboard objectives remove sf.coherence_band
scoreboard objectives remove sf.coherence_band_prev
scoreboard objectives remove sf.data
scoreboard objectives remove sf.anchor

scoreboard objectives remove sf.hunt_timer
scoreboard objectives remove sf.cooldown_timer
scoreboard objectives remove sf.hunt_roll_cd
scoreboard objectives remove sf.case_age
scoreboard objectives remove sf.roam_timer

scoreboard objectives remove sf.use_rod
scoreboard objectives remove sf.tool_cd
scoreboard objectives remove sf.read_timer
scoreboard objectives remove sf.read_type
scoreboard objectives remove sf.read_val

scoreboard objectives remove sf.journal
scoreboard objectives remove sf.guide

scoreboard objectives remove sf.log_emf
scoreboard objectives remove sf.log_thermo
scoreboard objectives remove sf.log_box
scoreboard objectives remove sf.log_writing
scoreboard objectives remove sf.log_uv
scoreboard objectives remove sf.log_echo
scoreboard objectives remove sf.log_decay

scoreboard objectives remove sf.writing_active
scoreboard objectives remove sf.writing_timer

scoreboard objectives remove sf.contain_progress
scoreboard objectives remove sf.contain_active

scoreboard objectives remove sf.case_start
scoreboard objectives remove sf.case_end

scoreboard objectives remove sf.shard_count
scoreboard objectives remove sf.reconstruct

scoreboard objectives remove sf.claimed
scoreboard objectives remove sf.revive_progress

scoreboard objectives remove sf.bar_slot
scoreboard objectives remove sf.flashlight_on

scoreboard objectives remove sf.incense_cd
scoreboard objectives remove sf.incense_count
scoreboard objectives remove sf.totem_count
scoreboard objectives remove sf.use_totem

scoreboard objectives remove sf.photo_cd
scoreboard objectives remove sf.photo_count

scoreboard objectives remove sf.was_aggressive

scoreboard objectives remove sf.bench_use
scoreboard objectives remove sf.bench_menu
scoreboard objectives remove sf.craft_idx

scoreboard objectives remove sf.quest
scoreboard objectives remove sf.q_trigger
scoreboard objectives remove sf.q_briefed
scoreboard objectives remove sf.opt_quest
scoreboard objectives remove sf.oq_incense
scoreboard objectives remove sf.oq_totem
scoreboard objectives remove sf.oq_lens

scoreboard objectives remove sf.signal
scoreboard objectives remove sf.sig_cd
scoreboard objectives remove sf.sig_dist
scoreboard objectives remove sf.sig_miss

scoreboard objectives remove sf.case_score
scoreboard objectives remove sf.case_photo
scoreboard objectives remove sf.case_lowmem
scoreboard objectives remove sf.case_survived_hunt

scoreboard objectives remove sf.offer
scoreboard objectives remove sf.offer_active
scoreboard objectives remove sf.offer_timer
scoreboard objectives remove sf.offer_roll

scoreboard objectives remove sf.forgotten_phase
scoreboard objectives remove sf.recon_pull
scoreboard objectives remove sf.vigil_timer
scoreboard objectives remove sf.choice_hold
scoreboard objectives remove sf.choice_path

scoreboard objectives remove sf.ev_emf
scoreboard objectives remove sf.ev_thermo
scoreboard objectives remove sf.ev_box
scoreboard objectives remove sf.ev_writing
scoreboard objectives remove sf.ev_uv
scoreboard objectives remove sf.ev_echo

scoreboard objectives remove sf.req_used

scoreboard objectives remove sf.leave_now
scoreboard objectives remove sf.leave_seen