# core/install/fresh.mcfunction
# Runs exactly once for a genuinely new installation.

# ------------------------------------------------------------
# PLAYER AND RUNTIME OBJECTIVES
# ------------------------------------------------------------

scoreboard objectives add sf.timer dummy
scoreboard objectives add sf.coherence dummy
scoreboard objectives add sf.coherence_band dummy
scoreboard objectives add sf.coherence_band_prev dummy
scoreboard objectives add sf.data dummy
scoreboard objectives add sf.anchor trigger

scoreboard objectives add sf.hunt_timer dummy
scoreboard objectives add sf.cooldown_timer dummy
scoreboard objectives add sf.hunt_roll_cd dummy
scoreboard objectives add sf.case_age dummy
scoreboard objectives add sf.roam_timer dummy

scoreboard objectives add sf.use_rod used:carrot_on_a_stick
scoreboard objectives add sf.tool_cd dummy
scoreboard objectives add sf.read_timer dummy
scoreboard objectives add sf.read_type dummy
scoreboard objectives add sf.read_val dummy

scoreboard objectives add sf.journal trigger
scoreboard objectives add sf.guide trigger

scoreboard objectives add sf.log_emf dummy
scoreboard objectives add sf.log_thermo dummy
scoreboard objectives add sf.log_box dummy
scoreboard objectives add sf.log_writing dummy
scoreboard objectives add sf.log_uv dummy
scoreboard objectives add sf.log_echo dummy
scoreboard objectives add sf.log_decay dummy

scoreboard objectives add sf.writing_active dummy
scoreboard objectives add sf.writing_timer dummy

scoreboard objectives add sf.contain_progress dummy
scoreboard objectives add sf.contain_active dummy

scoreboard objectives add sf.case_start trigger
scoreboard objectives add sf.case_end trigger

scoreboard objectives add sf.shard_count dummy
scoreboard objectives add sf.reconstruct trigger

scoreboard objectives add sf.claimed dummy
scoreboard objectives add sf.revive_progress dummy

scoreboard objectives add sf.bar_slot dummy
scoreboard objectives add sf.flashlight_on dummy

scoreboard objectives add sf.incense_cd dummy
scoreboard objectives add sf.incense_count dummy
scoreboard objectives add sf.totem_count dummy
scoreboard objectives add sf.use_totem trigger

scoreboard objectives add sf.photo_cd dummy
scoreboard objectives add sf.photo_count dummy

scoreboard objectives add sf.was_aggressive dummy

scoreboard objectives add sf.bench_use dummy
scoreboard objectives add sf.bench_menu trigger
scoreboard objectives add sf.craft_idx dummy

scoreboard objectives add sf.quest dummy
scoreboard objectives add sf.q_trigger trigger
scoreboard objectives add sf.q_briefed dummy
scoreboard objectives add sf.opt_quest dummy
scoreboard objectives add sf.oq_incense dummy
scoreboard objectives add sf.oq_totem dummy
scoreboard objectives add sf.oq_lens dummy

scoreboard objectives add sf.signal trigger
scoreboard objectives add sf.sig_cd dummy
scoreboard objectives add sf.sig_dist dummy
scoreboard objectives add sf.sig_miss dummy

scoreboard objectives add sf.case_score dummy
scoreboard objectives add sf.case_photo dummy
scoreboard objectives add sf.case_lowmem dummy
scoreboard objectives add sf.case_survived_hunt dummy

# Legacy offer objectives remain temporarily for migration compatibility.
scoreboard objectives add sf.offer trigger
scoreboard objectives add sf.offer_active dummy
scoreboard objectives add sf.offer_timer dummy
scoreboard objectives add sf.offer_roll dummy

scoreboard objectives add sf.forgotten_phase dummy
scoreboard objectives add sf.recon_pull dummy
scoreboard objectives add sf.vigil_timer dummy
scoreboard objectives add sf.choice_hold dummy
scoreboard objectives add sf.choice_path dummy

scoreboard objectives add sf.ev_emf dummy
scoreboard objectives add sf.ev_thermo dummy
scoreboard objectives add sf.ev_box dummy
scoreboard objectives add sf.ev_writing dummy
scoreboard objectives add sf.ev_uv dummy
scoreboard objectives add sf.ev_echo dummy

scoreboard objectives add sf.req_used dummy

# Session-generation tracking.
# leave_now increments while the player is departing the server.
scoreboard objectives add sf.leave_now minecraft.custom:minecraft.leave_game
scoreboard objectives add sf.leave_seen dummy

# ------------------------------------------------------------
# MEMORY BOSSBAR POOL
# ------------------------------------------------------------

bossbar add sf:mem0 {"text":"MEMORY"}
bossbar add sf:mem1 {"text":"MEMORY"}
bossbar add sf:mem2 {"text":"MEMORY"}
bossbar add sf:mem3 {"text":"MEMORY"}
bossbar add sf:mem4 {"text":"MEMORY"}
bossbar add sf:mem5 {"text":"MEMORY"}
bossbar add sf:mem6 {"text":"MEMORY"}
bossbar add sf:mem7 {"text":"MEMORY"}

bossbar set sf:mem0 max 100
bossbar set sf:mem1 max 100
bossbar set sf:mem2 max 100
bossbar set sf:mem3 max 100
bossbar set sf:mem4 max 100
bossbar set sf:mem5 max 100
bossbar set sf:mem6 max 100
bossbar set sf:mem7 max 100

bossbar set sf:mem0 visible false
bossbar set sf:mem1 visible false
bossbar set sf:mem2 visible false
bossbar set sf:mem3 visible false
bossbar set sf:mem4 visible false
bossbar set sf:mem5 visible false
bossbar set sf:mem6 visible false
bossbar set sf:mem7 visible false

# ------------------------------------------------------------
# INITIAL STORAGE
# ------------------------------------------------------------

data modify storage sf:system version set value "1.0"
data modify storage sf:system build set value "stabilization"
data modify storage sf:system schema set value 102
data modify storage sf:system enabled set value true
data modify storage sf:system purged set value false

data modify storage sf:player_data entries set value []
data modify storage sf:forgotten state set value "idle"

# These objectives were created above, so prevent defaults from attempting
# their earlier one-time objective migrations.
data modify storage sf:config bench_catalog_v1 set value true
data modify storage sf:config requisition_claims_v1 set value true