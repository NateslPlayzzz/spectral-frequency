# tool/contain/clear_player.mcfunction
# Clears only the executing player's transient containment state.

scoreboard players set @s sf.contain_active 0
scoreboard players set @s sf.contain_progress 0

tag @s remove sf.contain_operator
tag @s remove sf.contain_probe