# forgotten/authority/idle_reset.mcfunction
# Clears transient finale state without changing permanent profile outcomes.

tag @a remove sf.forgotten_witness
tag @a remove sf.forgotten_active
tag @a remove sf.at_threshold

scoreboard players set @a sf.forgotten_phase 0
scoreboard players set @a sf.recon_pull 0
scoreboard players set @a sf.vigil_timer 0
scoreboard players set @a sf.choice_hold 0
scoreboard players set @a sf.choice_path 0