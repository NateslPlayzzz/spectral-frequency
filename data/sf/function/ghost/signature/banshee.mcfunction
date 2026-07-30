# ghost/signature/banshee.mcfunction
# The Banshee chooses one nearby Investigator rather than affecting the group
# indiscriminately.

tag @a remove sf.signature_target

execute as @p[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..12] run tag @s add sf.signature_target

execute unless entity @a[tag=sf.signature_target] run return 0

execute as @a[tag=sf.signature_target] run scoreboard players remove @s sf.coherence 1
execute as @a[tag=sf.signature_target,scores={sf.coherence=..0}] run scoreboard players set @s sf.coherence 0

execute as @a[tag=sf.signature_target] at @s run playsound minecraft:entity.ghast.scream hostile @s ~ ~ ~ 0.25 1.7
execute as @a[tag=sf.signature_target] at @s run playsound minecraft:entity.allay.ambient_without_item ambient @s ~ ~ ~ 0.45 0.35
execute as @a[tag=sf.signature_target] at @s run particle minecraft:soul ~ ~1 ~ 0.3 0.45 0.3 0.01 9

title @a[tag=sf.signature_target] times 0 20 5
title @a[tag=sf.signature_target] title {"text":" "}
title @a[tag=sf.signature_target] subtitle {"text":"one voice calls only for you","color":"#C89BFF","italic":true}

tag @a remove sf.signature_target