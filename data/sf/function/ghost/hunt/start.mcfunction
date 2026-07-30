# ghost/hunt/start.mcfunction

tag @s remove sf.state.idle
tag @s remove sf.state.warning
tag @s remove sf.state.cooldown
tag @s add sf.state.hunt
tag @s remove sf.roaming

scoreboard players set @s sf.hunt_timer 30

# Every living participant must know that the global Hunt has begun,
# including Investigators who moved outside the immediate warning radius.
execute as @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0}] at @s run function sf:sfx/hunt_start