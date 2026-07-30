# ghost/hunt/warn.mcfunction
# Three-second pre-Hunt warning.

tag @s remove sf.state.idle
tag @s remove sf.state.cooldown
tag @s add sf.state.warning
tag @s remove sf.roaming

scoreboard players set @s sf.hunt_timer 3

particle minecraft:large_smoke ~ ~0.5 ~ 0.3 0.4 0.3 0.02 20
particle minecraft:reverse_portal ~ ~0.7 ~ 0.25 0.5 0.25 0.02 12

# Only living participants inside the endangered area receive the warning.
execute as @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..32] at @s run function sf:sfx/hunt_warning