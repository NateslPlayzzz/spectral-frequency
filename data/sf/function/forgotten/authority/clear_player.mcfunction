# forgotten/authority/clear_player.mcfunction
# Removes finale runtime state from players who are not the stored witness.

tag @s remove sf.forgotten_witness
tag @s remove sf.forgotten_active
tag @s remove sf.at_threshold

scoreboard players set @s sf.forgotten_phase 0
scoreboard players set @s sf.recon_pull 0
scoreboard players set @s sf.vigil_timer 0
scoreboard players set @s sf.choice_hold 0
scoreboard players set @s sf.choice_path 0