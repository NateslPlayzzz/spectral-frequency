# ghost/signature/revenant.mcfunction
# Low-Memory Investigators hear the Revenant's pursuit rhythm before a Hunt.

tag @a remove sf.signature_target

execute as @p[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0,sf.coherence=..39},distance=..14] run tag @s add sf.signature_target

execute unless entity @a[tag=sf.signature_target] run return 0

execute as @a[tag=sf.signature_target] at @s run playsound minecraft:entity.warden.heartbeat hostile @s ~ ~ ~ 0.6 1.25
execute as @a[tag=sf.signature_target] at @s run playsound minecraft:block.deepslate.step hostile @s ~ ~ ~ 0.5 0.55
execute as @a[tag=sf.signature_target] at @s run particle minecraft:ash ~ ~1 ~ 0.25 0.35 0.25 0.01 6

tag @a remove sf.signature_target