# case/reset.mcfunction
# Clears all case-local evidence, reading, and channel state.

scoreboard players set @s sf.log_emf 0
scoreboard players set @s sf.log_thermo 0
scoreboard players set @s sf.log_box 0
scoreboard players set @s sf.log_writing 0
scoreboard players set @s sf.log_uv 0
scoreboard players set @s sf.log_echo 0
scoreboard players set @s sf.log_decay 0

scoreboard players set @s sf.read_type 0
scoreboard players set @s sf.read_val 0
scoreboard players set @s sf.read_timer 0

scoreboard players set @s sf.writing_active 0
scoreboard players set @s sf.writing_timer 0

scoreboard players set @s sf.contain_progress 0
scoreboard players set @s sf.contain_active 0

tag @s remove sf.evidence_new