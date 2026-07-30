# ghost/signature/specter.mcfunction
# Produces an apparition relative to one Investigator's viewing direction,
# not at the manifestation's actual position.

tag @a remove sf.signature_target

execute as @p[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..12] run tag @s add sf.signature_target

execute unless entity @a[tag=sf.signature_target] run return 0

execute as @a[tag=sf.signature_target] at @s run particle minecraft:large_smoke ^ ^1 ^-2 0.12 0.35 0.12 0.01 10
execute as @a[tag=sf.signature_target] at @s run particle minecraft:soul ^ ^1.1 ^-2 0.08 0.25 0.08 0.0 5

execute as @a[tag=sf.signature_target] at @s run playsound minecraft:entity.enderman.stare hostile @s ~ ~ ~ 0.3 0.65
execute as @a[tag=sf.signature_target] at @s run playsound minecraft:block.amethyst_block.chime ambient @s ~ ~ ~ 0.25 0.4

title @a[tag=sf.signature_target] times 0 15 5
title @a[tag=sf.signature_target] title {"text":" "}
title @a[tag=sf.signature_target] subtitle {"text":"something stands behind you","color":"gray","italic":true}

tag @a remove sf.signature_target