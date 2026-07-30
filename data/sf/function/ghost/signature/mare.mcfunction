# ghost/signature/mare.mcfunction
# The Mare presses inward only against an unlit Investigator who is already
# standing in darkness.

tag @a remove sf.signature_target

execute as @p[tag=sf.case_participant,tag=!spectral.lit,gamemode=!spectator,scores={sf.claimed=0},distance=..10] at @s if predicate sf:in_darkness run tag @s add sf.signature_target

execute unless entity @a[tag=sf.signature_target] run return 0

effect give @a[tag=sf.signature_target] minecraft:darkness 2 0 true

execute as @a[tag=sf.signature_target] at @s run playsound minecraft:entity.phantom.ambient hostile @s ~ ~ ~ 0.4 0.45
execute as @a[tag=sf.signature_target] at @s run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.55 0.25
execute as @a[tag=sf.signature_target] at @s run particle minecraft:smoke ~ ~1 ~ 0.35 0.45 0.35 0.02 10

title @a[tag=sf.signature_target] times 0 20 5
title @a[tag=sf.signature_target] title {"text":" "}
title @a[tag=sf.signature_target] subtitle {"text":"the dark presses inward","color":"dark_gray","italic":true}

tag @a remove sf.signature_target