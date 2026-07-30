# player/backfill.mcfunction
# Initializes missing scores without overwriting existing progress.

scoreboard players add @s sf.timer 0
scoreboard players add @s sf.coherence 0
scoreboard players add @s sf.coherence_band 0
scoreboard players add @s sf.coherence_band_prev 0

scoreboard players add @s sf.hunt_timer 0
scoreboard players add @s sf.cooldown_timer 0
scoreboard players add @s sf.hunt_roll_cd 0
scoreboard players add @s sf.case_age 0
scoreboard players add @s sf.roam_timer 0

scoreboard players add @s sf.use_rod 0
scoreboard players add @s sf.tool_cd 0
scoreboard players add @s sf.read_timer 0
scoreboard players add @s sf.read_type 0
scoreboard players add @s sf.read_val 0

scoreboard players add @s sf.journal 0
scoreboard players add @s sf.case_id 0
scoreboard players add @s sf.guide 0

scoreboard players add @s sf.log_emf 0
scoreboard players add @s sf.log_thermo 0
scoreboard players add @s sf.log_box 0
scoreboard players add @s sf.log_writing 0
scoreboard players add @s sf.log_uv 0
scoreboard players add @s sf.log_echo 0
scoreboard players add @s sf.log_decay 0

scoreboard players add @s sf.writing_active 0
scoreboard players add @s sf.writing_timer 0

scoreboard players add @s sf.contain_progress 0
scoreboard players add @s sf.contain_active 0

scoreboard players add @s sf.shard_count 0
scoreboard players add @s sf.reconstruct 0

scoreboard players add @s sf.claimed 0
scoreboard players add @s sf.revive_progress 0

scoreboard players add @s sf.bar_slot 0
scoreboard players add @s sf.flashlight_on 0

scoreboard players add @s sf.incense_cd 0
scoreboard players add @s sf.incense_count 0
scoreboard players add @s sf.totem_count 0
scoreboard players add @s sf.use_totem 0

scoreboard players add @s sf.photo_cd 0
scoreboard players add @s sf.photo_count 0

scoreboard players add @s sf.was_aggressive 0

scoreboard players add @s sf.bench_use 0
scoreboard players add @s sf.bench_menu 0
scoreboard players add @s sf.craft_idx 0

scoreboard players add @s sf.quest 0
scoreboard players add @s sf.q_trigger 0
scoreboard players add @s sf.q_briefed 0
scoreboard players add @s sf.opt_quest 0
scoreboard players add @s sf.oq_incense 0
scoreboard players add @s sf.oq_totem 0
scoreboard players add @s sf.oq_lens 0

scoreboard players add @s sf.signal 0
scoreboard players add @s sf.sig_cd 0
scoreboard players add @s sf.sig_dist 0
scoreboard players add @s sf.sig_miss 0

scoreboard players add @s sf.case_score 0
scoreboard players add @s sf.case_photo 0
scoreboard players add @s sf.case_hunt_photo 0
scoreboard players add @s sf.case_lowmem 0
scoreboard players add @s sf.case_survived_hunt 0

scoreboard players add @s sf.offer 0
scoreboard players add @s sf.offer_active 0
scoreboard players add @s sf.offer_timer 0
scoreboard players add @s sf.offer_roll 0

scoreboard players add @s sf.forgotten_phase 0
scoreboard players add @s sf.recon_pull 0
scoreboard players add @s sf.vigil_timer 0
scoreboard players add @s sf.choice_hold 0
scoreboard players add @s sf.choice_path 0

scoreboard players add @s sf.ev_emf 0
scoreboard players add @s sf.ev_thermo 0
scoreboard players add @s sf.ev_box 0
scoreboard players add @s sf.ev_writing 0
scoreboard players add @s sf.ev_uv 0
scoreboard players add @s sf.ev_echo 0

scoreboard players add @s sf.req_used 0

scoreboard players add @s sf.leave_now 0
scoreboard players add @s sf.leave_seen 0

# Player-facing trigger authorization is safe to repeat.
scoreboard players enable @s sf.journal
scoreboard players enable @s sf.guide
scoreboard players enable @s sf.reconstruct
scoreboard players enable @s sf.use_totem
scoreboard players enable @s sf.q_trigger
scoreboard players enable @s sf.signal
scoreboard players enable @s sf.offer
scoreboard players enable @s sf.bench_menu