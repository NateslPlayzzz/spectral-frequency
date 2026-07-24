# ghost/hunt/end.mcfunction

tag @s remove sf.state.hunt
tag @s remove sf.state.warning
tag @s add sf.state.cooldown

scoreboard players set @s sf.hunt_timer 0
scoreboard players operation @s sf.cooldown_timer = #hunt_cooldown sf.data

execute at @s run playsound minecraft:block.beacon.deactivate ambient @a[tag=sf.case_participant,distance=..40] ~ ~ ~ 0.6 0.7

# Only living participants who were within the Hunt area receive credit.
execute as @a[tag=sf.case_participant,scores={sf.quest=100..,sf.oq_incense=0,sf.claimed=0},distance=..40] run function sf:quest/opt/incense_done

execute as @a[tag=sf.case_participant,scores={sf.claimed=0},distance=..40] run scoreboard players set @s sf.case_survived_hunt 1

advancement grant @a[tag=sf.case_participant,scores={sf.claimed=0},distance=..40] only sf:survive_hunt