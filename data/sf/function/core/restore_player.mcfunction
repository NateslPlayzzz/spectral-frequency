# core/restore_player.mcfunction
# Restores a Taken player when no valid case owns that state.

scoreboard players set @s sf.claimed 0
scoreboard players set @s sf.coherence 35
scoreboard players set @s sf.revive_progress 0

gamemode survival @s

effect clear @s minecraft:blindness
effect clear @s minecraft:darkness
effect clear @s minecraft:slowness
effect clear @s minecraft:resistance

tag @s remove sf.solo_release_pending
tag @s remove sf.reviving

function sf:case/clear_runtime_player