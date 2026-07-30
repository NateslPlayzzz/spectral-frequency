# ghost/signature/shade.mcfunction
# The Shade manifests only to an Investigator who remains alone nearby.

execute if entity @s[tag=sf.shade_suppressed] run return 0

tag @a remove sf.signature_target

execute as @p[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..12] at @s unless entity @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=0.1..6] run tag @s add sf.signature_target

execute unless entity @a[tag=sf.signature_target] run return 0

execute as @a[tag=sf.signature_target] at @s run playsound minecraft:entity.vex.ambient hostile @s ~ ~ ~ 0.22 0.3
execute as @a[tag=sf.signature_target] at @s run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.4 0.2
execute as @a[tag=sf.signature_target] at @s run particle minecraft:ash ~ ~1 ~ 0.3 0.4 0.3 0.01 7

title @a[tag=sf.signature_target] times 0 20 5
title @a[tag=sf.signature_target] title {"text":" "}
title @a[tag=sf.signature_target] subtitle {"text":"it waited for you to be alone","color":"dark_gray","italic":true}

tag @a remove sf.signature_target