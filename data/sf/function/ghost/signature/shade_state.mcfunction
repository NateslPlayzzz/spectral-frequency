# ghost/signature/shade_state.mcfunction
# A Shade becomes behaviorally dormant while multiple living Investigators
# remain nearby.

scoreboard players set #shade_crowd sf.data 0

execute as @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..10] run scoreboard players add #shade_crowd sf.data 1

tag @s remove sf.shade_suppressed

execute if score #shade_crowd sf.data matches 2.. run tag @s add sf.shade_suppressed

execute if entity @s[tag=sf.shade_suppressed] run particle minecraft:smoke ~ ~0.35 ~ 0.04 0.08 0.04 0.0 1