# player/revive/clear_player.mcfunction
# Removes a stale rescuer state after disconnect, case cleanup, or entity loss.

tag @s remove sf.reviving
scoreboard players set @s sf.revive_progress 0